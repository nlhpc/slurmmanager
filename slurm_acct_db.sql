-- MySQL dump 10.13  Distrib 5.5.37, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: slurm_acct_db
-- ------------------------------------------------------
-- Server version	5.5.37-1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `acct_coord_table`
--

DROP TABLE IF EXISTS `acct_coord_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acct_coord_table` (
  `creation_time` int(10) unsigned NOT NULL,
  `mod_time` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(4) DEFAULT '0',
  `acct` tinytext NOT NULL,
  `user` tinytext NOT NULL,
  PRIMARY KEY (`acct`(20),`user`(20))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acct_coord_table`
--

LOCK TABLES `acct_coord_table` WRITE;
/*!40000 ALTER TABLE `acct_coord_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `acct_coord_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acct_table`
--

DROP TABLE IF EXISTS `acct_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acct_table` (
  `creation_time` int(10) unsigned NOT NULL,
  `mod_time` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(4) DEFAULT '0',
  `name` tinytext NOT NULL,
  `description` text NOT NULL,
  `organization` text NOT NULL,
  PRIMARY KEY (`name`(20))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acct_table`
--

LOCK TABLES `acct_table` WRITE;
/*!40000 ALTER TABLE `acct_table` DISABLE KEYS */;
INSERT INTO `acct_table` VALUES (1400521966,1400521966,0,'clv','testing','nlhpc'),(1400522051,1400522051,0,'cuenta1','cuenta1','cuenta uno'),(1400521682,1400521682,0,'root','default root account','root');
/*!40000 ALTER TABLE `acct_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cluster_table`
--

DROP TABLE IF EXISTS `cluster_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cluster_table` (
  `creation_time` int(10) unsigned NOT NULL,
  `mod_time` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(4) DEFAULT '0',
  `name` tinytext NOT NULL,
  `control_host` tinytext NOT NULL,
  `control_port` int(10) unsigned NOT NULL DEFAULT '0',
  `last_port` int(10) unsigned NOT NULL DEFAULT '0',
  `rpc_version` smallint(5) unsigned NOT NULL DEFAULT '0',
  `classification` smallint(5) unsigned DEFAULT '0',
  `dimensions` smallint(5) unsigned DEFAULT '1',
  `plugin_id_select` smallint(5) unsigned DEFAULT '0',
  `flags` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`name`(20))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cluster_table`
--

LOCK TABLES `cluster_table` WRITE;
/*!40000 ALTER TABLE `cluster_table` DISABLE KEYS */;
INSERT INTO `cluster_table` VALUES (1400521875,1400853502,0,'nlhpc','127.0.0.1',6817,6817,12,0,1,102,0);
/*!40000 ALTER TABLE `cluster_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nlhpc_assoc_table`
--

DROP TABLE IF EXISTS `nlhpc_assoc_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nlhpc_assoc_table` (
  `creation_time` int(10) unsigned NOT NULL,
  `mod_time` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `is_def` tinyint(4) NOT NULL DEFAULT '0',
  `id_assoc` int(11) NOT NULL AUTO_INCREMENT,
  `user` tinytext NOT NULL,
  `acct` tinytext NOT NULL,
  `partition` tinytext NOT NULL,
  `parent_acct` tinytext NOT NULL,
  `lft` int(11) NOT NULL,
  `rgt` int(11) NOT NULL,
  `shares` int(11) NOT NULL DEFAULT '1',
  `max_jobs` int(11) DEFAULT NULL,
  `max_submit_jobs` int(11) DEFAULT NULL,
  `max_cpus_pj` int(11) DEFAULT NULL,
  `max_nodes_pj` int(11) DEFAULT NULL,
  `max_wall_pj` int(11) DEFAULT NULL,
  `max_cpu_mins_pj` bigint(20) DEFAULT NULL,
  `max_cpu_run_mins` bigint(20) DEFAULT NULL,
  `grp_jobs` int(11) DEFAULT NULL,
  `grp_submit_jobs` int(11) DEFAULT NULL,
  `grp_cpus` int(11) DEFAULT NULL,
  `grp_mem` int(11) DEFAULT NULL,
  `grp_nodes` int(11) DEFAULT NULL,
  `grp_wall` int(11) DEFAULT NULL,
  `grp_cpu_mins` bigint(20) DEFAULT NULL,
  `grp_cpu_run_mins` bigint(20) DEFAULT NULL,
  `def_qos_id` int(11) DEFAULT NULL,
  `qos` blob NOT NULL,
  `delta_qos` blob NOT NULL,
  PRIMARY KEY (`id_assoc`),
  UNIQUE KEY `user` (`user`(20),`acct`(20),`partition`(20))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nlhpc_assoc_table`
--

LOCK TABLES `nlhpc_assoc_table` WRITE;
/*!40000 ALTER TABLE `nlhpc_assoc_table` DISABLE KEYS */;
INSERT INTO `nlhpc_assoc_table` VALUES (1400521875,1400521875,0,0,1,'','root','','',1,10,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,',1,',''),(1400521884,1400521884,0,1,2,'root','root','','',8,9,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',''),(1400521966,1400521966,0,0,3,'','clv','','root',6,7,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',''),(1400522051,1400522051,0,0,4,'','cuenta1','','root',2,5,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',''),(1400522100,1400522100,0,1,5,'clv','cuenta1','','',3,4,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','');
/*!40000 ALTER TABLE `nlhpc_assoc_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nlhpc_assoc_usage_day_table`
--

DROP TABLE IF EXISTS `nlhpc_assoc_usage_day_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nlhpc_assoc_usage_day_table` (
  `creation_time` int(10) unsigned NOT NULL,
  `mod_time` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `id_assoc` int(11) NOT NULL,
  `time_start` int(10) unsigned NOT NULL,
  `alloc_cpu_secs` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_assoc`,`time_start`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nlhpc_assoc_usage_day_table`
--

LOCK TABLES `nlhpc_assoc_usage_day_table` WRITE;
/*!40000 ALTER TABLE `nlhpc_assoc_usage_day_table` DISABLE KEYS */;
INSERT INTO `nlhpc_assoc_usage_day_table` VALUES (1400844883,1400844883,0,5,1400472000,22),(1401284257,1401284257,0,5,1400817600,56);
/*!40000 ALTER TABLE `nlhpc_assoc_usage_day_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nlhpc_assoc_usage_hour_table`
--

DROP TABLE IF EXISTS `nlhpc_assoc_usage_hour_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nlhpc_assoc_usage_hour_table` (
  `creation_time` int(10) unsigned NOT NULL,
  `mod_time` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `id_assoc` int(11) NOT NULL,
  `time_start` int(10) unsigned NOT NULL,
  `alloc_cpu_secs` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_assoc`,`time_start`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nlhpc_assoc_usage_hour_table`
--

LOCK TABLES `nlhpc_assoc_usage_hour_table` WRITE;
/*!40000 ALTER TABLE `nlhpc_assoc_usage_hour_table` DISABLE KEYS */;
INSERT INTO `nlhpc_assoc_usage_hour_table` VALUES (1400522400,1400522400,0,5,1400518800,22),(1401284256,1401284256,0,5,1400850000,56);
/*!40000 ALTER TABLE `nlhpc_assoc_usage_hour_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nlhpc_assoc_usage_month_table`
--

DROP TABLE IF EXISTS `nlhpc_assoc_usage_month_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nlhpc_assoc_usage_month_table` (
  `creation_time` int(10) unsigned NOT NULL,
  `mod_time` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `id_assoc` int(11) NOT NULL,
  `time_start` int(10) unsigned NOT NULL,
  `alloc_cpu_secs` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_assoc`,`time_start`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nlhpc_assoc_usage_month_table`
--

LOCK TABLES `nlhpc_assoc_usage_month_table` WRITE;
/*!40000 ALTER TABLE `nlhpc_assoc_usage_month_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `nlhpc_assoc_usage_month_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nlhpc_event_table`
--

DROP TABLE IF EXISTS `nlhpc_event_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nlhpc_event_table` (
  `time_start` int(10) unsigned NOT NULL,
  `time_end` int(10) unsigned NOT NULL DEFAULT '0',
  `node_name` tinytext NOT NULL,
  `cluster_nodes` text NOT NULL,
  `cpu_count` int(11) NOT NULL,
  `reason` tinytext NOT NULL,
  `reason_uid` int(10) unsigned NOT NULL DEFAULT '4294967294',
  `state` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`node_name`(20),`time_start`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nlhpc_event_table`
--

LOCK TABLES `nlhpc_event_table` WRITE;
/*!40000 ALTER TABLE `nlhpc_event_table` DISABLE KEYS */;
INSERT INTO `nlhpc_event_table` VALUES (1400522280,0,'','cn[1-2]',4,'Cluster processor count',4294967294,0),(1400522278,1400522297,'cn1','',2,'cold-start',64030,0),(1400522518,1400522523,'cn1','',2,'cold-start',64030,0),(1400523413,1400525163,'cn1','',2,'Not responding',64030,2049),(1400525163,1400845285,'cn1','',2,'Not responding',64030,2049),(1400845285,1400848370,'cn1','',2,'Not responding',64030,2049),(1400848370,1400850274,'cn1','',2,'Not responding',64030,2049),(1400850274,1400853303,'cn1','',2,'Not responding',64030,2049),(1400853303,1400853315,'cn1','',2,'cold-start',64030,0),(1401452089,0,'cn1','',2,'Not responding',64030,2049),(1400522278,1400522308,'cn2','',2,'cold-start',64030,0),(1400522518,1400522523,'cn2','',2,'cold-start',64030,0),(1400523413,1400525163,'cn2','',2,'Not responding',64030,2049),(1400525163,1400845285,'cn2','',2,'Not responding',64030,2049),(1400845285,1400848370,'cn2','',2,'Not responding',64030,2049),(1400848370,1400850274,'cn2','',2,'Not responding',64030,2049),(1400850274,1400853303,'cn2','',2,'Not responding',64030,2049),(1400853303,1400853330,'cn2','',2,'cold-start',64030,0),(1401452089,0,'cn2','',2,'Not responding',64030,2049);
/*!40000 ALTER TABLE `nlhpc_event_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nlhpc_job_table`
--

DROP TABLE IF EXISTS `nlhpc_job_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nlhpc_job_table` (
  `job_db_inx` int(11) NOT NULL AUTO_INCREMENT,
  `mod_time` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `account` tinytext,
  `cpus_req` int(10) unsigned NOT NULL,
  `cpus_alloc` int(10) unsigned NOT NULL,
  `derived_ec` int(10) unsigned NOT NULL DEFAULT '0',
  `derived_es` text,
  `exit_code` int(10) unsigned NOT NULL DEFAULT '0',
  `job_name` tinytext NOT NULL,
  `id_assoc` int(10) unsigned NOT NULL,
  `id_block` tinytext,
  `id_job` int(10) unsigned NOT NULL,
  `id_qos` int(10) unsigned NOT NULL DEFAULT '0',
  `id_resv` int(10) unsigned NOT NULL,
  `id_wckey` int(10) unsigned NOT NULL,
  `id_user` int(10) unsigned NOT NULL,
  `id_group` int(10) unsigned NOT NULL,
  `kill_requid` int(11) NOT NULL DEFAULT '-1',
  `mem_req` int(10) unsigned NOT NULL DEFAULT '0',
  `nodelist` text,
  `nodes_alloc` int(10) unsigned NOT NULL,
  `node_inx` text,
  `partition` tinytext NOT NULL,
  `priority` int(10) unsigned NOT NULL,
  `state` smallint(5) unsigned NOT NULL,
  `timelimit` int(10) unsigned NOT NULL DEFAULT '0',
  `time_submit` int(10) unsigned NOT NULL DEFAULT '0',
  `time_eligible` int(10) unsigned NOT NULL DEFAULT '0',
  `time_start` int(10) unsigned NOT NULL DEFAULT '0',
  `time_end` int(10) unsigned NOT NULL DEFAULT '0',
  `time_suspended` int(10) unsigned NOT NULL DEFAULT '0',
  `gres_req` text NOT NULL,
  `gres_alloc` text NOT NULL,
  `gres_used` text NOT NULL,
  `wckey` tinytext NOT NULL,
  `track_steps` tinyint(4) NOT NULL,
  PRIMARY KEY (`job_db_inx`),
  UNIQUE KEY `id_job` (`id_job`,`id_assoc`,`time_submit`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nlhpc_job_table`
--

LOCK TABLES `nlhpc_job_table` WRITE;
/*!40000 ALTER TABLE `nlhpc_job_table` DISABLE KEYS */;
INSERT INTO `nlhpc_job_table` VALUES (1,0,0,'cuenta1',1,2,0,NULL,0,'testing',5,NULL,2,1,0,0,1000,1000,-1,0,'cn1',1,'0','debug',4294901759,3,1,1400522367,1400522367,1400522367,1400522378,0,'','','','',0),(2,0,0,'cuenta1',1,2,0,NULL,0,'testing',5,NULL,2,1,0,0,1000,1000,-1,0,'cn1',1,'0','debug',4294901759,3,1,1400853435,1400853435,1400853435,1400853463,0,'','','','',0);
/*!40000 ALTER TABLE `nlhpc_job_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nlhpc_last_ran_table`
--

DROP TABLE IF EXISTS `nlhpc_last_ran_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nlhpc_last_ran_table` (
  `hourly_rollup` int(10) unsigned NOT NULL DEFAULT '0',
  `daily_rollup` int(10) unsigned NOT NULL DEFAULT '0',
  `monthly_rollup` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nlhpc_last_ran_table`
--

LOCK TABLES `nlhpc_last_ran_table` WRITE;
/*!40000 ALTER TABLE `nlhpc_last_ran_table` DISABLE KEYS */;
INSERT INTO `nlhpc_last_ran_table` VALUES (1401451200,1401422400,1400522247);
/*!40000 ALTER TABLE `nlhpc_last_ran_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nlhpc_resv_table`
--

DROP TABLE IF EXISTS `nlhpc_resv_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nlhpc_resv_table` (
  `id_resv` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `assoclist` text NOT NULL,
  `cpus` int(10) unsigned NOT NULL,
  `flags` smallint(5) unsigned NOT NULL DEFAULT '0',
  `nodelist` text NOT NULL,
  `node_inx` text NOT NULL,
  `resv_name` text NOT NULL,
  `time_start` int(10) unsigned NOT NULL DEFAULT '0',
  `time_end` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_resv`,`time_start`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nlhpc_resv_table`
--

LOCK TABLES `nlhpc_resv_table` WRITE;
/*!40000 ALTER TABLE `nlhpc_resv_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `nlhpc_resv_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nlhpc_step_table`
--

DROP TABLE IF EXISTS `nlhpc_step_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nlhpc_step_table` (
  `job_db_inx` int(11) NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `cpus_alloc` int(10) unsigned NOT NULL,
  `exit_code` int(11) NOT NULL DEFAULT '0',
  `id_step` int(11) NOT NULL,
  `kill_requid` int(11) NOT NULL DEFAULT '-1',
  `nodelist` text NOT NULL,
  `nodes_alloc` int(10) unsigned NOT NULL,
  `node_inx` text,
  `state` smallint(5) unsigned NOT NULL,
  `step_name` text NOT NULL,
  `task_cnt` int(10) unsigned NOT NULL,
  `task_dist` smallint(6) NOT NULL DEFAULT '0',
  `time_start` int(10) unsigned NOT NULL DEFAULT '0',
  `time_end` int(10) unsigned NOT NULL DEFAULT '0',
  `time_suspended` int(10) unsigned NOT NULL DEFAULT '0',
  `user_sec` int(10) unsigned NOT NULL DEFAULT '0',
  `user_usec` int(10) unsigned NOT NULL DEFAULT '0',
  `sys_sec` int(10) unsigned NOT NULL DEFAULT '0',
  `sys_usec` int(10) unsigned NOT NULL DEFAULT '0',
  `max_pages` int(10) unsigned NOT NULL DEFAULT '0',
  `max_pages_task` int(10) unsigned NOT NULL DEFAULT '0',
  `max_pages_node` int(10) unsigned NOT NULL DEFAULT '0',
  `ave_pages` double unsigned NOT NULL DEFAULT '0',
  `max_rss` bigint(20) unsigned NOT NULL DEFAULT '0',
  `max_rss_task` int(10) unsigned NOT NULL DEFAULT '0',
  `max_rss_node` int(10) unsigned NOT NULL DEFAULT '0',
  `ave_rss` double unsigned NOT NULL DEFAULT '0',
  `max_vsize` bigint(20) unsigned NOT NULL DEFAULT '0',
  `max_vsize_task` int(10) unsigned NOT NULL DEFAULT '0',
  `max_vsize_node` int(10) unsigned NOT NULL DEFAULT '0',
  `ave_vsize` double unsigned NOT NULL DEFAULT '0',
  `min_cpu` int(10) unsigned NOT NULL DEFAULT '0',
  `min_cpu_task` int(10) unsigned NOT NULL DEFAULT '0',
  `min_cpu_node` int(10) unsigned NOT NULL DEFAULT '0',
  `ave_cpu` double unsigned NOT NULL DEFAULT '0',
  `act_cpufreq` double unsigned NOT NULL DEFAULT '0',
  `consumed_energy` double unsigned NOT NULL DEFAULT '0',
  `req_cpufreq` int(10) unsigned NOT NULL DEFAULT '0',
  `max_disk_read` double unsigned NOT NULL DEFAULT '0',
  `max_disk_read_task` int(10) unsigned NOT NULL DEFAULT '0',
  `max_disk_read_node` int(10) unsigned NOT NULL DEFAULT '0',
  `ave_disk_read` double unsigned NOT NULL DEFAULT '0',
  `max_disk_write` double unsigned NOT NULL DEFAULT '0',
  `max_disk_write_task` int(10) unsigned NOT NULL DEFAULT '0',
  `max_disk_write_node` int(10) unsigned NOT NULL DEFAULT '0',
  `ave_disk_write` double unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`job_db_inx`,`id_step`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nlhpc_step_table`
--

LOCK TABLES `nlhpc_step_table` WRITE;
/*!40000 ALTER TABLE `nlhpc_step_table` DISABLE KEYS */;
INSERT INTO `nlhpc_step_table` VALUES (1,0,1,0,-2,-1,'cn1',1,'0',3,'batch',1,0,1400522367,1400522378,0,0,8000,0,24000,1,0,0,1,2664,0,0,2236,185292,0,0,23424,0,0,0,0,1891046,0,0,0.009077,0,0,0.009077,0.000011,0,0,0.000011),(2,0,1,0,-2,-1,'cn1',1,'0',3,'batch',1,0,1400853435,1400853463,0,0,8000,0,0,1,0,0,1,2664,0,0,2236,185292,0,0,23424,0,0,0,0,1887066,0,0,0.009077,0,0,0.009077,0.000006,0,0,0.000006);
/*!40000 ALTER TABLE `nlhpc_step_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nlhpc_suspend_table`
--

DROP TABLE IF EXISTS `nlhpc_suspend_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nlhpc_suspend_table` (
  `job_db_inx` int(11) NOT NULL,
  `id_assoc` int(11) NOT NULL,
  `time_start` int(10) unsigned NOT NULL DEFAULT '0',
  `time_end` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nlhpc_suspend_table`
--

LOCK TABLES `nlhpc_suspend_table` WRITE;
/*!40000 ALTER TABLE `nlhpc_suspend_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `nlhpc_suspend_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nlhpc_usage_day_table`
--

DROP TABLE IF EXISTS `nlhpc_usage_day_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nlhpc_usage_day_table` (
  `creation_time` int(10) unsigned NOT NULL,
  `mod_time` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `time_start` int(10) unsigned NOT NULL,
  `cpu_count` int(11) NOT NULL DEFAULT '0',
  `alloc_cpu_secs` bigint(20) NOT NULL DEFAULT '0',
  `down_cpu_secs` bigint(20) NOT NULL DEFAULT '0',
  `pdown_cpu_secs` bigint(20) NOT NULL DEFAULT '0',
  `idle_cpu_secs` bigint(20) NOT NULL DEFAULT '0',
  `resv_cpu_secs` bigint(20) NOT NULL DEFAULT '0',
  `over_cpu_secs` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`time_start`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nlhpc_usage_day_table`
--

LOCK TABLES `nlhpc_usage_day_table` WRITE;
/*!40000 ALTER TABLE `nlhpc_usage_day_table` DISABLE KEYS */;
INSERT INTO `nlhpc_usage_day_table` VALUES (1400844883,1400844883,0,1400472000,4,22,140058,0,4400,0,0),(1400844883,1400844883,0,1400558400,4,0,345600,0,0,0,0),(1400844883,1400844883,0,1400644800,4,0,345600,0,0,0,0),(1400844883,1400844883,0,1400731200,4,0,345600,0,0,0,0),(1401284257,1401284257,0,1400817600,4,56,142890,0,202654,0,0),(1401284257,1401284257,0,1400904000,4,0,0,0,345600,0,0),(1401284257,1401284257,0,1400990400,4,0,0,0,345600,0,0),(1401284257,1401284257,0,1401076800,4,0,0,0,345600,0,0),(1401284257,1401284257,0,1401163200,4,0,0,0,345600,0,0),(1401451450,1401451450,0,1401249600,4,0,0,0,345600,0,0),(1401451450,1401451450,0,1401336000,4,0,0,0,345600,0,0);
/*!40000 ALTER TABLE `nlhpc_usage_day_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nlhpc_usage_hour_table`
--

DROP TABLE IF EXISTS `nlhpc_usage_hour_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nlhpc_usage_hour_table` (
  `creation_time` int(10) unsigned NOT NULL,
  `mod_time` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `time_start` int(10) unsigned NOT NULL,
  `cpu_count` int(11) NOT NULL DEFAULT '0',
  `alloc_cpu_secs` bigint(20) NOT NULL DEFAULT '0',
  `down_cpu_secs` bigint(20) NOT NULL DEFAULT '0',
  `pdown_cpu_secs` bigint(20) NOT NULL DEFAULT '0',
  `idle_cpu_secs` bigint(20) NOT NULL DEFAULT '0',
  `resv_cpu_secs` bigint(20) NOT NULL DEFAULT '0',
  `over_cpu_secs` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`time_start`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nlhpc_usage_hour_table`
--

LOCK TABLES `nlhpc_usage_hour_table` WRITE;
/*!40000 ALTER TABLE `nlhpc_usage_hour_table` DISABLE KEYS */;
INSERT INTO `nlhpc_usage_hour_table` VALUES (1400522400,1400522400,0,1400522280,4,22,90,0,368,0,0),(1400526000,1400526000,0,1400522400,4,0,10368,0,4032,0,0),(1400844883,1400844883,0,1400526000,4,0,14400,0,0,0,0),(1400844883,1400844883,0,1400529600,4,0,14400,0,0,0,0),(1400844883,1400844883,0,1400533200,4,0,14400,0,0,0,0),(1400844883,1400844883,0,1400536800,4,0,14400,0,0,0,0),(1400844883,1400844883,0,1400540400,4,0,14400,0,0,0,0),(1400844883,1400844883,0,1400544000,4,0,14400,0,0,0,0),(1400844883,1400844883,0,1400547600,4,0,14400,0,0,0,0),(1400844883,1400844883,0,1400551200,4,0,14400,0,0,0,0),(1400844883,1400844883,0,1400554800,4,0,14400,0,0,0,0),(1400844883,1400844883,0,1400558400,4,0,14400,0,0,0,0),(1400844883,1400844883,0,1400562000,4,0,14400,0,0,0,0),(1400844883,1400844883,0,1400565600,4,0,14400,0,0,0,0),(1400844883,1400844883,0,1400569200,4,0,14400,0,0,0,0),(1400844883,1400844883,0,1400572800,4,0,14400,0,0,0,0),(1400844883,1400844883,0,1400576400,4,0,14400,0,0,0,0),(1400844883,1400844883,0,1400580000,4,0,14400,0,0,0,0),(1400844883,1400844883,0,1400583600,4,0,14400,0,0,0,0),(1400844883,1400844883,0,1400587200,4,0,14400,0,0,0,0),(1400844883,1400844883,0,1400590800,4,0,14400,0,0,0,0),(1400844883,1400844883,0,1400594400,4,0,14400,0,0,0,0),(1400844883,1400844883,0,1400598000,4,0,14400,0,0,0,0),(1400844883,1400844883,0,1400601600,4,0,14400,0,0,0,0),(1400844883,1400844883,0,1400605200,4,0,14400,0,0,0,0),(1400844883,1400844883,0,1400608800,4,0,14400,0,0,0,0),(1400844883,1400844883,0,1400612400,4,0,14400,0,0,0,0),(1400844883,1400844883,0,1400616000,4,0,14400,0,0,0,0),(1400844883,1400844883,0,1400619600,4,0,14400,0,0,0,0),(1400844883,1400844883,0,1400623200,4,0,14400,0,0,0,0),(1400844883,1400844883,0,1400626800,4,0,14400,0,0,0,0),(1400844883,1400844883,0,1400630400,4,0,14400,0,0,0,0),(1400844883,1400844883,0,1400634000,4,0,14400,0,0,0,0),(1400844883,1400844883,0,1400637600,4,0,14400,0,0,0,0),(1400844883,1400844883,0,1400641200,4,0,14400,0,0,0,0),(1400844883,1400844883,0,1400644800,4,0,14400,0,0,0,0),(1400844883,1400844883,0,1400648400,4,0,14400,0,0,0,0),(1400844883,1400844883,0,1400652000,4,0,14400,0,0,0,0),(1400844883,1400844883,0,1400655600,4,0,14400,0,0,0,0),(1400844883,1400844883,0,1400659200,4,0,14400,0,0,0,0),(1400844883,1400844883,0,1400662800,4,0,14400,0,0,0,0),(1400844883,1400844883,0,1400666400,4,0,14400,0,0,0,0),(1400844883,1400844883,0,1400670000,4,0,14400,0,0,0,0),(1400844883,1400844883,0,1400673600,4,0,14400,0,0,0,0),(1400844883,1400844883,0,1400677200,4,0,14400,0,0,0,0),(1400844883,1400844883,0,1400680800,4,0,14400,0,0,0,0),(1400844883,1400844883,0,1400684400,4,0,14400,0,0,0,0),(1400844883,1400844883,0,1400688000,4,0,14400,0,0,0,0),(1400844883,1400844883,0,1400691600,4,0,14400,0,0,0,0),(1400844883,1400844883,0,1400695200,4,0,14400,0,0,0,0),(1400844883,1400844883,0,1400698800,4,0,14400,0,0,0,0),(1400844883,1400844883,0,1400702400,4,0,14400,0,0,0,0),(1400844883,1400844883,0,1400706000,4,0,14400,0,0,0,0),(1400844883,1400844883,0,1400709600,4,0,14400,0,0,0,0),(1400844883,1400844883,0,1400713200,4,0,14400,0,0,0,0),(1400844883,1400844883,0,1400716800,4,0,14400,0,0,0,0),(1400844883,1400844883,0,1400720400,4,0,14400,0,0,0,0),(1400844883,1400844883,0,1400724000,4,0,14400,0,0,0,0),(1400844883,1400844883,0,1400727600,4,0,14400,0,0,0,0),(1400844883,1400844883,0,1400731200,4,0,14400,0,0,0,0),(1400844883,1400844883,0,1400734800,4,0,14400,0,0,0,0),(1400844883,1400844883,0,1400738400,4,0,14400,0,0,0,0),(1400844883,1400844883,0,1400742000,4,0,14400,0,0,0,0),(1400844883,1400844883,0,1400745600,4,0,14400,0,0,0,0),(1400844883,1400844883,0,1400749200,4,0,14400,0,0,0,0),(1400844883,1400844883,0,1400752800,4,0,14400,0,0,0,0),(1400844883,1400844883,0,1400756400,4,0,14400,0,0,0,0),(1400844883,1400844883,0,1400760000,4,0,14400,0,0,0,0),(1400844883,1400844883,0,1400763600,4,0,14400,0,0,0,0),(1400844883,1400844883,0,1400767200,4,0,14400,0,0,0,0),(1400844883,1400844883,0,1400770800,4,0,14400,0,0,0,0),(1400844883,1400844883,0,1400774400,4,0,14400,0,0,0,0),(1400844883,1400844883,0,1400778000,4,0,14400,0,0,0,0),(1400844883,1400844883,0,1400781600,4,0,14400,0,0,0,0),(1400844883,1400844883,0,1400785200,4,0,14400,0,0,0,0),(1400844883,1400844883,0,1400788800,4,0,14400,0,0,0,0),(1400844883,1400844883,0,1400792400,4,0,14400,0,0,0,0),(1400844883,1400844883,0,1400796000,4,0,14400,0,0,0,0),(1400844883,1400844883,0,1400799600,4,0,14400,0,0,0,0),(1400844883,1400844883,0,1400803200,4,0,14400,0,0,0,0),(1400844883,1400844883,0,1400806800,4,0,14400,0,0,0,0),(1400844883,1400844883,0,1400810400,4,0,14400,0,0,0,0),(1400844883,1400844883,0,1400814000,4,0,14400,0,0,0,0),(1400844883,1400844883,0,1400817600,4,0,14400,0,0,0,0),(1400844883,1400844883,0,1400821200,4,0,14400,0,0,0,0),(1400844883,1400844883,0,1400824800,4,0,14400,0,0,0,0),(1400844883,1400844883,0,1400828400,4,0,14400,0,0,0,0),(1400844883,1400844883,0,1400832000,4,0,14400,0,0,0,0),(1400844883,1400844883,0,1400835600,4,0,14400,0,0,0,0),(1400844883,1400844883,0,1400839200,4,0,14400,0,0,0,0),(1400846400,1400846400,0,1400842800,4,0,14400,0,0,0,0),(1400850000,1400850000,0,1400846400,4,0,14400,0,0,0,0),(1401284256,1401284256,0,1400850000,4,56,13290,0,1054,0,0),(1401284256,1401284256,0,1400853600,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1400857200,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1400860800,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1400864400,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1400868000,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1400871600,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1400875200,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1400878800,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1400882400,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1400886000,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1400889600,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1400893200,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1400896800,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1400900400,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1400904000,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1400907600,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1400911200,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1400914800,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1400918400,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1400922000,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1400925600,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1400929200,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1400932800,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1400936400,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1400940000,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1400943600,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1400947200,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1400950800,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1400954400,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1400958000,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1400961600,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1400965200,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1400968800,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1400972400,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1400976000,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1400979600,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1400983200,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1400986800,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1400990400,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1400994000,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1400997600,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1401001200,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1401004800,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1401008400,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1401012000,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1401015600,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1401019200,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1401022800,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1401026400,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1401030000,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1401033600,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1401037200,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1401040800,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1401044400,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1401048000,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1401051600,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1401055200,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1401058800,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1401062400,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1401066000,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1401069600,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1401073200,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1401076800,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1401080400,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1401084000,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1401087600,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1401091200,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1401094800,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1401098400,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1401102000,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1401105600,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1401109200,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1401112800,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1401116400,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1401120000,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1401123600,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1401127200,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1401130800,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1401134400,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1401138000,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1401141600,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1401145200,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1401148800,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1401152400,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1401156000,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1401159600,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1401163200,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1401166800,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1401170400,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1401174000,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1401177600,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1401181200,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1401184800,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1401188400,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1401192000,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1401195600,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1401199200,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1401202800,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1401206400,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1401210000,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1401213600,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1401217200,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1401220800,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1401224400,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1401228000,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1401231600,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1401235200,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1401238800,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1401242400,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1401246000,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1401249600,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1401253200,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1401256800,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1401260400,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1401264000,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1401267600,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1401271200,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1401274800,4,0,0,0,14400,0,0),(1401284256,1401284256,0,1401278400,4,0,0,0,14400,0,0),(1401451449,1401451449,0,1401282000,4,0,0,0,14400,0,0),(1401451449,1401451449,0,1401285600,4,0,0,0,14400,0,0),(1401451449,1401451449,0,1401289200,4,0,0,0,14400,0,0),(1401451449,1401451449,0,1401292800,4,0,0,0,14400,0,0),(1401451449,1401451449,0,1401296400,4,0,0,0,14400,0,0),(1401451449,1401451449,0,1401300000,4,0,0,0,14400,0,0),(1401451449,1401451449,0,1401303600,4,0,0,0,14400,0,0),(1401451449,1401451449,0,1401307200,4,0,0,0,14400,0,0),(1401451449,1401451449,0,1401310800,4,0,0,0,14400,0,0),(1401451449,1401451449,0,1401314400,4,0,0,0,14400,0,0),(1401451449,1401451449,0,1401318000,4,0,0,0,14400,0,0),(1401451449,1401451449,0,1401321600,4,0,0,0,14400,0,0),(1401451449,1401451449,0,1401325200,4,0,0,0,14400,0,0),(1401451449,1401451449,0,1401328800,4,0,0,0,14400,0,0),(1401451449,1401451449,0,1401332400,4,0,0,0,14400,0,0),(1401451449,1401451449,0,1401336000,4,0,0,0,14400,0,0),(1401451449,1401451449,0,1401339600,4,0,0,0,14400,0,0),(1401451449,1401451449,0,1401343200,4,0,0,0,14400,0,0),(1401451449,1401451449,0,1401346800,4,0,0,0,14400,0,0),(1401451449,1401451449,0,1401350400,4,0,0,0,14400,0,0),(1401451449,1401451449,0,1401354000,4,0,0,0,14400,0,0),(1401451449,1401451449,0,1401357600,4,0,0,0,14400,0,0),(1401451449,1401451449,0,1401361200,4,0,0,0,14400,0,0),(1401451449,1401451449,0,1401364800,4,0,0,0,14400,0,0),(1401451449,1401451449,0,1401368400,4,0,0,0,14400,0,0),(1401451449,1401451449,0,1401372000,4,0,0,0,14400,0,0),(1401451449,1401451449,0,1401375600,4,0,0,0,14400,0,0),(1401451449,1401451449,0,1401379200,4,0,0,0,14400,0,0),(1401451449,1401451449,0,1401382800,4,0,0,0,14400,0,0),(1401451449,1401451449,0,1401386400,4,0,0,0,14400,0,0),(1401451449,1401451449,0,1401390000,4,0,0,0,14400,0,0),(1401451449,1401451449,0,1401393600,4,0,0,0,14400,0,0),(1401451449,1401451449,0,1401397200,4,0,0,0,14400,0,0),(1401451449,1401451449,0,1401400800,4,0,0,0,14400,0,0),(1401451449,1401451449,0,1401404400,4,0,0,0,14400,0,0),(1401451449,1401451449,0,1401408000,4,0,0,0,14400,0,0),(1401451449,1401451449,0,1401411600,4,0,0,0,14400,0,0),(1401451449,1401451449,0,1401415200,4,0,0,0,14400,0,0),(1401451449,1401451449,0,1401418800,4,0,0,0,14400,0,0),(1401451449,1401451449,0,1401422400,4,0,0,0,14400,0,0),(1401451449,1401451449,0,1401426000,4,0,0,0,14400,0,0),(1401451449,1401451449,0,1401429600,4,0,0,0,14400,0,0),(1401451449,1401451449,0,1401433200,4,0,0,0,14400,0,0),(1401451449,1401451449,0,1401436800,4,0,0,0,14400,0,0),(1401451449,1401451449,0,1401440400,4,0,0,0,14400,0,0),(1401451449,1401451449,0,1401444000,4,0,0,0,14400,0,0),(1401451449,1401451449,0,1401447600,4,0,0,0,14400,0,0);
/*!40000 ALTER TABLE `nlhpc_usage_hour_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nlhpc_usage_month_table`
--

DROP TABLE IF EXISTS `nlhpc_usage_month_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nlhpc_usage_month_table` (
  `creation_time` int(10) unsigned NOT NULL,
  `mod_time` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `time_start` int(10) unsigned NOT NULL,
  `cpu_count` int(11) NOT NULL DEFAULT '0',
  `alloc_cpu_secs` bigint(20) NOT NULL DEFAULT '0',
  `down_cpu_secs` bigint(20) NOT NULL DEFAULT '0',
  `pdown_cpu_secs` bigint(20) NOT NULL DEFAULT '0',
  `idle_cpu_secs` bigint(20) NOT NULL DEFAULT '0',
  `resv_cpu_secs` bigint(20) NOT NULL DEFAULT '0',
  `over_cpu_secs` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`time_start`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nlhpc_usage_month_table`
--

LOCK TABLES `nlhpc_usage_month_table` WRITE;
/*!40000 ALTER TABLE `nlhpc_usage_month_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `nlhpc_usage_month_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nlhpc_wckey_table`
--

DROP TABLE IF EXISTS `nlhpc_wckey_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nlhpc_wckey_table` (
  `creation_time` int(10) unsigned NOT NULL,
  `mod_time` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `is_def` tinyint(4) NOT NULL DEFAULT '0',
  `id_wckey` int(11) NOT NULL AUTO_INCREMENT,
  `wckey_name` tinytext NOT NULL,
  `user` tinytext NOT NULL,
  PRIMARY KEY (`id_wckey`),
  UNIQUE KEY `wckey_name` (`wckey_name`(20),`user`(20))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nlhpc_wckey_table`
--

LOCK TABLES `nlhpc_wckey_table` WRITE;
/*!40000 ALTER TABLE `nlhpc_wckey_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `nlhpc_wckey_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nlhpc_wckey_usage_day_table`
--

DROP TABLE IF EXISTS `nlhpc_wckey_usage_day_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nlhpc_wckey_usage_day_table` (
  `creation_time` int(10) unsigned NOT NULL,
  `mod_time` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `id_wckey` int(11) NOT NULL,
  `time_start` int(10) unsigned NOT NULL,
  `alloc_cpu_secs` bigint(20) DEFAULT '0',
  `resv_cpu_secs` bigint(20) DEFAULT '0',
  `over_cpu_secs` bigint(20) DEFAULT '0',
  PRIMARY KEY (`id_wckey`,`time_start`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nlhpc_wckey_usage_day_table`
--

LOCK TABLES `nlhpc_wckey_usage_day_table` WRITE;
/*!40000 ALTER TABLE `nlhpc_wckey_usage_day_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `nlhpc_wckey_usage_day_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nlhpc_wckey_usage_hour_table`
--

DROP TABLE IF EXISTS `nlhpc_wckey_usage_hour_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nlhpc_wckey_usage_hour_table` (
  `creation_time` int(10) unsigned NOT NULL,
  `mod_time` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `id_wckey` int(11) NOT NULL,
  `time_start` int(10) unsigned NOT NULL,
  `alloc_cpu_secs` bigint(20) DEFAULT '0',
  `resv_cpu_secs` bigint(20) DEFAULT '0',
  `over_cpu_secs` bigint(20) DEFAULT '0',
  PRIMARY KEY (`id_wckey`,`time_start`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nlhpc_wckey_usage_hour_table`
--

LOCK TABLES `nlhpc_wckey_usage_hour_table` WRITE;
/*!40000 ALTER TABLE `nlhpc_wckey_usage_hour_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `nlhpc_wckey_usage_hour_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nlhpc_wckey_usage_month_table`
--

DROP TABLE IF EXISTS `nlhpc_wckey_usage_month_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nlhpc_wckey_usage_month_table` (
  `creation_time` int(10) unsigned NOT NULL,
  `mod_time` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `id_wckey` int(11) NOT NULL,
  `time_start` int(10) unsigned NOT NULL,
  `alloc_cpu_secs` bigint(20) DEFAULT '0',
  `resv_cpu_secs` bigint(20) DEFAULT '0',
  `over_cpu_secs` bigint(20) DEFAULT '0',
  PRIMARY KEY (`id_wckey`,`time_start`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nlhpc_wckey_usage_month_table`
--

LOCK TABLES `nlhpc_wckey_usage_month_table` WRITE;
/*!40000 ALTER TABLE `nlhpc_wckey_usage_month_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `nlhpc_wckey_usage_month_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qos_table`
--

DROP TABLE IF EXISTS `qos_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qos_table` (
  `creation_time` int(10) unsigned NOT NULL,
  `mod_time` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(4) DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` tinytext NOT NULL,
  `description` text,
  `flags` int(10) unsigned DEFAULT '0',
  `grace_time` int(10) unsigned DEFAULT NULL,
  `max_jobs_per_user` int(11) DEFAULT NULL,
  `max_submit_jobs_per_user` int(11) DEFAULT NULL,
  `max_cpus_per_job` int(11) DEFAULT NULL,
  `max_cpus_per_user` int(11) DEFAULT NULL,
  `max_nodes_per_job` int(11) DEFAULT NULL,
  `max_nodes_per_user` int(11) DEFAULT NULL,
  `max_wall_duration_per_job` int(11) DEFAULT NULL,
  `max_cpu_mins_per_job` bigint(20) DEFAULT NULL,
  `max_cpu_run_mins_per_user` bigint(20) DEFAULT NULL,
  `grp_jobs` int(11) DEFAULT NULL,
  `grp_submit_jobs` int(11) DEFAULT NULL,
  `grp_cpus` int(11) DEFAULT NULL,
  `grp_mem` int(11) DEFAULT NULL,
  `grp_nodes` int(11) DEFAULT NULL,
  `grp_wall` int(11) DEFAULT NULL,
  `grp_cpu_mins` bigint(20) DEFAULT NULL,
  `grp_cpu_run_mins` bigint(20) DEFAULT NULL,
  `preempt` text NOT NULL,
  `preempt_mode` int(11) DEFAULT '0',
  `priority` int(10) unsigned DEFAULT '0',
  `usage_factor` double NOT NULL DEFAULT '1',
  `usage_thres` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`(20))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qos_table`
--

LOCK TABLES `qos_table` WRITE;
/*!40000 ALTER TABLE `qos_table` DISABLE KEYS */;
INSERT INTO `qos_table` VALUES (1400521682,1400521682,0,1,'normal','Normal QOS default',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',0,0,1,NULL);
/*!40000 ALTER TABLE `qos_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table_defs_table`
--

DROP TABLE IF EXISTS `table_defs_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `table_defs_table` (
  `creation_time` int(10) unsigned NOT NULL,
  `mod_time` int(10) unsigned NOT NULL DEFAULT '0',
  `table_name` text NOT NULL,
  `definition` text NOT NULL,
  PRIMARY KEY (`table_name`(50))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_defs_table`
--

LOCK TABLES `table_defs_table` WRITE;
/*!40000 ALTER TABLE `table_defs_table` DISABLE KEYS */;
INSERT INTO `table_defs_table` VALUES (1400521875,1400521875,'\"nlhpc_assoc_table\"','alter table \"nlhpc_assoc_table\" modify creation_time int unsigned not null, modify mod_time int unsigned default 0 not null, modify deleted tinyint default 0 not null, modify is_def tinyint default 0 not null, modify id_assoc int not null auto_increment, modify user tinytext not null default \'\', modify acct tinytext not null, modify partition tinytext not null default \'\', modify parent_acct tinytext not null default \'\', modify lft int not null, modify rgt int not null, modify shares int default 1 not null, modify max_jobs int default NULL, modify max_submit_jobs int default NULL, modify max_cpus_pj int default NULL, modify max_nodes_pj int default NULL, modify max_wall_pj int default NULL, modify max_cpu_mins_pj bigint default NULL, modify max_cpu_run_mins bigint default NULL, modify grp_jobs int default NULL, modify grp_submit_jobs int default NULL, modify grp_cpus int default NULL, modify grp_mem int default NULL, modify grp_nodes int default NULL, modify grp_wall int default NULL, modify grp_cpu_mins bigint default NULL, modify grp_cpu_run_mins bigint default NULL, modify def_qos_id int default NULL, modify qos blob not null default \'\', modify delta_qos blob not null default \'\', drop primary key, add primary key (id_assoc), drop index user, add unique index (user(20), acct(20), partition(20));'),(1400521876,1400521876,'\"nlhpc_assoc_usage_day_table\"','alter table \"nlhpc_assoc_usage_day_table\" modify creation_time int unsigned not null, modify mod_time int unsigned default 0 not null, modify deleted tinyint default 0 not null, modify id_assoc int not null, modify time_start int unsigned not null, modify alloc_cpu_secs bigint default 0 not null, drop primary key, add primary key (id_assoc, time_start);'),(1400521877,1400521877,'\"nlhpc_assoc_usage_hour_table\"','alter table \"nlhpc_assoc_usage_hour_table\" modify creation_time int unsigned not null, modify mod_time int unsigned default 0 not null, modify deleted tinyint default 0 not null, modify id_assoc int not null, modify time_start int unsigned not null, modify alloc_cpu_secs bigint default 0 not null, drop primary key, add primary key (id_assoc, time_start);'),(1400521878,1400521878,'\"nlhpc_assoc_usage_month_table\"','alter table \"nlhpc_assoc_usage_month_table\" modify creation_time int unsigned not null, modify mod_time int unsigned default 0 not null, modify deleted tinyint default 0 not null, modify id_assoc int not null, modify time_start int unsigned not null, modify alloc_cpu_secs bigint default 0 not null, drop primary key, add primary key (id_assoc, time_start);'),(1400521879,1400521879,'\"nlhpc_event_table\"','alter table \"nlhpc_event_table\" modify time_start int unsigned not null, modify time_end int unsigned default 0 not null, modify node_name tinytext default \'\' not null, modify cluster_nodes text not null default \'\', modify cpu_count int not null, modify reason tinytext not null, modify reason_uid int unsigned default 0xfffffffe not null, modify state smallint unsigned default 0 not null, drop primary key, add primary key (node_name(20), time_start);'),(1400521880,1400521880,'\"nlhpc_job_table\"','alter table \"nlhpc_job_table\" modify job_db_inx int not null auto_increment, modify mod_time int unsigned default 0 not null, modify deleted tinyint default 0 not null, modify account tinytext, modify cpus_req int unsigned not null, modify cpus_alloc int unsigned not null, modify derived_ec int unsigned default 0 not null, modify derived_es text, modify exit_code int unsigned default 0 not null, modify job_name tinytext not null, modify id_assoc int unsigned not null, modify id_block tinytext, modify id_job int unsigned not null, modify id_qos int unsigned default 0 not null, modify id_resv int unsigned not null, modify id_wckey int unsigned not null, modify id_user int unsigned not null, modify id_group int unsigned not null, modify kill_requid int default -1 not null, modify mem_req int unsigned default 0 not null, modify nodelist text, modify nodes_alloc int unsigned not null, modify node_inx text, modify partition tinytext not null, modify priority int unsigned not null, modify state smallint unsigned not null, modify timelimit int unsigned default 0 not null, modify time_submit int unsigned default 0 not null, modify time_eligible int unsigned default 0 not null, modify time_start int unsigned default 0 not null, modify time_end int unsigned default 0 not null, modify time_suspended int unsigned default 0 not null, modify gres_req text not null default \'\', modify gres_alloc text not null default \'\', modify gres_used text not null default \'\', modify wckey tinytext not null default \'\', modify track_steps tinyint not null, drop primary key, add primary key (job_db_inx), drop index id_job, add unique index (id_job, id_assoc, time_submit);'),(1400521881,1400521881,'\"nlhpc_last_ran_table\"','alter table \"nlhpc_last_ran_table\" modify hourly_rollup int unsigned default 0 not null, modify daily_rollup int unsigned default 0 not null, modify monthly_rollup int unsigned default 0 not null;'),(1400521881,1400521881,'\"nlhpc_resv_table\"','alter table \"nlhpc_resv_table\" modify id_resv int unsigned default 0 not null, modify deleted tinyint default 0 not null, modify assoclist text not null default \'\', modify cpus int unsigned not null, modify flags smallint unsigned default 0 not null, modify nodelist text not null default \'\', modify node_inx text not null default \'\', modify resv_name text not null, modify time_start int unsigned default 0 not null, modify time_end int unsigned default 0 not null, drop primary key, add primary key (id_resv, time_start);'),(1400521882,1400521882,'\"nlhpc_step_table\"','alter table \"nlhpc_step_table\" modify job_db_inx int not null, modify deleted tinyint default 0 not null, modify cpus_alloc int unsigned not null, modify exit_code int default 0 not null, modify id_step int not null, modify kill_requid int default -1 not null, modify nodelist text not null, modify nodes_alloc int unsigned not null, modify node_inx text, modify state smallint unsigned not null, modify step_name text not null, modify task_cnt int unsigned not null, modify task_dist smallint default 0 not null, modify time_start int unsigned default 0 not null, modify time_end int unsigned default 0 not null, modify time_suspended int unsigned default 0 not null, modify user_sec int unsigned default 0 not null, modify user_usec int unsigned default 0 not null, modify sys_sec int unsigned default 0 not null, modify sys_usec int unsigned default 0 not null, modify max_pages int unsigned default 0 not null, modify max_pages_task int unsigned default 0 not null, modify max_pages_node int unsigned default 0 not null, modify ave_pages double unsigned default 0.0 not null, modify max_rss bigint unsigned default 0 not null, modify max_rss_task int unsigned default 0 not null, modify max_rss_node int unsigned default 0 not null, modify ave_rss double unsigned default 0.0 not null, modify max_vsize bigint unsigned default 0 not null, modify max_vsize_task int unsigned default 0 not null, modify max_vsize_node int unsigned default 0 not null, modify ave_vsize double unsigned default 0.0 not null, modify min_cpu int unsigned default 0 not null, modify min_cpu_task int unsigned default 0 not null, modify min_cpu_node int unsigned default 0 not null, modify ave_cpu double unsigned default 0.0 not null, modify act_cpufreq double unsigned default 0.0 not null, modify consumed_energy double unsigned default 0.0 not null, modify req_cpufreq int unsigned default 0 not null, modify max_disk_read double unsigned default 0.0 not null, modify max_disk_read_task int unsigned default 0 not null, modify max_disk_read_node int unsigned default 0 not null, modify ave_disk_read double unsigned default 0.0 not null, modify max_disk_write double unsigned default 0.0 not null, modify max_disk_write_task int unsigned default 0 not null, modify max_disk_write_node int unsigned default 0 not null, modify ave_disk_write double unsigned default 0.0 not null, drop primary key, add primary key (job_db_inx, id_step);'),(1400521882,1400521882,'\"nlhpc_suspend_table\"','alter table \"nlhpc_suspend_table\" modify job_db_inx int not null, modify id_assoc int not null, modify time_start int unsigned default 0 not null, modify time_end int unsigned default 0 not null;'),(1400521878,1400521878,'\"nlhpc_usage_day_table\"','alter table \"nlhpc_usage_day_table\" modify creation_time int unsigned not null, modify mod_time int unsigned default 0 not null, modify deleted tinyint default 0 not null, modify time_start int unsigned not null, modify cpu_count int default 0 not null, modify alloc_cpu_secs bigint default 0 not null, modify down_cpu_secs bigint default 0 not null, modify pdown_cpu_secs bigint default 0 not null, modify idle_cpu_secs bigint default 0 not null, modify resv_cpu_secs bigint default 0 not null, modify over_cpu_secs bigint default 0 not null, drop primary key, add primary key (time_start);'),(1400521878,1400521878,'\"nlhpc_usage_hour_table\"','alter table \"nlhpc_usage_hour_table\" modify creation_time int unsigned not null, modify mod_time int unsigned default 0 not null, modify deleted tinyint default 0 not null, modify time_start int unsigned not null, modify cpu_count int default 0 not null, modify alloc_cpu_secs bigint default 0 not null, modify down_cpu_secs bigint default 0 not null, modify pdown_cpu_secs bigint default 0 not null, modify idle_cpu_secs bigint default 0 not null, modify resv_cpu_secs bigint default 0 not null, modify over_cpu_secs bigint default 0 not null, drop primary key, add primary key (time_start);'),(1400521879,1400521879,'\"nlhpc_usage_month_table\"','alter table \"nlhpc_usage_month_table\" modify creation_time int unsigned not null, modify mod_time int unsigned default 0 not null, modify deleted tinyint default 0 not null, modify time_start int unsigned not null, modify cpu_count int default 0 not null, modify alloc_cpu_secs bigint default 0 not null, modify down_cpu_secs bigint default 0 not null, modify pdown_cpu_secs bigint default 0 not null, modify idle_cpu_secs bigint default 0 not null, modify resv_cpu_secs bigint default 0 not null, modify over_cpu_secs bigint default 0 not null, drop primary key, add primary key (time_start);'),(1400521883,1400521883,'\"nlhpc_wckey_table\"','alter table \"nlhpc_wckey_table\" modify creation_time int unsigned not null, modify mod_time int unsigned default 0 not null, modify deleted tinyint default 0 not null, modify is_def tinyint default 0 not null, modify id_wckey int not null auto_increment, modify wckey_name tinytext not null default \'\', modify user tinytext not null, drop primary key, add primary key (id_wckey), drop index wckey_name, add unique index (wckey_name(20), user(20));'),(1400521883,1400521883,'\"nlhpc_wckey_usage_day_table\"','alter table \"nlhpc_wckey_usage_day_table\" modify creation_time int unsigned not null, modify mod_time int unsigned default 0 not null, modify deleted tinyint default 0 not null, modify id_wckey int not null, modify time_start int unsigned not null, modify alloc_cpu_secs bigint default 0, modify resv_cpu_secs bigint default 0, modify over_cpu_secs bigint default 0, drop primary key, add primary key (id_wckey, time_start);'),(1400521884,1400521884,'\"nlhpc_wckey_usage_hour_table\"','alter table \"nlhpc_wckey_usage_hour_table\" modify creation_time int unsigned not null, modify mod_time int unsigned default 0 not null, modify deleted tinyint default 0 not null, modify id_wckey int not null, modify time_start int unsigned not null, modify alloc_cpu_secs bigint default 0, modify resv_cpu_secs bigint default 0, modify over_cpu_secs bigint default 0, drop primary key, add primary key (id_wckey, time_start);'),(1400521884,1400521884,'\"nlhpc_wckey_usage_month_table\"','alter table \"nlhpc_wckey_usage_month_table\" modify creation_time int unsigned not null, modify mod_time int unsigned default 0 not null, modify deleted tinyint default 0 not null, modify id_wckey int not null, modify time_start int unsigned not null, modify alloc_cpu_secs bigint default 0, modify resv_cpu_secs bigint default 0, modify over_cpu_secs bigint default 0, drop primary key, add primary key (id_wckey, time_start);'),(1400521683,1400521683,'acct_coord_table','alter table acct_coord_table modify creation_time int unsigned not null, modify mod_time int unsigned default 0 not null, modify deleted tinyint default 0, modify acct tinytext not null, modify user tinytext not null, drop primary key, add primary key (acct(20), user(20));'),(1400521684,1400521684,'acct_table','alter table acct_table modify creation_time int unsigned not null, modify mod_time int unsigned default 0 not null, modify deleted tinyint default 0, modify name tinytext not null, modify description text not null, modify organization text not null, drop primary key, add primary key (name(20));'),(1400521682,1400521682,'cluster_table','alter table cluster_table modify creation_time int unsigned not null, modify mod_time int unsigned default 0 not null, modify deleted tinyint default 0, modify name tinytext not null, modify control_host tinytext not null default \'\', modify control_port int unsigned not null default 0, modify last_port int unsigned not null default 0, modify rpc_version smallint unsigned not null default 0, modify classification smallint unsigned default 0, modify dimensions smallint unsigned default 1, modify plugin_id_select smallint unsigned default 0, modify flags int unsigned default 0, drop primary key, add primary key (name(20));'),(1400521685,1400521685,'qos_table','alter table qos_table modify creation_time int unsigned not null, modify mod_time int unsigned default 0 not null, modify deleted tinyint default 0, modify id int not null auto_increment, modify name tinytext not null, modify description text, modify flags int unsigned default 0, modify grace_time int unsigned default NULL, modify max_jobs_per_user int default NULL, modify max_submit_jobs_per_user int default NULL, modify max_cpus_per_job int default NULL, modify max_cpus_per_user int default NULL, modify max_nodes_per_job int default NULL, modify max_nodes_per_user int default NULL, modify max_wall_duration_per_job int default NULL, modify max_cpu_mins_per_job bigint default NULL, modify max_cpu_run_mins_per_user bigint default NULL, modify grp_jobs int default NULL, modify grp_submit_jobs int default NULL, modify grp_cpus int default NULL, modify grp_mem int default NULL, modify grp_nodes int default NULL, modify grp_wall int default NULL, modify grp_cpu_mins bigint default NULL, modify grp_cpu_run_mins bigint default NULL, modify preempt text not null default \'\', modify preempt_mode int default 0, modify priority int unsigned default 0, modify usage_factor double default 1.0 not null, modify usage_thres double default NULL, drop primary key, add primary key (id), drop index name, add unique index (name(20));'),(1400521682,1400521682,'txn_table','alter table txn_table modify id int not null auto_increment, modify timestamp int unsigned default 0 not null, modify action smallint not null, modify name text not null, modify actor tinytext not null, modify cluster tinytext not null default \'\', modify info blob, drop primary key, add primary key (id);'),(1400521685,1400521685,'user_table','alter table user_table modify creation_time int unsigned not null, modify mod_time int unsigned default 0 not null, modify deleted tinyint default 0, modify name tinytext not null, modify admin_level smallint default 1 not null, drop primary key, add primary key (name(20));');
/*!40000 ALTER TABLE `table_defs_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `txn_table`
--

DROP TABLE IF EXISTS `txn_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `txn_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `action` smallint(6) NOT NULL,
  `name` text NOT NULL,
  `actor` tinytext NOT NULL,
  `cluster` tinytext NOT NULL,
  `info` blob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `txn_table`
--

LOCK TABLES `txn_table` WRITE;
/*!40000 ALTER TABLE `txn_table` DISABLE KEYS */;
INSERT INTO `txn_table` VALUES (1,1400521875,1405,'nlhpc','root','','mod_time=1400521875, shares=1, grp_cpu_mins=NULL, grp_cpu_run_mins=NULL, grp_cpus=NULL, grp_jobs=NULL, grp_mem=NULL, grp_nodes=NULL, grp_submit_jobs=NULL, grp_wall=NULL, max_cpu_mins_pj=NULL, max_cpu_run_mins=NULL, max_cpus_pj=NULL, max_jobs=NULL, max_nodes_pj=NULL, max_submit_jobs=NULL, max_wall_pj=NULL, def_qos_id=NULL, qos=\',1,\''),(2,1400521884,1404,'id_assoc=2','root','nlhpc','mod_time=1400521884, acct=\'root\', user=\'root\', partition=\'\', shares=1, grp_cpu_mins=NULL, grp_cpu_run_mins=NULL, grp_cpus=NULL, grp_jobs=NULL, grp_mem=NULL, grp_nodes=NULL, grp_submit_jobs=NULL, grp_wall=NULL, is_def=1, max_cpu_mins_pj=NULL, max_cpu_run_mins=NULL, max_cpus_pj=NULL, max_jobs=NULL, max_nodes_pj=NULL, max_submit_jobs=NULL, max_wall_pj=NULL, def_qos_id=NULL, qos=\'\', delta_qos=\'\''),(3,1400521966,1402,'clv','root','','description=\'testing\', organization=\'nlhpc\''),(4,1400521966,1404,'id_assoc=3','root','nlhpc','mod_time=1400521966, acct=\'clv\', parent_acct=\'root\', user=\'\', shares=1, grp_cpu_mins=NULL, grp_cpu_run_mins=NULL, grp_cpus=NULL, grp_jobs=NULL, grp_mem=NULL, grp_nodes=NULL, grp_submit_jobs=NULL, grp_wall=NULL, max_cpu_mins_pj=NULL, max_cpu_run_mins=NULL, max_cpus_pj=NULL, max_jobs=NULL, max_nodes_pj=NULL, max_submit_jobs=NULL, max_wall_pj=NULL, def_qos_id=NULL, qos=\'\', delta_qos=\'\''),(5,1400522051,1402,'cuenta1','root','','description=\'cuenta1\', organization=\'cuenta uno\''),(6,1400522051,1404,'id_assoc=4','root','nlhpc','mod_time=1400522051, acct=\'cuenta1\', parent_acct=\'root\', user=\'\', shares=1, grp_cpu_mins=NULL, grp_cpu_run_mins=NULL, grp_cpus=NULL, grp_jobs=NULL, grp_mem=NULL, grp_nodes=NULL, grp_submit_jobs=NULL, grp_wall=NULL, max_cpu_mins_pj=NULL, max_cpu_run_mins=NULL, max_cpus_pj=NULL, max_jobs=NULL, max_nodes_pj=NULL, max_submit_jobs=NULL, max_wall_pj=NULL, def_qos_id=NULL, qos=\'\', delta_qos=\'\''),(7,1400522100,1406,'clv','root','','admin_level=1'),(8,1400522100,1404,'id_assoc=5','root','nlhpc','mod_time=1400522100, acct=\'cuenta1\', user=\'clv\', partition=\'\', shares=1, grp_cpu_mins=NULL, grp_cpu_run_mins=NULL, grp_cpus=NULL, grp_jobs=NULL, grp_mem=NULL, grp_nodes=NULL, grp_submit_jobs=NULL, grp_wall=NULL, is_def=1, max_cpu_mins_pj=NULL, max_cpu_run_mins=NULL, max_cpus_pj=NULL, max_jobs=NULL, max_nodes_pj=NULL, max_submit_jobs=NULL, max_wall_pj=NULL, def_qos_id=NULL, qos=\'\', delta_qos=\'\''),(9,1400522280,1430,'(name=\'nlhpc\')','slurm','','control_host=\'127.0.0.1\', control_port=6817, last_port=6817, rpc_version=12, dimensions=1, plugin_id_select=102, flags=0'),(10,1400522353,1430,'(name=\'nlhpc\')','slurm','','control_host=\'127.0.0.1\', control_port=6817, last_port=6817, rpc_version=12, dimensions=1, plugin_id_select=102, flags=0'),(11,1400522519,1430,'(name=\'nlhpc\')','slurm','','control_host=\'127.0.0.1\', control_port=6817, last_port=6817, rpc_version=12, dimensions=1, plugin_id_select=102, flags=0'),(12,1400853304,1430,'(name=\'nlhpc\')','slurm','','control_host=\'127.0.0.1\', control_port=6817, last_port=6817, rpc_version=12, dimensions=1, plugin_id_select=102, flags=0');
/*!40000 ALTER TABLE `txn_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_table`
--

DROP TABLE IF EXISTS `user_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_table` (
  `creation_time` int(10) unsigned NOT NULL,
  `mod_time` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(4) DEFAULT '0',
  `name` tinytext NOT NULL,
  `admin_level` smallint(6) NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`(20))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_table`
--

LOCK TABLES `user_table` WRITE;
/*!40000 ALTER TABLE `user_table` DISABLE KEYS */;
INSERT INTO `user_table` VALUES (1400522100,1400522100,0,'clv',1),(1400521682,1400521682,0,'root',3);
/*!40000 ALTER TABLE `user_table` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-05-30  8:23:05
