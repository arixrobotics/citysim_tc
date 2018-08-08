
#include <functional>
#include <gazebo/gazebo.hh>
#include <gazebo/common/common.hh>
#include <gazebo/physics/physics.hh>
#include <ignition/math/Vector3.hh>
#include <ros/ros.h>
#include <thread>
#include "ros/callback_queue.h"
#include "ros/subscribe_options.h"
#include "std_msgs/String.h"
#include <gazebo/msgs/msgs.hh>

namespace gazebo
{
    class TopicKeypressPlugin : public WorldPlugin
    {
        public: void Load(physics::WorldPtr _world, sdf::ElementPtr /*_sdf*/)
        {
            // Make sure the ROS node for Gazebo has already been initialized
            if (!ros::isInitialized())
            {
              ROS_FATAL_STREAM("A ROS node for Gazebo has not been initialized, unable to load plugin. "
                << "Load the Gazebo system plugin 'libgazebo_ros_api_plugin.so' in the gazebo_ros package)");
              return;
            }

            ROS_INFO("ROS topic to Gazebo keypress plugin loaded. ");
            
            
            // Initialize ros, if it has not already bee initialized.
            if (!ros::isInitialized())
            {
              int argc = 0;
              char **argv = NULL;
              ros::init(argc, argv, "gazebo_client", ros::init_options::NoSigintHandler);
            }

            // Create our ROS node. This acts in a similar manner to
            // the Gazebo node
            this->rosNode.reset(new ros::NodeHandle("gazebo_client"));

            // Create a named topic, and subscribe to it.
            ros::SubscribeOptions so =
              ros::SubscribeOptions::create<std_msgs::String>(
                  "/gazebo/keypress",
                  1,
                  boost::bind(&TopicKeypressPlugin::OnRosMsg, this, _1),
                  ros::VoidPtr(), &this->rosQueue);
            this->rosSub = this->rosNode->subscribe(so);

            // Spin up the queue helper thread.
            this->rosQueueThread =
              std::thread(std::bind(&TopicKeypressPlugin::QueueThread, this));
              
            // Initialize transport
            this->node = gazebo::transport::NodePtr(new gazebo::transport::Node());
            this->node->Init();
            // Publish to Gazebo keypress topic
            this->keyboardPub = this->node->Advertise<gazebo::msgs::Any>("/gazebo/default/keyboard/keypress");
        }
   
        /// \brief Handle an incoming message from ROS
        /// \param[in] _msg A float value that is used to set the velocity
        /// of the Velodyne.
        public: void OnRosMsg(const std_msgs::StringConstPtr &_msg)
        {
          //ROS_INFO(("Hi " + (_msg->data)).c_str());
          // send the received value to Gazebo 
          msgs::Any msg;
          msg.set_type(msgs::Any_ValueType_INT32);
          msg.set_int_value((_msg->data).c_str()[0]);
          this->keyboardPub->Publish(msg);
        }

        /// \brief ROS helper function that processes messages
        private: void QueueThread()
        {
          static const double timeout = 0.01;
          while (this->rosNode->ok())
          {
            this->rosQueue.callAvailable(ros::WallDuration(timeout));
          }
        }

        //private: 
        
        /// \brief A node use for ROS transport
        private: std::unique_ptr<ros::NodeHandle> rosNode;

        /// \brief A ROS subscriber
        private: ros::Subscriber rosSub;

        /// \brief A ROS callbackqueue that helps process messages
        private: ros::CallbackQueue rosQueue;

        /// \brief A thread the keeps running the rosQueue
        private: std::thread rosQueueThread;
        
        /// \brief Node used to establish communication with gzserver.
        private: transport::NodePtr node;

        /// \brief Publisher of factory messages.
        private: transport::PublisherPtr keyboardPub;
        
    };
    GZ_REGISTER_WORLD_PLUGIN(TopicKeypressPlugin)
}
