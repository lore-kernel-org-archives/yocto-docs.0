Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B7A6C433EF
	for <webhook@archiver.kernel.org>; Fri, 11 Mar 2022 08:40:56 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (EUR03-AM5-obe.outbound.protection.outlook.com [40.107.3.108])
 by mx.groups.io with SMTP id smtpd.web12.3473.1646988053412166812
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Mar 2022 00:40:55 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@arrigroup.onmicrosoft.com
 header.s=selector1-arrigroup-onmicrosoft-com header.b=mL+P1QlN;
 spf=pass (domain: arri.de, ip: 40.107.3.108, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YAdK6zG4ZhXd8FFWqZN/DbBhSGt5yWkSmut6ApKhg4E2XzkXGeOKy3p5oeLFnotIQJ20Wz8KY05NQ2Hwi4J+SXS5RCa33voXGyhFibQAySvHkXP1qcqIRIzU6eHztfD8PeXkqtx1aN696vXjQs/vHuXjad9IgTxfDFZEXBuWgjBFk2QtS7Nrljdl3ZkS9qiCTS9xn8ZUmTysdoqheTiB+sX/pwL4suHXckpFe2NhnwZ6sZR3vpRMeGGeRYXrECoWrFn6GWX/5pGYeXIstEYcfEfKGigJiyZdO2W2k8WnRp/GiWbApVm6FKjTyU01Za4gDaHeE/yl1B2Lv06Xr1cG0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fdvNAP7sYLM5PWQ5hxgU5G7glCsvWmlqcV0Obv1Sk98=;
 b=fCXN1uAJPxtv6Hl0Ax/VSEvdyuUcoInF1J0q4pZk3JYoZFV3vSOVxkvNPAN0GdfogordMSxucwCZUe+GL+iRvRfHzMprn0ObkEHviHKgJCJ5DUEZ6yCkSrLk4bW24M7r31ZypkhuBtyaaFg36ieQwL708M8/fYYQPTAL21eOVGk/14GRDRM2QHIQcupI29Lr5SuHCu/N+S8ZbBQ0NYXSrs0yk63KPse7zjsFt3Wt1jnRZZsi1St+0ql8WSMxVdi7XBJvJj0FE0CdSXQlRtydkkQIgv8QRjZMYvp5CFNJypFRlzVMRzwq/oDxPwvU2GhINNVGW6Xj04p13o1J5/ij9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arri.de;
 dmarc=none action=none header.from=arri.de; dkim=none (message not signed);
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arrigroup.onmicrosoft.com; s=selector1-arrigroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fdvNAP7sYLM5PWQ5hxgU5G7glCsvWmlqcV0Obv1Sk98=;
 b=mL+P1QlN7WdfHkjgR8mQ3JiOH2Ol8CtIdAGb2QBwMpYJMM3S44/3fCXYxlXIF5xBfk8Y+CYpD1pJOIE8hUF3WAkHyIqIt6D93JLL5wyB+fnpOp0zXL4jtyjbNRm5Dcm5J1lH4wA2S6aOEqcchZ1Kwwlvt2AxxVj1neGllJW5UMM=
Received: from AM5PR0301CA0036.eurprd03.prod.outlook.com
 (2603:10a6:206:14::49) by AM0PR07MB3891.eurprd07.prod.outlook.com
 (2603:10a6:208:44::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.7; Fri, 11 Mar
 2022 08:40:49 +0000
Received: from AM5EUR02FT011.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:206:14:cafe::69) by AM5PR0301CA0036.outlook.office365.com
 (2603:10a6:206:14::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.23 via Frontend
 Transport; Fri, 11 Mar 2022 08:40:49 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 AM5EUR02FT011.mail.protection.outlook.com (10.152.8.101) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5061.22 via Frontend Transport; Fri, 11 Mar 2022 08:40:49 +0000
Received: from dhcp-192-168-0-28.wgnetz.xx.de (192.168.55.97) by mta.arri.de
 (10.10.18.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 11 Mar
 2022 09:40:48 +0100
From: Christian Eggers <ceggers@arri.de>
To: <docs@lists.yoctoproject.org>
CC: Christian Eggers <ceggers@arri.de>
Subject: [PATCH] ref-manual: INCOMPATIBLE_LICENSE: use new license wildcards
Date: Fri, 11 Mar 2022 09:40:41 +0100
Message-ID: <20220311084041.21992-1-ceggers@arri.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [192.168.55.97]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1f77a4ae-f921-4cfa-e06c-08da033ad807
X-MS-TrafficTypeDiagnostic: AM0PR07MB3891:EE_
X-Microsoft-Antispam-PRVS: 
	<AM0PR07MB3891C4D49FB089282B2C4782BF0C9@AM0PR07MB3891.eurprd07.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qUu0T0PcoLUaVdGon8AwmlSArbgsJ/xqmhDL9Ol6L3TdztkZ9n3s0EfrOn70xjjF7bdd/2ypKEa07S7U0QzQLgRbyMeEjC8di6ECR/p7Xo5PFeP485RFyM4RiKlcX4nH8ok5aKNA6rsFsjHJoBHf5JlZehp+fwBH/a2/3rEwcEinkWZTOCLVYE6Hpnt4Ze3eaHLKqXoTxnxgQOhfQ8VDkaGF6bcUlhkUBjUzlx7s9Txdbc+gGbD0cUFg6b8r7sRvxVCv0Qj4WvEtuN0RDoQlMT7Yx7n2G3I+KbuLjeY7gQN/OwNmjBmNbqUwbASiaxIvVj2I0GMEAE1dmxxSlsY9xkw6eKGsWiPtZAC7AZppIoWRoF9YYgP4mb+amDVTEaJ6Swj7XWGRPI5XbQUY9fkq8P3hPe17xfDbkMpm1na9YRYWdynqBUuAW5vB1QT9Fbh6h2nTh2JBz6wUqfZO6U9uPedO9yvncoFv1nW+kXftt8Onk8KQSWZ8uB6ARbo1lnTPZC2j8MDQWzm3RbavKnywUAcDcc4gY3AAjon5AmUKVX5FHvsa5+ela+U500yA1tdn+dpOzRMOVXIq7dU8HeiPExUhfdfZH4sgRmXqmrDy+4C0kzStBPni77/e1RTh51CbKi8TzfT7VDrBaaMvva3umWI3BiobIZPru5aBDZ8oKA7topTDZ85m7bUgl0m5OffzGiEN+pg/guFtdjxSQAaptw==
X-Forefront-Antispam-Report: 
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(36756003)(83380400001)(82310400004)(70586007)(5660300002)(2906002)(316002)(8936002)(36860700001)(6916009)(6666004)(47076005)(186003)(4326008)(70206006)(2616005)(336012)(107886003)(8676002)(26005)(16526019)(86362001)(426003)(1076003)(508600001)(356005)(40460700003)(81166007)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2022 08:40:49.3418
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1f77a4ae-f921-4cfa-e06c-08da033ad807
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR02FT011.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR07MB3891
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 11 Mar 2022 08:40:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2589

This has recently been changed in expand_wildcard_licenses().
(file: OECORE/meta/classes/license.bbclass).

Signed-off-by: Christian Eggers <ceggers@arri.de>
---
 documentation/ref-manual/images.rst    | 2 +-
 documentation/ref-manual/variables.rst | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/images.rst b/documentation/ref-manual=
/images.rst
index 0e3351bb7b51..31fb567687d3 100644
--- a/documentation/ref-manual/images.rst
+++ b/documentation/ref-manual/images.rst
@@ -21,7 +21,7 @@ image you want.
    image::
=20
            1. Comment out the EXTRA_IMAGE_FEATURES line
-           2. Set INCOMPATIBLE_LICENSE =3D "GPL-3.0 LGPL-3.0 AGPL-3.0"
+           2. Set INCOMPATIBLE_LICENSE =3D "GPL-3.0* LGPL-3.0* AGPL-3.0*"
=20
=20
 From within the ``poky`` Git repository, you can use the following
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-man=
ual/variables.rst
index 005456f0c437..925f439dc439 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3438,7 +3438,7 @@ system and gives an overview of their function and co=
ntents.
          This functionality is only regularly tested using the following
          setting::
=20
-                 INCOMPATIBLE_LICENSE =3D "GPL-3.0 LGPL-3.0 AGPL-3.0"
+                 INCOMPATIBLE_LICENSE =3D "GPL-3.0* LGPL-3.0* AGPL-3.0*"
=20
=20
          Although you can use other settings, you might be required to
--=20
2.34.1


