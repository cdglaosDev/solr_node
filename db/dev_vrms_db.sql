-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 18, 2022 at 02:53 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dev_vrms`
--

-- --------------------------------------------------------

--
-- Table structure for table `IllegalTraffics`
--

CREATE TABLE `IllegalTraffics` (
  `id` int(11) NOT NULL,
  `vehicle_id` int(11) NOT NULL,
  `date` varchar(50) DEFAULT NULL,
  `status` varchar(2) DEFAULT NULL,
  `to_date` varchar(50) DEFAULT NULL,
  `log` text DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `IllegaTrafficAccidents`
--

CREATE TABLE `IllegaTrafficAccidents` (
  `id` int(11) NOT NULL,
  `illegal_traffic_id` int(11) NOT NULL,
  `traffic_accidence_id` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `license_alphabets`
--

CREATE TABLE `license_alphabets` (
  `id` int(11) NOT NULL,
  `name` varchar(10) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` varchar(25) DEFAULT NULL,
  `updated_at` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `license_no_history`
--

CREATE TABLE `license_no_history` (
  `lice_no_his_id` int(11) NOT NULL,
  `vehicle_type_group_id` int(11) DEFAULT NULL,
  `lice_no_province_code` int(11) DEFAULT NULL,
  `lice_alph_id` int(11) DEFAULT NULL,
  `lice_no_number` varchar(20) DEFAULT NULL,
  `license_log_activity` varchar(255) DEFAULT NULL,
  `vehicle_kind_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `license_no_history_detail`
--

CREATE TABLE `license_no_history_detail` (
  `license_status_det_id` int(11) NOT NULL,
  `lice_no_his_status_id` int(11) DEFAULT NULL,
  `lice_no_his_det_start_date` varchar(25) DEFAULT NULL,
  `lice_no_his_det_end_date` varchar(25) DEFAULT NULL,
  `lice_no_owner` varchar(100) DEFAULT NULL,
  `lice_no_village` varchar(100) DEFAULT NULL,
  `lice_no_his_id` int(11) DEFAULT NULL,
  `vehicle_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `license_no_history_status`
--

CREATE TABLE `license_no_history_status` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `id` int(11) NOT NULL,
  `text` varchar(255) DEFAULT NULL,
  `division_no` varchar(255) DEFAULT NULL,
  `note_id` varchar(50) DEFAULT NULL,
  `province_no` varchar(255) DEFAULT NULL,
  `car_type` varchar(255) DEFAULT NULL,
  `licence_no` varchar(255) DEFAULT NULL,
  `car_number_type` varchar(50) DEFAULT NULL,
  `owner_name` varchar(255) DEFAULT NULL,
  `tenant_name` varchar(255) DEFAULT NULL,
  `village_name` varchar(255) DEFAULT NULL,
  `vehicle_category_id` int(11) DEFAULT NULL,
  `province_code` varchar(50) DEFAULT NULL,
  `district_code` varchar(50) DEFAULT NULL,
  `steering_id` int(11) DEFAULT NULL,
  `vehicle_type_id` int(11) DEFAULT NULL,
  `color_id` int(11) DEFAULT NULL,
  `year_manufacture` varchar(100) DEFAULT NULL,
  `height` varchar(255) DEFAULT NULL,
  `long` varchar(255) DEFAULT NULL,
  `gas_id` int(11) DEFAULT NULL,
  `wheels` varchar(255) DEFAULT NULL,
  `engine_no` varchar(255) DEFAULT NULL,
  `chassis_no` varchar(255) DEFAULT NULL,
  `weight` varchar(100) DEFAULT NULL,
  `import_permit_no` varchar(255) DEFAULT NULL,
  `import_permit_date` varchar(50) DEFAULT NULL,
  `industrial_doc_no` varchar(255) DEFAULT NULL,
  `industrial_doc_date` varchar(50) DEFAULT NULL,
  `technical_doc_no` varchar(255) DEFAULT NULL,
  `total_weight` varchar(255) DEFAULT NULL,
  `technical_doc_date` varchar(50) DEFAULT NULL,
  `width` varchar(255) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `model_id` int(11) DEFAULT NULL,
  `comerce_permit_no` varchar(255) DEFAULT NULL,
  `comerce_permit_date` varchar(50) DEFAULT NULL,
  `tax_no` varchar(255) DEFAULT NULL,
  `tax_date` varchar(50) DEFAULT NULL,
  `tax_payment_no` varchar(255) DEFAULT NULL,
  `tax_payment_date` varchar(50) DEFAULT NULL,
  `police_doc_no` varchar(255) DEFAULT NULL,
  `police_doc_date` varchar(50) DEFAULT NULL,
  `remark` text DEFAULT NULL,
  `datetime_update` varchar(50) DEFAULT NULL,
  `deleted_at` varchar(50) DEFAULT NULL,
  `created_at` varchar(50) DEFAULT NULL,
  `updated_at` varchar(50) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `moter_brand_id` int(11) DEFAULT NULL,
  `log_activity` mediumtext DEFAULT NULL,
  `seat` varchar(100) DEFAULT NULL,
  `view` int(11) DEFAULT 1,
  `quick` int(11) DEFAULT 0,
  `tax_10_40` int(11) DEFAULT 0,
  `tax_exam` int(11) DEFAULT 0,
  `tax_12` int(11) DEFAULT 0,
  `tax_50` int(11) DEFAULT 0,
  `import_permit_hsny` int(11) DEFAULT 0,
  `import_permit_invest` varchar(200) DEFAULT NULL,
  `tax_receipt` varchar(255) DEFAULT NULL,
  `request_app_type` varchar(100) DEFAULT NULL,
  `issue_date` varchar(50) DEFAULT NULL,
  `expire_date` varchar(50) DEFAULT NULL,
  `tax_permit` varchar(200) DEFAULT NULL,
  `sub_color_id` int(11) DEFAULT NULL,
  `reg_complete` int(11) DEFAULT 0,
  `vehicle_kind_id` int(11) DEFAULT NULL,
  `motor_brand_id` int(11) DEFAULT NULL,
  `vehicle_purpose_id` int(11) DEFAULT NULL,
  `locks` varchar(10) DEFAULT NULL,
  `lock_no` varchar(50) DEFAULT NULL,
  `startlock` varchar(50) DEFAULT NULL,
  `endlock` varchar(50) DEFAULT NULL,
  `companylock` varchar(50) DEFAULT NULL,
  `cylinder` varchar(50) DEFAULT NULL,
  `cc` varchar(50) DEFAULT NULL,
  `weight_filled` varchar(10) DEFAULT NULL,
  `axis` varchar(10) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `engine_type_id` int(11) DEFAULT NULL,
  `card_serial_no` varchar(50) DEFAULT NULL,
  `chip_id` varchar(255) DEFAULT NULL,
  `inspect_place` varchar(255) DEFAULT NULL,
  `inspect_result` varchar(255) DEFAULT NULL,
  `inspect_issue_date` varchar(50) DEFAULT NULL,
  `inspect_expire_date` varchar(50) DEFAULT NULL,
  `vdvd_card` varchar(100) DEFAULT NULL,
  `commerce_permit` varchar(255) DEFAULT NULL,
  `_olddata` int(11) DEFAULT NULL,
  `_ver` int(11) DEFAULT NULL,
  `access` varchar(50) DEFAULT NULL,
  `advance` varchar(255) DEFAULT NULL,
  `certcode` varchar(100) DEFAULT NULL,
  `certdate` varchar(50) DEFAULT NULL,
  `certify_doc_date` varchar(50) DEFAULT NULL,
  `certify_doc_number` varchar(100) DEFAULT NULL,
  `certify_doc_remark` text DEFAULT NULL,
  `certlicense` varchar(50) DEFAULT NULL,
  `certno` varchar(50) DEFAULT NULL,
  `certolddate` varchar(50) DEFAULT NULL,
  `certperm` varchar(255) DEFAULT NULL,
  `certprintdate` varchar(50) DEFAULT NULL,
  `certtemp` varchar(255) DEFAULT NULL,
  `color_old` varchar(50) DEFAULT NULL,
  `commerce_permit_date_old` varchar(50) DEFAULT NULL,
  `counted` varchar(50) DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  `district_old` varchar(100) DEFAULT NULL,
  `division_no_old` varchar(50) DEFAULT NULL,
  `steering_old` varchar(50) DEFAULT NULL,
  `gas_old` varchar(50) DEFAULT NULL,
  `expire_date_old` varchar(50) DEFAULT NULL,
  `import_permit_date_old` varchar(50) DEFAULT NULL,
  `industrial_doc_date_old` varchar(50) DEFAULT NULL,
  `issue_date_old` varchar(50) DEFAULT NULL,
  `issue_date_var` varchar(50) DEFAULT NULL,
  `issue_place` varchar(100) DEFAULT NULL,
  `keyby` varchar(100) DEFAULT NULL,
  `owner_lastname` varchar(100) DEFAULT NULL,
  `log` text DEFAULT NULL,
  `brand_old` varchar(100) DEFAULT NULL,
  `model_old` varchar(100) DEFAULT NULL,
  `motor_brand_old` varchar(100) DEFAULT NULL,
  `police_doc_date_old` varchar(50) DEFAULT NULL,
  `province_abbr` varchar(10) DEFAULT NULL,
  `province_old` varchar(100) DEFAULT NULL,
  `purpose_old` varchar(100) DEFAULT NULL,
  `quick_id` varchar(20) DEFAULT NULL,
  `special_date` varchar(50) DEFAULT NULL,
  `special_date_old` varchar(50) DEFAULT NULL,
  `special_remark` text DEFAULT NULL,
  `special` varchar(255) DEFAULT NULL,
  `tax_date_old` varchar(50) DEFAULT NULL,
  `tax_payment_date_old` varchar(50) DEFAULT NULL,
  `tax` varchar(100) DEFAULT NULL,
  `technical_doc_date_old` varchar(50) DEFAULT NULL,
  `technicalcheck` varchar(50) DEFAULT NULL,
  `tnic_date` varchar(50) DEFAULT NULL,
  `tnic_expire_date` varchar(50) DEFAULT NULL,
  `tnic_result` varchar(50) DEFAULT NULL,
  `update_time_old` varchar(50) DEFAULT NULL,
  `vehicle_type_old` varchar(50) DEFAULT NULL,
  `vehicle_send` varchar(50) DEFAULT NULL,
  `vehicle_text2` varchar(255) DEFAULT NULL,
  `vehicle_unit` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vehicles_pre_upload`
--

CREATE TABLE `vehicles_pre_upload` (
  `note_id_t` varchar(255) NOT NULL,
  `advance_t` varchar(100) DEFAULT NULL,
  `axis_t` varchar(50) DEFAULT NULL,
  `birth_district_t` varchar(50) DEFAULT NULL,
  `birth_province_t` varchar(50) DEFAULT NULL,
  `birth_village_t` varchar(100) DEFAULT NULL,
  `car_t` varchar(50) DEFAULT NULL,
  `cat_t` varchar(50) DEFAULT NULL,
  `cc_t` varchar(50) DEFAULT NULL,
  `chassis_no_t` varchar(50) DEFAULT NULL,
  `color_t` varchar(50) DEFAULT NULL,
  `commerce_permit_t` varchar(50) DEFAULT NULL,
  `commerce_permit_date_t` varchar(50) DEFAULT NULL,
  `commerce_permit_no_t` varchar(50) DEFAULT NULL,
  `changelog_t` mediumtext DEFAULT NULL,
  `create_date_t` varchar(50) DEFAULT NULL,
  `customer_id_t` varchar(50) DEFAULT NULL,
  `cylinder_t` varchar(50) DEFAULT NULL,
  `data_code_t` varchar(50) DEFAULT NULL,
  `dateofbirth_t` varchar(50) DEFAULT NULL,
  `department_t` varchar(50) DEFAULT NULL,
  `d2_t` varchar(50) DEFAULT NULL,
  `d4_t` varchar(50) DEFAULT NULL,
  `d5_t` varchar(100) DEFAULT NULL,
  `d6_t` varchar(50) DEFAULT NULL,
  `d7_t` varchar(50) DEFAULT NULL,
  `d_t` varchar(50) DEFAULT NULL,
  `district_t` varchar(50) DEFAULT NULL,
  `division_no_t` varchar(50) DEFAULT NULL,
  `driverseat_t` varchar(50) DEFAULT NULL,
  `editedby_t` varchar(50) DEFAULT NULL,
  `email_address_t` varchar(120) DEFAULT NULL,
  `encoder_t` varchar(50) DEFAULT NULL,
  `energy_t` varchar(50) DEFAULT NULL,
  `entry_date_t` varchar(50) DEFAULT NULL,
  `entryby_t` varchar(50) DEFAULT NULL,
  `engine_no_t` varchar(50) DEFAULT NULL,
  `expire_date_t` varchar(50) DEFAULT NULL,
  `expire_date_val_t` varchar(50) DEFAULT NULL,
  `exam_date_t` varchar(50) DEFAULT NULL,
  `exam_place_t` varchar(50) DEFAULT NULL,
  `examdate_A_t` varchar(50) DEFAULT NULL,
  `examdate_B_t` varchar(50) DEFAULT NULL,
  `examtype_t` varchar(50) DEFAULT NULL,
  `eye_color_t` varchar(50) DEFAULT NULL,
  `fine1_t` varchar(2) DEFAULT NULL,
  `fine2_t` varchar(2) DEFAULT NULL,
  `fine3_t` varchar(2) DEFAULT NULL,
  `fine4_t` varchar(2) DEFAULT NULL,
  `fine5_t` varchar(2) DEFAULT NULL,
  `fine6_t` varchar(2) DEFAULT NULL,
  `fine7_t` varchar(2) DEFAULT NULL,
  `fine8_t` varchar(2) DEFAULT NULL,
  `fine9_t` varchar(2) DEFAULT NULL,
  `fine10_t` varchar(2) DEFAULT NULL,
  `fine11_t` varchar(2) DEFAULT NULL,
  `fine12_t` varchar(2) DEFAULT NULL,
  `fine13_t` varchar(2) DEFAULT NULL,
  `fine14_t` varchar(2) DEFAULT NULL,
  `fine15_t` varchar(2) DEFAULT NULL,
  `fine16_t` varchar(2) DEFAULT NULL,
  `fine17_t` varchar(2) DEFAULT NULL,
  `fine18_t` varchar(2) DEFAULT NULL,
  `fine19_t` varchar(2) DEFAULT NULL,
  `fine20_t` varchar(2) DEFAULT NULL,
  `fine21_t` varchar(2) DEFAULT NULL,
  `fine22_t` varchar(2) DEFAULT NULL,
  `fine23_t` varchar(2) DEFAULT NULL,
  `fine24_t` varchar(2) DEFAULT NULL,
  `fine25_t` varchar(2) DEFAULT NULL,
  `fine26_t` varchar(2) DEFAULT NULL,
  `fine27_t` varchar(2) DEFAULT NULL,
  `fine28_t` varchar(2) DEFAULT NULL,
  `fine29_t` varchar(2) DEFAULT NULL,
  `fine30_t` varchar(2) DEFAULT NULL,
  `fine31_t` varchar(2) DEFAULT NULL,
  `fine32_t` varchar(2) DEFAULT NULL,
  `fine33_t` varchar(2) DEFAULT NULL,
  `fine34_t` varchar(2) DEFAULT NULL,
  `fine35_t` varchar(2) DEFAULT NULL,
  `fine36_t` varchar(2) DEFAULT NULL,
  `fine37_t` varchar(2) DEFAULT NULL,
  `fine38_t` varchar(2) DEFAULT NULL,
  `finedate_t` varchar(50) DEFAULT NULL,
  `finelocation_t` varchar(100) DEFAULT NULL,
  `finelog_t` text DEFAULT NULL,
  `fax_t` varchar(100) DEFAULT NULL,
  `height_t` varchar(50) DEFAULT NULL,
  `import_permit_date_t` varchar(50) DEFAULT NULL,
  `import_permit_hsny_t` varchar(50) DEFAULT NULL,
  `import_permit_invest_t` varchar(50) DEFAULT NULL,
  `import_permit_no_t` varchar(50) DEFAULT NULL,
  `in1_t` varchar(50) DEFAULT NULL,
  `industrial_doc_date_t` varchar(50) DEFAULT NULL,
  `industrial_doc_no_t` varchar(50) DEFAULT NULL,
  `issue_date_t` varchar(50) DEFAULT NULL,
  `issue_date_var_t` varchar(50) DEFAULT NULL,
  `issue_place_t` varchar(50) DEFAULT NULL,
  `keyby_t` varchar(50) DEFAULT NULL,
  `name_t` varchar(255) DEFAULT NULL,
  `lastname_t` varchar(255) DEFAULT NULL,
  `length_t` varchar(50) DEFAULT NULL,
  `license_no_t` varchar(50) DEFAULT NULL,
  `log_t` text DEFAULT NULL,
  `make_t` varchar(50) DEFAULT NULL,
  `mistakeby_t` varchar(100) DEFAULT NULL,
  `model_t` varchar(100) DEFAULT NULL,
  `motor_make_t` varchar(50) DEFAULT NULL,
  `modify_date` varchar(50) DEFAULT NULL,
  `modify_date_t` varchar(50) DEFAULT NULL,
  `made_out_t` varchar(50) DEFAULT NULL,
  `number_t` varchar(50) DEFAULT NULL,
  `nationality_inter_t` varchar(50) DEFAULT NULL,
  `nationality_lao_t` varchar(50) DEFAULT NULL,
  `occupation_t` varchar(50) DEFAULT NULL,
  `paper_t` varchar(50) DEFAULT NULL,
  `person_id_t` varchar(50) DEFAULT NULL,
  `policenote_t` text DEFAULT NULL,
  `police_doc_date_t` varchar(50) DEFAULT NULL,
  `police_doc_no_t` varchar(50) DEFAULT NULL,
  `print_count_t` varchar(50) DEFAULT NULL,
  `print_date_1_t` varchar(50) DEFAULT NULL,
  `print_no_1_t` varchar(50) DEFAULT NULL,
  `print_user_1_t` varchar(50) DEFAULT NULL,
  `printedby_t` varchar(50) DEFAULT NULL,
  `printlog` varchar(50) DEFAULT NULL,
  `province_t` varchar(50) DEFAULT NULL,
  `province_no_t` varchar(50) DEFAULT NULL,
  `province_code_t` varchar(50) DEFAULT NULL,
  `province_abbr_t` varchar(50) DEFAULT NULL,
  `purpose_t` varchar(50) DEFAULT NULL,
  `purpose_no_t` varchar(50) DEFAULT NULL,
  `quick_id_t` varchar(50) DEFAULT NULL,
  `releasedate_t` varchar(100) DEFAULT NULL,
  `resolution_t` varchar(100) DEFAULT NULL,
  `row_t` varchar(50) DEFAULT NULL,
  `remark_t` text DEFAULT NULL,
  `remark2_t` text DEFAULT NULL,
  `rfid_t` varchar(50) DEFAULT NULL,
  `save1_t` varchar(50) DEFAULT NULL,
  `seats_t` varchar(50) DEFAULT NULL,
  `sex_t` varchar(50) DEFAULT NULL,
  `social_security_t` varchar(50) DEFAULT NULL,
  `special_t` varchar(100) DEFAULT NULL,
  `special_date_t` varchar(50) DEFAULT NULL,
  `special_remark_t` text DEFAULT NULL,
  `tax_10_40_t` varchar(50) DEFAULT NULL,
  `tax_12_t` varchar(50) DEFAULT NULL,
  `tax_50_t` varchar(50) DEFAULT NULL,
  `tax_date_t` varchar(50) DEFAULT NULL,
  `tax_exem_t` varchar(50) DEFAULT NULL,
  `tax_no_t` varchar(50) DEFAULT NULL,
  `tax_payment_date_t` varchar(100) DEFAULT NULL,
  `tax_payment_no_t` varchar(100) DEFAULT NULL,
  `tax_permit_t` varchar(50) DEFAULT NULL,
  `tax_receipt_t` varchar(50) DEFAULT NULL,
  `tax_t` varchar(50) DEFAULT NULL,
  `techincal_id_t` varchar(50) DEFAULT NULL,
  `technical_doc_date_t` varchar(50) DEFAULT NULL,
  `technical_doc_no_t` varchar(50) DEFAULT NULL,
  `telephone_t` varchar(200) DEFAULT NULL,
  `type_t` varchar(50) DEFAULT NULL,
  `update_time` varchar(50) DEFAULT NULL,
  `update_time_t` varchar(50) DEFAULT NULL,
  `vehicletype_t` varchar(50) DEFAULT NULL,
  `village_t` varchar(100) DEFAULT NULL,
  `work_phone_t` varchar(50) DEFAULT NULL,
  `weight_empty_t` varchar(50) DEFAULT NULL,
  `weight_filled_t` varchar(50) DEFAULT NULL,
  `weight_total_t` varchar(50) DEFAULT NULL,
  `wheels_t` varchar(50) DEFAULT NULL,
  `width_t` varchar(50) DEFAULT NULL,
  `year_manufactured_t` varchar(50) DEFAULT NULL,
  `home_phone_t` varchar(50) DEFAULT NULL,
  `mobile_t` varchar(50) DEFAULT NULL,
  `certno_t` varchar(50) DEFAULT NULL,
  `certdate_t` varchar(50) DEFAULT NULL,
  `certperm_t` varchar(50) DEFAULT NULL,
  `certtemp_t` varchar(50) DEFAULT NULL,
  `certcode_t` varchar(50) DEFAULT NULL,
  `certlicense_t` varchar(50) DEFAULT NULL,
  `certolddate_t` varchar(50) DEFAULT NULL,
  `access_t` varchar(50) DEFAULT NULL,
  `_olddata_t` varchar(50) DEFAULT NULL,
  `_ver_t` varchar(50) DEFAULT NULL,
  `tuk_t` varchar(50) DEFAULT NULL,
  `counted_t` varchar(50) DEFAULT NULL,
  `v_t` varchar(50) DEFAULT NULL,
  `title_t` varchar(100) DEFAULT NULL,
  `box_a1_t` varchar(50) DEFAULT NULL,
  `box_a5_t` varchar(50) DEFAULT NULL,
  `deleted` varchar(50) DEFAULT NULL,
  `deleted_t` varchar(50) DEFAULT NULL,
  `date_replace_t` varchar(50) DEFAULT NULL,
  `document_id_t` varchar(50) DEFAULT NULL,
  `id` varchar(50) DEFAULT NULL,
  `id_t` varchar(100) DEFAULT NULL,
  `open_date1_t` varchar(50) DEFAULT NULL,
  `sengphet_t` varchar(50) DEFAULT NULL,
  `serial_a_t` varchar(50) DEFAULT NULL,
  `owner_t` varchar(50) DEFAULT NULL,
  `object_id_t` varchar(100) DEFAULT NULL,
  `parent_id_t` varchar(100) DEFAULT NULL,
  `f5_t` varchar(50) DEFAULT NULL,
  `g5_t` varchar(50) DEFAULT NULL,
  `h5_t` varchar(50) DEFAULT NULL,
  `di_t` varchar(50) DEFAULT NULL,
  `last_print_by_t` varchar(50) DEFAULT NULL,
  `last_print_date_t` varchar(50) DEFAULT NULL,
  `printedat_t` varchar(50) DEFAULT NULL,
  `score_t` varchar(50) DEFAULT NULL,
  `flag_t` varchar(50) DEFAULT NULL,
  `ati_color_1_t` varchar(50) DEFAULT NULL,
  `ati_note_no1_t` varchar(50) DEFAULT NULL,
  `ati_note_no2_t` varchar(50) DEFAULT NULL,
  `certify_doc_date_t` varchar(50) DEFAULT NULL,
  `certify_doc_number_t` varchar(100) DEFAULT NULL,
  `certify_doc_remark_t` text DEFAULT NULL,
  `collected_t` varchar(50) DEFAULT NULL,
  `create_new_t` varchar(50) DEFAULT NULL,
  `create_newm_t` varchar(50) DEFAULT NULL,
  `create_year_t` varchar(50) DEFAULT NULL,
  `createday_t` varchar(50) DEFAULT NULL,
  `doc1_cnt_t` varchar(50) DEFAULT NULL,
  `doc2_cnt_t` varchar(50) DEFAULT NULL,
  `doc3_cnt_t` varchar(50) DEFAULT NULL,
  `doc4_cnt_t` varchar(50) DEFAULT NULL,
  `doc5_cnt_t` varchar(50) DEFAULT NULL,
  `doc6_cnt_t` varchar(50) DEFAULT NULL,
  `group_t` varchar(50) DEFAULT NULL,
  `owner_name_t` varchar(50) DEFAULT NULL,
  `technicalcenter_t` varchar(50) DEFAULT NULL,
  `technicalcheck_t` varchar(50) DEFAULT NULL,
  `tempodate_t` varchar(50) DEFAULT NULL,
  `tempoduration_t` varchar(50) DEFAULT NULL,
  `tempono_t` varchar(50) DEFAULT NULL,
  `temporemark_t` varchar(50) DEFAULT NULL,
  `tnic_date_t` varchar(50) DEFAULT NULL,
  `tnic_expire_date_t` varchar(50) DEFAULT NULL,
  `tnic_result_t` varchar(50) DEFAULT NULL,
  `today_t` varchar(50) DEFAULT NULL,
  `transfer_date_t` varchar(50) DEFAULT NULL,
  `transfer_name_t` varchar(255) DEFAULT NULL,
  `transfer_number_t` varchar(50) DEFAULT NULL,
  `transfer_province_t` varchar(50) DEFAULT NULL,
  `transfer_remark_t` varchar(50) DEFAULT NULL,
  `undeleted_by_t` varchar(50) DEFAULT NULL,
  `undeleted_date_t` varchar(50) DEFAULT NULL,
  `certprintdate_t` varchar(50) DEFAULT NULL,
  `printlog_t` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vehicles_vdvc`
--

CREATE TABLE `vehicles_vdvc` (
  `note_id_t` varchar(50) NOT NULL,
  `advance_t` varchar(25) DEFAULT NULL,
  `axis_t` varchar(25) DEFAULT NULL,
  `birth_district_t` varchar(25) DEFAULT NULL,
  `birth_province_t` varchar(25) DEFAULT NULL,
  `birth_village_t` varchar(25) DEFAULT NULL,
  `car_t` varchar(25) DEFAULT NULL,
  `cat_t` varchar(25) DEFAULT NULL,
  `cc_t` varchar(25) DEFAULT NULL,
  `chassis_no_t` varchar(50) DEFAULT NULL,
  `color_t` varchar(25) DEFAULT NULL,
  `commerce_permit_t` varchar(25) DEFAULT NULL,
  `commerce_permit_date_t` varchar(25) DEFAULT NULL,
  `commerce_permit_no_t` varchar(25) DEFAULT NULL,
  `changelog_t` text DEFAULT NULL,
  `create_date_t` varchar(25) DEFAULT NULL,
  `customer_id_t` varchar(25) DEFAULT NULL,
  `cylinder_t` varchar(25) DEFAULT NULL,
  `data_code_t` varchar(25) DEFAULT NULL,
  `dateofbirth_t` varchar(25) DEFAULT NULL,
  `department_t` varchar(25) DEFAULT NULL,
  `d2_t` varchar(25) DEFAULT NULL,
  `d4_t` varchar(25) DEFAULT NULL,
  `d5_t` varchar(25) DEFAULT NULL,
  `d6_t` varchar(25) DEFAULT NULL,
  `d7_t` varchar(25) DEFAULT NULL,
  `d_t` varchar(25) DEFAULT NULL,
  `district_t` varchar(25) DEFAULT NULL,
  `division_no_t` varchar(25) DEFAULT NULL,
  `driverseat_t` varchar(25) DEFAULT NULL,
  `editedby_t` varchar(25) DEFAULT NULL,
  `email_address_t` varchar(25) DEFAULT NULL,
  `encoder_t` varchar(25) DEFAULT NULL,
  `energy_t` varchar(25) DEFAULT NULL,
  `entry_date_t` varchar(25) DEFAULT NULL,
  `entryby_t` varchar(25) DEFAULT NULL,
  `engine_no_t` varchar(50) DEFAULT NULL,
  `expire_date_t` varchar(25) DEFAULT NULL,
  `expire_date_val_t` varchar(25) DEFAULT NULL,
  `exam_date_t` varchar(25) DEFAULT NULL,
  `exam_place_t` varchar(25) DEFAULT NULL,
  `examdate_A_t` varchar(25) DEFAULT NULL,
  `examdate_B_t` varchar(25) DEFAULT NULL,
  `examtype_t` varchar(25) DEFAULT NULL,
  `eye_color_t` varchar(25) DEFAULT NULL,
  `fine4_t` varchar(25) DEFAULT NULL,
  `fine9_t` varchar(25) DEFAULT NULL,
  `fine13_t` varchar(25) DEFAULT NULL,
  `fine29_t` varchar(25) DEFAULT NULL,
  `fine30_t` varchar(25) DEFAULT NULL,
  `fine31_t` varchar(25) DEFAULT NULL,
  `finedate_t` varchar(25) DEFAULT NULL,
  `finelocation_t` varchar(25) DEFAULT NULL,
  `finelog_t` varchar(25) DEFAULT NULL,
  `fax_t` varchar(25) DEFAULT NULL,
  `height_t` varchar(25) DEFAULT NULL,
  `import_permit_date_t` varchar(25) DEFAULT NULL,
  `import_permit_hsny_t` varchar(25) DEFAULT NULL,
  `import_permit_invest_t` varchar(25) DEFAULT NULL,
  `import_permit_no_t` varchar(25) DEFAULT NULL,
  `in1_t` varchar(25) DEFAULT NULL,
  `industrial_doc_date_t` varchar(25) DEFAULT NULL,
  `industrial_doc_no_t` varchar(25) DEFAULT NULL,
  `issue_date_t` varchar(25) DEFAULT NULL,
  `issue_date_var_t` varchar(25) DEFAULT NULL,
  `issue_place_t` varchar(25) DEFAULT NULL,
  `keyby_t` varchar(25) DEFAULT NULL,
  `name_t` varchar(50) DEFAULT NULL,
  `lastname_t` varchar(50) DEFAULT NULL,
  `length_t` varchar(25) DEFAULT NULL,
  `license_no_t` varchar(25) DEFAULT NULL,
  `log_t` varchar(25) DEFAULT NULL,
  `make_t` varchar(25) DEFAULT NULL,
  `mistakeby_t` varchar(25) DEFAULT NULL,
  `model_t` varchar(25) DEFAULT NULL,
  `motor_make_t` varchar(25) DEFAULT NULL,
  `modify_date` varchar(25) DEFAULT NULL,
  `modify_date_t` varchar(25) DEFAULT NULL,
  `made_out_t` varchar(25) DEFAULT NULL,
  `number_t` varchar(25) DEFAULT NULL,
  `nationality_inter_t` varchar(25) DEFAULT NULL,
  `nationality_lao_t` varchar(25) DEFAULT NULL,
  `occupation_t` varchar(25) DEFAULT NULL,
  `paper_t` varchar(25) DEFAULT NULL,
  `person_id_t` varchar(25) DEFAULT NULL,
  `policenote_t` text DEFAULT NULL,
  `police_doc_date_t` varchar(25) DEFAULT NULL,
  `police_doc_no_t` varchar(25) DEFAULT NULL,
  `print_count_t` varchar(25) DEFAULT NULL,
  `print_date_1_t` varchar(25) DEFAULT NULL,
  `print_no_1_t` varchar(25) DEFAULT NULL,
  `print_user_1_t` varchar(25) DEFAULT NULL,
  `printedby_t` varchar(25) DEFAULT NULL,
  `printlog` varchar(25) DEFAULT NULL,
  `province_t` varchar(25) DEFAULT NULL,
  `province_no_t` varchar(25) DEFAULT NULL,
  `province_code_t` varchar(25) DEFAULT NULL,
  `province_abbr_t` varchar(25) DEFAULT NULL,
  `purpose_t` varchar(25) DEFAULT NULL,
  `purpose_no_t` varchar(25) DEFAULT NULL,
  `quick_id_t` varchar(25) DEFAULT NULL,
  `releasedate_t` varchar(25) DEFAULT NULL,
  `resolution_t` varchar(25) DEFAULT NULL,
  `row_t` varchar(25) DEFAULT NULL,
  `remark_t` varchar(255) DEFAULT NULL,
  `remark2_t` varchar(255) DEFAULT NULL,
  `rfid_t` varchar(25) DEFAULT NULL,
  `save1_t` varchar(25) DEFAULT NULL,
  `seats_t` varchar(25) DEFAULT NULL,
  `sex_t` varchar(25) DEFAULT NULL,
  `social_security_t` varchar(25) DEFAULT NULL,
  `special_t` varchar(25) DEFAULT NULL,
  `special_date_t` varchar(25) DEFAULT NULL,
  `special_remark_t` text DEFAULT NULL,
  `tax_10_40_t` varchar(25) DEFAULT NULL,
  `tax_12_t` varchar(25) DEFAULT NULL,
  `tax_50_t` varchar(25) DEFAULT NULL,
  `tax_date_t` varchar(25) DEFAULT NULL,
  `tax_exem_t` varchar(25) DEFAULT NULL,
  `tax_no_t` varchar(25) DEFAULT NULL,
  `tax_payment_date_t` varchar(25) DEFAULT NULL,
  `tax_payment_no_t` varchar(25) DEFAULT NULL,
  `tax_permit_t` varchar(25) DEFAULT NULL,
  `tax_receipt_t` varchar(25) DEFAULT NULL,
  `tax_t` varchar(25) DEFAULT NULL,
  `techincal_id_t` varchar(25) DEFAULT NULL,
  `technical_doc_date_t` varchar(25) DEFAULT NULL,
  `technical_doc_no_t` varchar(25) DEFAULT NULL,
  `telephone_t` varchar(25) DEFAULT NULL,
  `type_t` varchar(25) DEFAULT NULL,
  `update_time` varchar(25) DEFAULT NULL,
  `update_time_t` varchar(25) DEFAULT NULL,
  `vehicletype_t` varchar(25) DEFAULT NULL,
  `village_t` varchar(25) DEFAULT NULL,
  `work_phone_t` varchar(25) DEFAULT NULL,
  `weight_empty_t` varchar(25) DEFAULT NULL,
  `weight_filled_t` varchar(25) DEFAULT NULL,
  `weight_total_t` varchar(25) DEFAULT NULL,
  `wheels_t` varchar(25) DEFAULT NULL,
  `width_t` varchar(25) DEFAULT NULL,
  `year_manufactured_t` varchar(25) DEFAULT NULL,
  `home_phone_t` varchar(25) DEFAULT NULL,
  `mobile_t` varchar(25) DEFAULT NULL,
  `certno_t` varchar(25) DEFAULT NULL,
  `certdate_t` varchar(25) DEFAULT NULL,
  `certperm_t` varchar(25) DEFAULT NULL,
  `certtemp_t` varchar(25) DEFAULT NULL,
  `certcode_t` varchar(25) DEFAULT NULL,
  `certlicense_t` varchar(25) DEFAULT NULL,
  `certolddate_t` varchar(25) DEFAULT NULL,
  `access_t` varchar(25) DEFAULT NULL,
  `_olddata_t` varchar(25) DEFAULT NULL,
  `_ver_t` varchar(25) DEFAULT NULL,
  `tuk_t` varchar(25) DEFAULT NULL,
  `counted_t` varchar(25) DEFAULT NULL,
  `v_t` varchar(25) DEFAULT NULL,
  `title_t` varchar(25) DEFAULT NULL,
  `box_a1_t` varchar(25) DEFAULT NULL,
  `box_a5_t` varchar(25) DEFAULT NULL,
  `deleted` varchar(25) DEFAULT NULL,
  `deleted_t` varchar(25) DEFAULT NULL,
  `date_replace_t` varchar(25) DEFAULT NULL,
  `document_id_t` varchar(25) DEFAULT NULL,
  `id` varchar(25) DEFAULT NULL,
  `id_t` varchar(25) DEFAULT NULL,
  `open_date1_t` varchar(25) DEFAULT NULL,
  `sengphet_t` varchar(25) DEFAULT NULL,
  `serial_a_t` varchar(25) DEFAULT NULL,
  `owner_t` varchar(25) DEFAULT NULL,
  `object_id_t` varchar(25) DEFAULT NULL,
  `parent_id_t` varchar(25) DEFAULT NULL,
  `f5_t` varchar(25) DEFAULT NULL,
  `g5_t` varchar(25) DEFAULT NULL,
  `h5_t` varchar(25) DEFAULT NULL,
  `di_t` varchar(25) DEFAULT NULL,
  `last_print_by_t` varchar(25) DEFAULT NULL,
  `last_print_date_t` varchar(25) DEFAULT NULL,
  `printedat_t` varchar(25) DEFAULT NULL,
  `score_t` varchar(25) DEFAULT NULL,
  `flag_t` varchar(25) DEFAULT NULL,
  `ati_color_1_t` varchar(25) DEFAULT NULL,
  `ati_note_no1_t` varchar(25) DEFAULT NULL,
  `ati_note_no2_t` varchar(25) DEFAULT NULL,
  `certify_doc_date_t` varchar(25) DEFAULT NULL,
  `certify_doc_number_t` varchar(25) DEFAULT NULL,
  `certify_doc_remark_t` text DEFAULT NULL,
  `collected_t` varchar(25) DEFAULT NULL,
  `create_new_t` varchar(25) DEFAULT NULL,
  `create_newm_t` varchar(25) DEFAULT NULL,
  `create_year_t` varchar(25) DEFAULT NULL,
  `createday_t` varchar(25) DEFAULT NULL,
  `doc1_cnt_t` varchar(25) DEFAULT NULL,
  `doc2_cnt_t` varchar(25) DEFAULT NULL,
  `doc3_cnt_t` varchar(25) DEFAULT NULL,
  `doc4_cnt_t` varchar(25) DEFAULT NULL,
  `doc5_cnt_t` varchar(25) DEFAULT NULL,
  `doc6_cnt_t` varchar(25) DEFAULT NULL,
  `group_t` varchar(25) DEFAULT NULL,
  `owner_name_t` varchar(25) DEFAULT NULL,
  `technicalcenter_t` varchar(25) DEFAULT NULL,
  `technicalcheck_t` varchar(25) DEFAULT NULL,
  `tempodate_t` varchar(25) DEFAULT NULL,
  `tempoduration_t` varchar(25) DEFAULT NULL,
  `tempono_t` varchar(25) DEFAULT NULL,
  `temporemark_t` varchar(25) DEFAULT NULL,
  `tnic_date_t` varchar(25) DEFAULT NULL,
  `tnic_expire_date_t` varchar(25) DEFAULT NULL,
  `tnic_result_t` varchar(25) DEFAULT NULL,
  `today_t` varchar(25) DEFAULT NULL,
  `transfer_date_t` varchar(25) DEFAULT NULL,
  `transfer_name_t` varchar(25) DEFAULT NULL,
  `transfer_number_t` varchar(25) DEFAULT NULL,
  `transfer_province_t` varchar(25) DEFAULT NULL,
  `transfer_remark_t` varchar(25) DEFAULT NULL,
  `undeleted_by_t` varchar(25) DEFAULT NULL,
  `undeleted_date_t` varchar(25) DEFAULT NULL,
  `certprintdate_t` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_log`
--

CREATE TABLE `vehicle_log` (
  `vehicle_log_id` int(11) NOT NULL,
  `vehicle_id` int(11) DEFAULT NULL,
  `veh_log_field_name` varchar(45) DEFAULT NULL,
  `veh_log_data_from` varchar(255) DEFAULT NULL,
  `veh_log_data_to` varchar(255) DEFAULT NULL,
  `app_request_no` varchar(45) DEFAULT NULL,
  `veh_log_activity` varchar(255) DEFAULT NULL,
  `veh_log_datetime` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_types`
--

CREATE TABLE `vehicle_types` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `name_en` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` varchar(255) DEFAULT NULL,
  `updated_at` varchar(255) DEFAULT NULL,
  `deleted_at` varchar(255) DEFAULT NULL,
  `vehicle_type_group_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_type_groups`
--

CREATE TABLE `vehicle_type_groups` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` varchar(255) DEFAULT NULL,
  `updated_at` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `IllegalTraffics`
--
ALTER TABLE `IllegalTraffics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `IllegaTrafficAccidents`
--
ALTER TABLE `IllegaTrafficAccidents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `license_alphabets`
--
ALTER TABLE `license_alphabets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `license_no_history`
--
ALTER TABLE `license_no_history`
  ADD PRIMARY KEY (`lice_no_his_id`);

--
-- Indexes for table `license_no_history_detail`
--
ALTER TABLE `license_no_history_detail`
  ADD PRIMARY KEY (`license_status_det_id`),
  ADD KEY `lice_no_his_id` (`lice_no_his_id`),
  ADD KEY `vehicle_id` (`vehicle_id`);

--
-- Indexes for table `license_no_history_status`
--
ALTER TABLE `license_no_history_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicles_pre_upload`
--
ALTER TABLE `vehicles_pre_upload`
  ADD PRIMARY KEY (`note_id_t`);

--
-- Indexes for table `vehicles_vdvc`
--
ALTER TABLE `vehicles_vdvc`
  ADD PRIMARY KEY (`note_id_t`);

--
-- Indexes for table `vehicle_log`
--
ALTER TABLE `vehicle_log`
  ADD PRIMARY KEY (`vehicle_log_id`);

--
-- Indexes for table `vehicle_types`
--
ALTER TABLE `vehicle_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicle_type_groups`
--
ALTER TABLE `vehicle_type_groups`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `IllegalTraffics`
--
ALTER TABLE `IllegalTraffics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=906;

--
-- AUTO_INCREMENT for table `IllegaTrafficAccidents`
--
ALTER TABLE `IllegaTrafficAccidents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1164;

--
-- AUTO_INCREMENT for table `license_alphabets`
--
ALTER TABLE `license_alphabets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `license_no_history`
--
ALTER TABLE `license_no_history`
  MODIFY `lice_no_his_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=174844;

--
-- AUTO_INCREMENT for table `license_no_history_detail`
--
ALTER TABLE `license_no_history_detail`
  MODIFY `license_status_det_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=179751;

--
-- AUTO_INCREMENT for table `license_no_history_status`
--
ALTER TABLE `license_no_history_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=185791;

--
-- AUTO_INCREMENT for table `vehicle_log`
--
ALTER TABLE `vehicle_log`
  MODIFY `vehicle_log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=881149;

--
-- AUTO_INCREMENT for table `vehicle_types`
--
ALTER TABLE `vehicle_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vehicle_type_groups`
--
ALTER TABLE `vehicle_type_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `license_no_history_detail`
--
ALTER TABLE `license_no_history_detail`
  ADD CONSTRAINT `license_no_history_detail_ibfk_1` FOREIGN KEY (`lice_no_his_id`) REFERENCES `license_no_history` (`lice_no_his_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `license_no_history_detail_ibfk_2` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
