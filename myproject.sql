DROP DATABASE `project`;
CREATE DATABASE `project`;

USE `project`;

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`(
    `id` INT AUTO_INCREMENT,
    `media_id` INT NOT NULL,
    `name` VARCHAR(45),
    PRIMARY KEY(`id`)
   );

DROP TABLE IF EXISTS `project`;
CREATE TABLE `project`(
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(45),
    PRIMARY KEY(`id`)
);

DROP TABLE IF EXISTS `bug`;

CREATE TABLE `bug`(
    `id` INT AUTO_INCREMENT,
    `project_id` INT,
    `name` VARCHAR(45),
    PRIMARY KEY (`id`),
    CONSTRAINT `FK_project_id_bug`
    
);
INSERT INTO `bug`(`name`) VALUES (`x`),(`y`),(`Z`),(`w`);

DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`(
    `id` INT NOT NULL,
    `bug_project_id` INT NOT NULL,
    `bug_id` INT NOT NULL,
    `text` TEXT,
    PRIMARY KEY (`id`)
    
);
INSERT INTO `comment`(`text`) VALUES (`banglore`),(`kanpur`),(`delhi`),(`dehradun`);

DROP TABLE IF EXISTS `media`;
CREATE TABLE `media`(
    `id` INT NOT NULL,
    `user_id` INT NOT NULL,
   `path` VARCHAR(70),
    `filetype` VARCHAR(20),
    `filesize` DECIMAL(65,2),
    PRIMARY KEY(`id`),
    CONSTRAINT `FK_userid` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
);
INSERT INTO `media`(`path`,`filetype`,`filesize`)
 VALUES ('d:a/b/c','txt','100MB'),('d:a/b/c','txt','100MB'),
 ('d:a/b/c','txt','100MB'),('d:a/b/c','txt','100MB');

DROP TABLE IF EXISTS `project_has_user`;
CREATE TABLE `project_has_user`(
    `project_id` INT NOT NULL,
    `user_id` INT NOT NULL,
    `manager` TINYINT(1),
    CONSTRAINT `FK_projectid` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`),
    CONSTRAINT `FK_userid` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
);
INSERT INTO `project_has_user`(`manager`) VALUES (`aman`),(`vaibhav`),(`satyam`),(`shashank`);




DROP TABLE IF EXISTS `bug_has_media`;
CREATE TABLE `bug_has_media`(
    `bug_id` INT NOT NULL,
    `bug_project_id` INT NOT NULL,
    `name` VARCHAR(45),
    `meadia_id` INT NOT NULL,
    CONSTRAINT `FK_bug` FOREIGN KEY (`bug_id`) REFERENCES `bug` (`id`),
    CONSTRAINT `FK_bugproject   ` FOREIGN KEY (`bug_project_id`) REFERENCES `bug` (`project_id`),
    CONSTRAINT `FK_media` FOREIGN KEY (`meadia_id`) REFERENCES `media` (`id`)
);
INSERT INTO `bug_has_media`(`name`) VALUES (`a`),(`b`),(`c`),(`d`);


DROP TABLE IF EXISTS `comment_has_media`;
CREATE TABLE `comment_has_media`(
    `comment_id` INT NOT NULL,
    `comment_bug_project_id` INT NOT NULL,
    `comment_bug_id` INT NOT NULL,
    `media_id` INT NOT NULL,
   CONSTRAINT `FK_cmt` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`id`),
   CONSTRAINT `FK_bug` FOREIGN KEY (`comment_bug_id`) REFERENCES `comment` (`bug_id`),
   CONSTRAINT `FK_bugproject` FOREIGN KEY (`comment_bug_project_id`) REFERENCES `comment` (`bug_project_id`),
  CONSTRAINT `FK_media` FOREIGN KEY ( `media_id`) REFERENCES `media` (`id`)
);