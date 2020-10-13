Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.76])
 by mx.groups.io with SMTP id smtpd.web12.10377.1602590998447499110
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Oct 2020 05:09:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=WLZCY0Ee;
 spf=pass (domain: arm.com, ip: 40.107.21.76, mailfrom: abdellatif.elkhlifi@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TouRBeQ0bvHgYkX9YIy6/95aB4eTaqrS2joH+c+Dplc=;
 b=WLZCY0Eei8sSR97xaIKvn1rGdz2zaPIZtoSHN0c9x4FRx1MyaLXRZ8gqBZTLQV3sU5pk+tAuoC36rQ05S+gx1DEWXdLbxgqcZimXIZVWikEEHXCrhYyxcd6cSev0ia7JvRg1wH66w0n910aVgOlfz6E5LlG86bHq1yowR0oOCxc=
Received: from AM5PR04CA0012.eurprd04.prod.outlook.com (2603:10a6:206:1::25)
 by AM8PR08MB5731.eurprd08.prod.outlook.com (2603:10a6:20b:1c7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.26; Tue, 13 Oct
 2020 12:09:56 +0000
Received: from VE1EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:1:cafe::1a) by AM5PR04CA0012.outlook.office365.com
 (2603:10a6:206:1::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.23 via Frontend
 Transport; Tue, 13 Oct 2020 12:09:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT012.mail.protection.outlook.com (10.152.18.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3455.23 via Frontend Transport; Tue, 13 Oct 2020 12:09:55 +0000
Received: ("Tessian outbound bac899b43a54:v64"); Tue, 13 Oct 2020 12:09:54 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 302ac27ee2af994a
X-CR-MTA-TID: 64aa7808
Received: from 4b86efc04e63.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id A85374CF-FA42-4078-8A7E-4FCB02D00E95.1;
	Tue, 13 Oct 2020 12:09:49 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4b86efc04e63.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 13 Oct 2020 12:09:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m3OVPrDxn1gALcZvkHy3PnnvfLWZkL9GJzqHFzNDLwmwo04kZX3Tyxy2EHvMLxdXijbdV5FK5oTiWQsFvdJZf6zW4tJqoicaBpNqDW2nTO7VSU6v3HM5YeN8UV9lLIzwCXeRHoxfNU8DbH4z40bnz50r/0biKDXboPHu8QPQEUFxo3SZuCV2bcppe4XT/Zhrnncp/PkcJJJ4lc7si3suVF+JdGapnQSJqqOmoD2va+udEDKFqlYc8lTH4M/rvFgs7xPND1XEFry7LYgjCUZwlVYZfIPN5k6XUvok1W/Cs34/MhJges8xSQFp09ibkhYxJTxSjbSwaVPEf7gNwO7SsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TouRBeQ0bvHgYkX9YIy6/95aB4eTaqrS2joH+c+Dplc=;
 b=VT9O3YGVk8Uwh+yrVhhVtwo4tbr+LDrt6S4Eynlx5ZTIEs4HznRQayE8cW1RPpvL6zHW9G7FOpI/GAYlGQRk0mDstvjGFfPzxdYIqYgF1kDOrWgBC/aADojypnAvxSXxRozDh7Pso3Sbl+oriO4vjLr8OWmA7YItZ4Cse9xRtfbxs6Xs7LxurdzHnVldmc8Vy+X3dFjU+6PNwW1IEEW9EMLIJutYDxz5gxtYDgM+AhkkLX330gSvmBGDv5VfBCre6UDZmHs+3sQKw3bnMUkhEW61GO0fgJ4QxzoZJQxTCzZX74MJ/Qu0UWJj5IA+H9Erhb3MmBetKa/z7t47NCHO2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TouRBeQ0bvHgYkX9YIy6/95aB4eTaqrS2joH+c+Dplc=;
 b=WLZCY0Eei8sSR97xaIKvn1rGdz2zaPIZtoSHN0c9x4FRx1MyaLXRZ8gqBZTLQV3sU5pk+tAuoC36rQ05S+gx1DEWXdLbxgqcZimXIZVWikEEHXCrhYyxcd6cSev0ia7JvRg1wH66w0n910aVgOlfz6E5LlG86bHq1yowR0oOCxc=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB7PR08MB3531.eurprd08.prod.outlook.com (2603:10a6:10:49::17)
 by DB8PR08MB5033.eurprd08.prod.outlook.com (2603:10a6:10:e7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.28; Tue, 13 Oct
 2020 12:09:46 +0000
Received: from DB7PR08MB3531.eurprd08.prod.outlook.com
 ([fe80::e927:94f1:8ae1:aa32]) by DB7PR08MB3531.eurprd08.prod.outlook.com
 ([fe80::e927:94f1:8ae1:aa32%5]) with mapi id 15.20.3455.031; Tue, 13 Oct 2020
 12:09:46 +0000
From: "Abdellatif El Khlifi" <abdellatif.elkhlifi@arm.com>
To: docs@lists.yoctoproject.org,
	Lakshmi.Kailasanathan@arm.com,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH] ref-manual/ref-classes: update kernel-fitimage with Initramfs bundle and boot script
Date: Tue, 13 Oct 2020 13:09:37 +0100
Message-Id: <20201013120937.10453-1-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.99.251]
X-ClientProxiedBy: LO2P265CA0474.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::30) To DB7PR08MB3531.eurprd08.prod.outlook.com
 (2603:10a6:10:49::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e121910.arm.com (217.140.99.251) by LO2P265CA0474.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a2::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.22 via Frontend Transport; Tue, 13 Oct 2020 12:09:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8ccd87a5-0209-436a-6896-08d86f70e5ad
X-MS-TrafficTypeDiagnostic: DB8PR08MB5033:|AM8PR08MB5731:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM8PR08MB573177F16C37B62A693F040CFD040@AM8PR08MB5731.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1332;OLM:1332;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 N82zQ+9C5xXyZ1JTTt/KN6BD5IvJwQxkw3hQbsywwf6KDF34tPuoaQI+v8CTclf9R/TontFlHwURUktT5utEypEOL3I2kqhIbtPYyPqsgp9hi1uz0FbTvpwIEgq7Wa4hu0Exa28T2796N72CMAEEDKHl+BI6gS6lMD5lA7MFKXtzM8rKuq8PUTHjTJT4PVfNYaX8phLgZepG/h64A3BS+DJIEd8gxy58u3OfazPfNrHoSIcT4EMoT07FhS6dmZqN8G7dJj+s+1z0+blLUNcrw0B0H9NLJhnBC7xLFkKh+9z/fd9spIQORF7vc8GGULOgGZZqR17aX9MEfoxf4v6kRw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3531.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(376002)(39860400002)(136003)(396003)(4326008)(8676002)(1076003)(83380400001)(2906002)(9686003)(86362001)(8936002)(2616005)(186003)(16526019)(6486002)(956004)(316002)(26005)(478600001)(6666004)(66946007)(52116002)(66556008)(66476007)(7696005)(5660300002)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 uRIjq0LCSQW111bJH+bfI9DANR1noVraY/J0z9c/kMadfSTNW4O8UcCuzesZ6SWDe3z9/stLZg64e0/bHifF85hurbL34Ev3aBk16QQbdWDV6bW1LyWAFyx37GATsOIGCBOcUpZhrgwxZ2/OIZjmB9HNUbjEgH5V2marWOF2J7h6Va4wfM41JOwhBYc2m1SVTS5bxClFEvqq5mX3SbOix9vIUzsv9HkvwHvtQ9F1Wit+VAXHaRIGJ84+/lO6SWRDn8QRdQrNYLc1GZBpeAm7R6anlz2c496eOkuzGBnyc6J83BhMAmHrBeiCbw05ZL5FATa1yN/rnGrAeXS1qmPsfRRq9kk+uEAIulkTrLcqxMY3bfHTV2/xXfJ3NdnSolAaJHCTxotLfqmSLxyxgtH0hQ3lkkYuXgghy3jWA9Gn1GxE9m/v0joTbpY7B8hsIQc9nUY/ygzcUxgqinahXzLcy2gdJ2y9o4KzILSCsW5kyB/st481fWgQgsQlUKEI4eTTpJcnI7AWwlW5QHsweNX4z8v4bt7fqdw2Tt98FzMhJphGGezhMgMCj6wI5zbhGqfe3ea1ElkHRClIBjEVONedOrnNksc4xPDL4COnTwykW2bQWs22W2A+NEixDrUTUK/BGo2v/mxCGrDcszJn6Zs9aA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5033
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Abdellatif.ElKhlifi@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	d8913c46-57ec-4e96-10b5-08d86f70e030
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+eT7pdP2PAb1/wJ+EnO+faYxf700JmLM2UfaG2sEvk5+GZa6D26bVFtimxKXv0QkVht93W2tUwUDRA5255J5kljLIB3IHMDFWnaiIQRye//Yx4NBUzxfhRF70HeLkHcPDBJbt34HUdu+Lj5jbJ4A8xIVjFpXOG0GEoU5o2htrt6sq5TYqVF91/rE7Epcmsb148cxDr/+pBPwHq6tcnbiljUJ238J5PFE8N4bHle4uQfxu3ykvdQL+1Aqp1/xTT3bTvTHH5JGP9bgOH7yDumWa2jdhtWcSo0WXCtX7wHZuMVMjfh7y7BAlTGr9O/6dhBSeoJE8gWzEItos9gecrBgHY1nhtzmQeJhnjyKj9ASPNmJS5YlWuRVmz8LdmUWBgs0l2Gvk84l/6O22sMEXzg7Og==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(39860400002)(396003)(46966005)(186003)(6486002)(70586007)(7696005)(70206006)(9686003)(26005)(36756003)(16526019)(4326008)(82740400003)(356005)(47076004)(81166007)(478600001)(2616005)(8676002)(82310400003)(1076003)(956004)(6666004)(83380400001)(316002)(336012)(86362001)(2906002)(5660300002)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2020 12:09:55.1773
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ccd87a5-0209-436a-6896-08d86f70e5ad
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5731
Content-Type: text/plain

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

This commit adds the description of the Initramfs bundle and boot script
new features implemented in the kernel-fitimage class.

Change-Id: Ifffa6b850308aa7ceadc4f117806cffad0137137
Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 documentation/ref-manual/ref-classes.rst | 32 ++++++++++++++++++++----
 1 file changed, 27 insertions(+), 5 deletions(-)

diff --git a/documentation/ref-manual/ref-classes.rst b/documentation/ref-manual/ref-classes.rst
index 756df2a60f..0e5342340a 100644
--- a/documentation/ref-manual/ref-classes.rst
+++ b/documentation/ref-manual/ref-classes.rst
@@ -1375,11 +1375,13 @@ generation.
 ===========================
 
 The ``kernel-fitimage`` class provides support to pack a kernel Image,
-device trees and a RAM disk into a single FIT image. In theory, a FIT
-image can support any number of kernels, RAM disks and device-trees.
+device trees, a U-boot script, a Initramfs bundle and a RAM disk
+into a single FIT image. In theory, a FIT image can support any number
+of kernels, U-boot scripts, Initramfs bundles, RAM disks and device-trees.
 However, ``kernel-fitimage`` currently only supports
-limited usescases: just one kernel image, an optional RAM disk, and
-any number of device tree.
+limited usescases: just one kernel image, an optional U-boot script,
+an optional Initramfs bundle, an optional RAM disk, and any number of
+device tree.
 
 To create a FIT image, it is required that :term:`KERNEL_CLASSES`
 is set to "kernel-fitimage" and :term:`KERNEL_IMAGETYPE`
@@ -1406,7 +1408,27 @@ Only a single RAM disk can be added to the FIT image created by
 The address where the RAM disk image is to be loaded by U-boot
 is specified by :term:`UBOOT_RD_LOADADDRESS` and the entrypoint by
 :term:`UBOOT_RD_ENTRYPOINT`. The ramdisk is added to FIT image when
-:term:`INITRAMFS_IMAGE` is specified.
+:term:`INITRAMFS_IMAGE` is specified and that :term:`INITRAMFS_IMAGE_BUNDLE`
+is set to 0.
+
+Only a single Initramfs bundle can be added to the FIT image created by
+``kernel-fitimage`` and the Initramfs bundle in FIT is optional.
+In case of Initramfs, the kernel is configured to be bundled with the rootfs
+in the same binary (example: zImage-initramfs-:term:`MACHINE`.bin).
+When the kernel is copied to RAM and executed, it unpacks the Initramfs rootfs.
+The Initramfs bundle can be enabled when :term:`INITRAMFS_IMAGE`
+is specified and that :term:`INITRAMFS_IMAGE_BUNDLE` is set to 1.
+The address where the Initramfs bundle is to be loaded by U-boot is specified
+by :term:`UBOOT_LOADADDRESS` and the entrypoint by :term:`UBOOT_ENTRYPOINT`.
+
+Only a single U-boot boot script can be added to the FIT image created by
+``kernel-fitimage`` and the boot script is optional.
+The boot script is specified in the ITS file as a text file containing
+U-boot commands. When using a boot script the user should configure the
+U-boot ``do_install`` task to copy the script to sysroot.
+So the script can be included in the the FIT image by the ``kernel-fitimage``
+class. At run-time, U-boot CONFIG_BOOTCOMMAND define can be configured to
+load the boot script from the FIT image and executes it.
 
 The FIT image generated by ``kernel-fitimage`` class is signed when the
 variables :term:`UBOOT_SIGN_ENABLE`, :term:`UBOOT_MKIMAGE_DTCOPTS`,
-- 
2.17.1

