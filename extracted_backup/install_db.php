<?php
header("Content-Type: text/html; charset=UTF-8");

echo "<h2>닷홈 MySQL 데이터베이스 자동 설치 스크립트</h2>";

// 닷홈 기본 설정값
$host = "localhost";
$db_user = "k5604"; // 닷홈 계정 아이디
$db_pass = "";      // DB 비밀번호
$db_name = "k5604"; // DB 이름 (계정명과 동일)

if (empty($db_pass)) {
    echo "<p style='color: red;'>⚠️ install_db.php 파일의 \$db_pass 변수에 닷홈 DB 비밀번호를 적어주신 후 접속해 주세요.</p>";
    exit;
}

$conn = new mysqli($host, $db_user, $db_pass, $db_name);
if ($conn->connect_error) {
    die("<p style='color: red;'>DB 연결 실패: " . $conn->connect_error . "</p>");
}

$queries = [
    "CREATE TABLE IF NOT EXISTS `mfg_hierarchy` (
      `id` VARCHAR(50) PRIMARY KEY,
      `mfg_name` VARCHAR(100) NOT NULL,
      `model_name` VARCHAR(100) NOT NULL,
      `part_name` VARCHAR(100) NOT NULL,
      `process_name` VARCHAR(100) NOT NULL,
      `is_machine` TINYINT(1) DEFAULT 0,
      `default_target` INT DEFAULT 400,
      `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;",

    "CREATE TABLE IF NOT EXISTS `workers` (
      `id` VARCHAR(50) PRIMARY KEY,
      `emp_no` VARCHAR(50) NOT NULL,
      `name` VARCHAR(50) NOT NULL,
      `shift` ENUM('DAY', 'NIGHT') DEFAULT 'DAY',
      `role` VARCHAR(50) DEFAULT '작업자',
      `phone` VARCHAR(20) NULL,
      `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;",

    "CREATE TABLE IF NOT EXISTS `production_logs` (
      `id` VARCHAR(100) PRIMARY KEY,
      `date` DATE NOT NULL,
      `shift` ENUM('DAY', 'NIGHT') NOT NULL,
      `worker_id` VARCHAR(50) NOT NULL,
      `worker_name` VARCHAR(50) NOT NULL,
      `model_name` VARCHAR(100) NOT NULL,
      `part_name` VARCHAR(100) NOT NULL,
      `process_name` VARCHAR(100) NOT NULL,
      `is_machine` TINYINT(1) DEFAULT 0,
      `prework_done` TINYINT(1) DEFAULT 0,
      `clock_in_time` DATETIME NULL,
      `total_qty` INT DEFAULT 0,
      `pass_qty` INT DEFAULT 0,
      `defect_qty` INT DEFAULT 0,
      `defect_details` TEXT NULL,
      `status` ENUM('DRAFT', 'SUBMITTED') DEFAULT 'DRAFT',
      `note` TEXT NULL,
      `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
      `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;"
];

foreach ($queries as $q) {
    if ($conn->query($q) === TRUE) {
        echo "<p style='color: green;'>✅ 테이블 생성 성공</p>";
    } else {
        echo "<p style='color: red;'>❌ 에러: " . $conn->error . "</p>";
    }
}

echo "<h3>🎉 닷홈 DB 설치가 성공적으로 완료되었습니다!</h3>";
$conn->close();
