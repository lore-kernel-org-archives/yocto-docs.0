Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63DACC02181
	for <webhook@archiver.kernel.org>; Sun, 26 Jan 2025 12:38:13 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.91])
 by mx.groups.io with SMTP id smtpd.web10.29287.1737895082587663919
 for <docs@lists.yoctoproject.org>;
 Sun, 26 Jan 2025 04:38:03 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=gfm7Tcqa;
 spf=pass (domain: navimatix.de, ip: 40.107.241.91, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M+BuYF8p4jn9ADIrqN+6SvXkr0noZp7dUb1FG58OIJSVJRbrcvp/ZiZSzv7X4OILqLu/CUT2Pu/dIJFHeLYcZRrXNwcsuI7NZC6YfFdSk8urKftgMLDUsNxhrgt3P8DaOLK0EhuqZzfpNtfIdMh3t24r8R2LC9vYbEuf5FFYgfanyVOlGbxKZIBN7vRtWJhB/yEUHyEWuDZdi1kfX8dJ7xZE9gHE02hxHXK5H18tgtatr8BhBAYECCrAbUqt60T7ZxJmqg183XYq0sBE9jAY0efteDqD4BABXK6bW6I7BiF93UnyTk/W3muAgSeu5x4UYw/he+wllKxuQhP/3mhFXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AUvOuSz6jibGYY+h0974igw8yREFrAWkVDWhtF8iweY=;
 b=aerDYKDKmpFbWmkC+0mBeQCbg3PNAZDu/WHUfhZMF6F8hZHXR9/P/M2c7QMFZrqgbQ2vTTrRnscUmfmGZZDF2TNOu5h/qaeSPrvEuu9HJIe951hULrrxRfYI03GHG1OYiWvUVlO/dvLGHdvJLlniV/EVfVuaVlRSXIZLZhjaUTh1/jRD17ZWgu6AwPFNADG0XxJjjT+TaQ0rqJcBTgOd40Dgl0IvjMK0D/T6HSSyM7c+dtooDV9o9K9OpBjcUadCNxKMv4QLwUjMRIOnFxXCqrw8r58DNmYl7Wy+QeWVLgVd4vNAm0eIq2zkDDEHMxPKr8/NlVq1XENXgLzrtuAsoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AUvOuSz6jibGYY+h0974igw8yREFrAWkVDWhtF8iweY=;
 b=gfm7Tcqa3ivoKf58zj25jZHTgmJXGXCSJ7RAyyxB5oyj4jad2OZMsoxR54EfjnrsTNKpuzfFjf/t5fy30Bs9el1x1PlmbHpmb5Qfw4MrHmRh+4ccAp2l+9aUbJZAxKPgeRLa3ZQgbf4KUQlrzeyhXZ5id5wjTQVjbMLbWR3AlAc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5) by AS1PR01MB8914.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:4c6::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.21; Sun, 26 Jan
 2025 12:37:58 +0000
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7]) by DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7%4]) with mapi id 15.20.8377.021; Sun, 26 Jan 2025
 12:37:56 +0000
Date: Sun, 26 Jan 2025 13:37:54 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: docs@lists.yoctoproject.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH] doc/wic,README.hardware: add dd option conv=sparse
Message-ID: <2cef35c707ab0d985578ca4d042cfb33902dbcb5.1737894876.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.47.1
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE0P281CA0036.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:14::23) To DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR01MB8293:EE_|AS1PR01MB8914:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d0b6467-ea06-4afe-3b34-08dd3e064256
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Zjsv65xaXf5dfttQu48xyYCoyNGujIW3UBb+4KH/qKhI7YOanisn6AZ1NJhI?=
 =?us-ascii?Q?ZDUb8CISbOLCht0UQcy5LNtBm16vKCF6t/m1JM8tdvyGqCnlXgdKuHmq+Kip?=
 =?us-ascii?Q?A/Bu9zMU9xfik+UKxh4vlBoxBAEAWLApn1lriofBhCowj9b09tqOPgaso6y/?=
 =?us-ascii?Q?NTsMu1xbwd9azXSq7hwR4oV7aGcl9GoB8j6I0ntD7Jw7b+phRRRY8pWq9uZA?=
 =?us-ascii?Q?khK0so5VeDXfI5XgoOrGe1V4U0sUj6hGCQVxLzws9OMd7BATlf9Yo5uS7c2d?=
 =?us-ascii?Q?vL8uTy0oKFMiEn0DL3T8vSmICh03fpYxQmw21y8DoW2vCPcleis5Q1GEqCFe?=
 =?us-ascii?Q?y50R1ktij7VJ1PIUeuLOenllCi55+uxMER8cIhTS+mvyzrUqAfUzgJHUDCCP?=
 =?us-ascii?Q?e0FwmwIug4KyZb4rSuGjuE8QKXMC6VA8QKe3cm3U0NbZLXDn2aK9XfM2Qq6U?=
 =?us-ascii?Q?7wZTT0CNwmI3RiwYdPFyhxNxiFE1S5E1dVPymRD4E3I0fMI52hExi8yirl30?=
 =?us-ascii?Q?QbWfreGU9H1JuWRUZ7Lz/5+ESyIX4pELsem2GFgDsdPZkoqEfMEnah7W+Dkz?=
 =?us-ascii?Q?cKs9bRBbBp6V6gexA79BsfSSXMd/zmFtcbiBujhyJZo0Mvr86cR+soV1G6bz?=
 =?us-ascii?Q?hhHNa+/JS7Uwcuc0eaL8TtMmm9dt9ahZGWW06aWQYmgtYcViZVe3iNcDllyp?=
 =?us-ascii?Q?abeAtgh3/IeezcMo3poK6+LjZ2Sm3StvVj32xBNuizUCxDMOk80TB3FFtecg?=
 =?us-ascii?Q?0RpRI/akNfQKTuR3+BIu2SGRBkcYzwQGonM9Q19LqYweOqhPvIWSxZ1GFeU2?=
 =?us-ascii?Q?S4/EYLQNVTtLE6BiZ7MTe9fnOjLJ+nZW5QyBKbGyMEVFiRmKsG7GKP4jauer?=
 =?us-ascii?Q?eZA/n6uIZ6aPRn3IGtC+7RTN5+fgQSKB0sOUfPoZ7f30Nho7W2AEaAkogzJ+?=
 =?us-ascii?Q?CxKant0M6IgYPsG9BguJo/LragA4xGVJMEpqgr/e85pdQdjG+lL5F/NI3LUH?=
 =?us-ascii?Q?+eRyuhbowe6svnV06mAd5dS5GZVjwkczfg6AIKjTbeQ6H83EcQWfi5jOs/b1?=
 =?us-ascii?Q?T90SYShHTR8hqf17fl68VqXKR2JWXJtLV6QoFUdBOiPPGEuhOe7q0jT1OMRV?=
 =?us-ascii?Q?8eqXm4Y+q4vlFS4ePH+eH5qogbh5ZDM1bFBzaG2qw2ONqj8gmFuT4giFhgt6?=
 =?us-ascii?Q?yxGV0oSrD9jmGerzmDcXhFLBhIGdgGlSHIJyNeHC7PgGOlVrl/yx3HW/4phN?=
 =?us-ascii?Q?XW+Kd/fQPGK4VrITCSASGwpAY2tHrEup3rAF8N6LgIJF7ICdx23hFDFxFSdn?=
 =?us-ascii?Q?kwKYp9CzeFwDml8+MhkiQ5AMwSlQ0RhBKffGO992JKhdrnp3FFPOhAkrENGl?=
 =?us-ascii?Q?5YBRSMLG6cU8cVi+CFkyrAu0Zw1c?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8293.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Ld+ZqV43iuPGdnYKK9e48pb4G0QZ5sPg+LnMJpPz6SlPATFBPJSM7HxFJ5tp?=
 =?us-ascii?Q?uiSQBFoVOijmogDaHnIweaYz9jg19D5kohQl1Q+dSFFKR4GRPZ9jy+sV5rDd?=
 =?us-ascii?Q?/nO8Ft6I1zP0U7uMbEqVHHyo7c9SfJQov5V4estGAHLjt6eL7WGt06KS3It4?=
 =?us-ascii?Q?ho9R4Gq+sYJoO49bDWt2fAO7/PcMkIVKCyxLAn9w9yI8lOkFte2ncpESTPOB?=
 =?us-ascii?Q?tAnrwq4HSMoxD6MnPSTlzNs7qlNPJVz0K/MDhrAbBy2cZtwZBnmnWQ3JS/6d?=
 =?us-ascii?Q?wsjUUuy7DNOifz7NkoN8Oj5kNJtA5eOR8eNKy92g0uuHsD07qyY0LAGFUmgB?=
 =?us-ascii?Q?m8jvTSW0jzwq2AOZXPTtyJxqJPyMcX4+g9+bk10IOSg75lVcSF3q23HyjsNL?=
 =?us-ascii?Q?4fY1UkR5e79j7KaBXkzRI59oBgrj80mxqvrRFEEflncJKNudjVrIc7mt6kN6?=
 =?us-ascii?Q?7ro42OnwUWhyWhV4gRCHiunC2wLJbgD+0uPYBrpRHH+6MBqpCLcvCsD/V+LI?=
 =?us-ascii?Q?8Eovtn9QStfxpS7kpr3EUU1usWrnB2HvuK8bZuH/R6NyMFXbTzMSE9l2XEiU?=
 =?us-ascii?Q?KZPCqAcymhUaM3PF3t0SYbspNshSOldDO1AXU0MOCqNt8u06jsJjwoQm/ZXm?=
 =?us-ascii?Q?UX610wK3kNZec16JTqDaRQw5O6Brc8mmpIPokiTLhbzH3bjlBmCYbKBtJ78/?=
 =?us-ascii?Q?xSnFDjS6wEHksTraYxF1N1y8qw21v17FC3y8JfCAVZg62gaoZeIOjLOWSBAl?=
 =?us-ascii?Q?7PDg6TBRMwOSgehSAqecPfkTaAh+Ay+pW8w8kuYkymJh7XilV+BclEpTGDUF?=
 =?us-ascii?Q?G+EoStUUD6znfQiPeNro7XFVM0yjyqwRrixVgtEr01dklI26Cwq3wSAXu/+W?=
 =?us-ascii?Q?zTMky8WoFFT/SQ9kn/jabdtl9N8Ec2IzGsjcH9bivvSGsV+eD62nKI9nzdQ/?=
 =?us-ascii?Q?ydCkeP1nkoSpRGpVk2In8fU3ESfT0fcFXpO73RA09MCvVYlhipL3TQsxnfcY?=
 =?us-ascii?Q?+NU+aCbJZpzDbcG6QX3V4B1rVe6cVydUGB0K8TOm4hwp9cdXjOTR6J6L9DL8?=
 =?us-ascii?Q?PHL7QfJp3VnSbT29kD4gVa5G6FCPQZr6Cb4jitzYsnbfu42/FF5u6jm2glJo?=
 =?us-ascii?Q?akEQf4ibZcNSxSQnNwt+8KJwAStQXOwXIuH3DAs9WROGuSIyZ6rvtBwcjQ/2?=
 =?us-ascii?Q?22l5KgK/RPhHvQLd1PRKZ/Y9AQT8zK8pld/yj/MsZsTeoVC326q32k47u8tS?=
 =?us-ascii?Q?r9zEnaMX+nMHRh7DFgG+xwjAulB/xT8Xw7MhAmvlzy23MXcPmXKyD0mm6IvN?=
 =?us-ascii?Q?XiV/BM2/3D9mrOappveDMQQe0nfocO+IG3TiJq5w5PFhUE9o1d4Eaz4N/aWf?=
 =?us-ascii?Q?pKqrZthJe7gEvkTzqIJFlcxwRALLGKEwR3+l0lALjNPOTzHdudEHwcNsSKs1?=
 =?us-ascii?Q?ka+0fRMowJgIPb4qXyoMLaSvce/Atw4OnLR2EZZocZdZT6J/Tdx39PCwPFm9?=
 =?us-ascii?Q?44TkpzF/tBf0reOzBZzSVeCF2ZU139hrqKIrJq7Mc1fHVVfBXlfbj5lJ0vHG?=
 =?us-ascii?Q?vAPzHfQBJFzUcOu5e7gdovMt3nLKxeuApTnPjJFXn14ihS4Ye6oUoQMYmGni?=
 =?us-ascii?Q?xw=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d0b6467-ea06-4afe-3b34-08dd3e064256
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8293.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2025 12:37:56.1039
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1T14hv5AcfYvi/KuzKuvF0LY+fLHJUh2vdmT7qrQhb45LQk/b3x+88AJcf6DK/cjT5J1YWU7KnTwVFRZBV/HmUY/1bvvoA2pHWO8Km/BM5c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR01MB8914
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sun, 26 Jan 2025 12:38:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6178

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

The GNU implementation of dd supports the skipping of sparse blocks which
can speed-up the write, esp. of wic images with big holes:

    $ sudo dd if=3Dimage.wic of=3D/dev/sdb bs=3D2M
    2683+1 Datens=E4tze ein
    2683+1 Datens=E4tze aus
    5628735488 Bytes (5,6 GB, 5,2 GiB) kopiert, 84,2773 s, 66,8 MB/s

    $ sudo dd if=3Dimage.wic of=3D/dev/sdb bs=3D2M conv=3Dsparse
    2683+1 Datens=E4tze ein
    2683+1 Datens=E4tze aus
    5628735488 Bytes (5,6 GB, 5,2 GiB) kopiert, 11,3314 s, 497 MB/s

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 documentation/dev-manual/wic.rst  |  8 +++++++-
 meta-yocto-bsp/README.hardware.md | 20 ++++++++++++++------
 2 files changed, 21 insertions(+), 7 deletions(-)


I don't know if I should amend the "dd if=3Ddirectdisksdb-gpt-201710090938-=
sdb.direct" in line
595, because this wouldn't match the output of dd.


diff --git a/documentation/dev-manual/wic.rst b/documentation/dev-manual/wi=
c.rst
index fced0e170c..792fa35fa7 100644
--- a/documentation/dev-manual/wic.rst
+++ b/documentation/dev-manual/wic.rst
@@ -507,7 +507,13 @@ built your image, and boot from the media. You can wri=
te the image by using
=20
 or ::
=20
-   $ sudo dd if=3Dmkefidisk-201804191017-sda.direct of=3D/dev/sdX
+   $ sudo dd if=3Dmkefidisk-201804191017-sda.direct of=3D/dev/sdX bs=3D2M =
conv=3Dsparse
+
+.. note::
+
+   The option ``conv=3Dsparse`` is a GNU extension to skip writing of bloc=
ks
+   with purely zeros. If your ``dd`` (e.g. BusyBox) does not support it, y=
ou
+   can safely remove this option.
=20
 .. note::
=20
diff --git a/meta-yocto-bsp/README.hardware.md b/meta-yocto-bsp/README.hard=
ware.md
index d2cc05f909..a824963e4e 100644
--- a/meta-yocto-bsp/README.hardware.md
+++ b/meta-yocto-bsp/README.hardware.md
@@ -91,7 +91,7 @@ Depending on the device, it can boot from a traditional h=
ard-disk, a USB device,
 or over the network. Writing generated images to physical media is
 straightforward with a caveat for USB devices. The following examples assu=
me the
 target boot device is /dev/sdb, be sure to verify this and use the correct
-device as the following commands are run as root and are not reversable.
+device as the following commands are run as root and are not reversible.
=20
 USB Device:
=20
@@ -105,7 +105,11 @@ USB Device:
   2. Use the `dd` utility to write the image to the raw block device. For
      example:
=20
-         # dd if=3Dcore-image-minimal-genericx86.hddimg of=3D/dev/sdb
+         # dd if=3Dcore-image-minimal-genericx86.hddimg of=3D/dev/sdb bs=
=3D2M conv=3Dsparse
+
+      The option `conv=3Dsparse` is a GNU extension to skip writing of blo=
cks with
+      purely zeros. If your `dd` doesn't support it, you can safely drop t=
his
+      option.
=20
   If the device fails to boot with "Boot error" displayed, or apparently
   stops just after the SYSLINUX version banner, it is likely the BIOS cann=
ot
@@ -119,9 +123,11 @@ USB Device:
=20
   2. Use a ".wic" image with an EFI partition
=20
-     1. With a default grub-efi bootloader:
+     1. With a default grub-efi bootloader (`conv=3Dsparse` is a GNU exten=
sion to
+        skip empty blocks for speed up; remove it, if your `dd` doesn't su=
pport
+        it):
=20
-            # dd if=3Dcore-image-minimal-genericx86-64.wic of=3D/dev/sdb
+            # dd if=3Dcore-image-minimal-genericx86-64.wic of=3D/dev/sdb b=
s=3D2M conv=3Dsparse
=20
      2. Use systemd-boot instead. Build an image with `EFI_PROVIDER=3D"sys=
temd-boot"` then use the above
        `dd` command to write the image to a USB stick.
@@ -179,8 +185,10 @@ From a Linux system with access to the image files per=
form the following steps:
=20
          $ bitbake core-image-minimal
=20
-  2. Use the "dd" utility to write the image to the SD card. For example:
+  2. Use the `dd` utility to write the image to the SD card. For example
+     (`conv=3Dsparse` is a GNU extension to skip empty blocks for speed up=
; remove
+     it, if your `dd` doesn't support it):
=20
-         # dd if=3Dcore-image-minimal-beaglebone-yocto.wic of=3D/dev/sdb
+         # dd if=3Dcore-image-minimal-beaglebone-yocto.wic of=3D/dev/sdb b=
s=3D2M conv=3Dsparse
=20
   3. Insert the SD card into the Beaglebone and boot the board.
--=20
2.47.1


