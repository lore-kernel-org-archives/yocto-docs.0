Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ABAFD1F9D8
	for <webhook@archiver.kernel.org>; Wed, 16 Oct 2024 14:10:17 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.120])
 by mx.groups.io with SMTP id smtpd.web11.24245.1729087812141743646
 for <docs@lists.yoctoproject.org>;
 Wed, 16 Oct 2024 07:10:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=R61WJMNC;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.103.120, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sn2NdDdpFmhIfrNoJ3A6O2VbiBQtJ2AjjCz+7QtKd6i8aFtb6wO8e1z79syURAfdd1uny6GlghWc0ba+Xx4W5os/UvZ6hoI7t8kdb28C9zCqnE+HNWjKY+baIz/orLcU+5uDr07rIb3uMs+ieNPouA5bUyrUQgTgef5MnENgcQioDT6hqm402rLAZvDL27Mzo6HNepZQmT5D4dFNxkMYKmK0T+yxxUNxd37tFFEjTRGBh2lFWFzuabr1dbAPuqdsHdaxdCU/ddOIfftn6eZPPlAeP7Qu/1iwb9V76l7YHAjc2NUtOCXxjJln4vxXVBRiBq7OE6xVB1jT/DMaSPii5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C+lvvJam2Dqct9ZB8gnoYD5pmuf1OsSNzSiSx1aXylM=;
 b=atY/ZRRc94NTn3UQDdqKNsr80uWg/OspXHHvnVxVgmMuTg7Z73xAGDmFMlwsy80HU9NDBmuu30Bztmcq9ZNCzBP02BDhvd1/4JEJEdviq9C4IRcUqlBNxrOdwvvYxu8XoqyPub2aKKMxLU1iCbWmfJNYTSO45GQBrXTwaucgttPj2ekuNXIM3ZzY/zpluOLXInd3z+hNtkss5KwFfmS6k7YBU3jhRe84P6EaoRRonTNLyQhYvJeCCbLFgQIs7dol2SVidkwueSC3BSrSxp1ErrnfeXlITw7RziCJueANN8RaSf9fiNuvgyvLaA3DStREeHGlkdcLicopJ6eVL60jBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C+lvvJam2Dqct9ZB8gnoYD5pmuf1OsSNzSiSx1aXylM=;
 b=R61WJMNC1VVctlsr3B+1K9b7ktPNPt5WZsJyb74DDCxw4+hr1fVuXGhiwBC6MDk37maJAzo1qNv5sT+7CkyUOdfl+Hfmc0ovaCa6b7MBHC1FXXH4bgTa9YJQMhiDWC/dFYNQB0uqS1u3Rfm//DQdMsPNZO/Y46oiNK2C3PO7lQr2LtCYkmyB4/Y5Sgp2mKbhJps3opLkN5ry1ymOdbAPhRwsyWbNxQiWrm9Cr7B+snGeNa28zJ/rHUCSUiSWRKkhlCwuvIrX7bl2OM+vZiFrB/wix9osTMqCqZfUBZwhfhFzBLSCMYcTydt3G5uvF8Xx+iU+Rj/AAlh2s+5azBgLuw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by GVXPR06MB9178.eurprd06.prod.outlook.com (2603:10a6:150:1c2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Wed, 16 Oct
 2024 14:10:05 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%6]) with mapi id 15.20.8048.020; Wed, 16 Oct 2024
 14:10:05 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: docs@lists.yoctoproject.org
CC: quentin.schulz@cherry.de,
	antonin.godard@bootlin.com,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCHv5 1/2] docs: Replace VOLATILE_LOG_DIR with FILESYSTEM_PERMS_TABLES
Date: Wed, 16 Oct 2024 14:09:39 +0000
Message-ID: <20241016140940.3166992-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0054.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:9::24) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|GVXPR06MB9178:EE_
X-MS-Office365-Filtering-Correlation-Id: a531246a-b8d6-4687-39ef-08dcedec3be6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?broPYqyCDUWZyQqdx+/jD6LpaEYZFfI/i1XindUitKKHKiFjqM3bewI3qkyy?=
 =?us-ascii?Q?7eFFIfUGMR9sNpZj6PcFAFegc6M2nfBrGmi7VamK/PRb0cZsy8iReGvILfbt?=
 =?us-ascii?Q?a+TLsVaaeEtyEiiiuPdMHsnANulzsUT9xsNH65KCO62IESMxuuODRFznzVLi?=
 =?us-ascii?Q?KezpwfYMRIWTmrhSRaXwbsPuqhhVeGSBhNklj4/W3bWA/Vyx7Z8dntI4uXJj?=
 =?us-ascii?Q?QlhYPPsLi3Mxaq1+sxPOl1r9vN+RSeanthJ9txIm6DQmnJrfGjqXo64YyjvO?=
 =?us-ascii?Q?U7IzwIYAnGQGhQ47YqLZsUowXnwhzPWglOvLvLEKp8ovbBpf55LtudbXm7MN?=
 =?us-ascii?Q?YjU6lem+B1mNUbKB34ct2zkOZPUfTUh3FkpbZMVcDbaUoTbWaHZ4jTmSXUYg?=
 =?us-ascii?Q?fJ9/Rg3FKH6Y0vxEPVqhP+cn8gXqIIaBodeFC5aBjvHCw98mCzT7DidQXN5l?=
 =?us-ascii?Q?FIs62t5wukx13kpgi2/XcH6FWooJ0jIry4UdnR0t22mS5XD0kB+gpBmzRXjh?=
 =?us-ascii?Q?uavsqMMcf2G02git6QL+DKJOBkblxH8uaT7edIF5SHvPR8Fmc1FCmT44dEvP?=
 =?us-ascii?Q?87bgRUHVNN1YHr1xo270YdG8J19JJsI/5sfHSrZ5/G7VbfUC9ZVOEvl9DpMX?=
 =?us-ascii?Q?riZOLSoebDbRenep37yWA3RR1BUB7DPOb+hBQx+yWiv87DHFDlS1pABseO4e?=
 =?us-ascii?Q?vm43vuh/oOVLXrUnwqIXjEkKZ/DIDZm1W+5gKpTGWF8P2GmL+cXR9c60OZ6V?=
 =?us-ascii?Q?KCpVzNmPuUR01ASPZNvpdPohebO4ZHMkM0+8QVRBBxqwU0nD5wKnuKCtXncF?=
 =?us-ascii?Q?gOlD/+bpn+RtG4ZVVc3xoEhDAK/iCnFbdKhvSDM0ro2htWkQ2A0v+TVCxzwQ?=
 =?us-ascii?Q?m5nRY/gb4LbULEZykaSwm+vBfWo5aUkoDzIIKXI1JAk/Xdv96V+rahBtttdI?=
 =?us-ascii?Q?yV5ZKA2mNzf1FqWkgPIeqyxO1ES8SVTNq4+VCaRIk/lQ6GWMs/FZgZG6B8P/?=
 =?us-ascii?Q?x6b1AojBPET9YiiMhug8N9ECFujNW0FEG3SEwx2SudF3U39akY+c8ulwsgWT?=
 =?us-ascii?Q?LkLp3TZZmIG2zTu9FJirPGZb+j38tJbA/JLpfoQNPNJjbISJxGzxH4FQf4Y1?=
 =?us-ascii?Q?R+xMap7y7jbYG803vyMpqM0ezFACGTarbmRafxsKkCD7ACEXTmyVaxcSjvj6?=
 =?us-ascii?Q?Cx+r2GKMlhYYJig24xRDLVExe1TQdrh+gbQasC8cvUl5cT5mGKZEfemradkN?=
 =?us-ascii?Q?xIAYSqg9jahnaLbznYimt9oCIbE0SuCN/Y3DDkc6Wg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4LsmsojS9Z4k0IIXPDvAQIbJe8iKaj9j/zEfqbryfIoI+6++9lWLF5C1EZSA?=
 =?us-ascii?Q?Z7MQjVacD0oir1iRZ524F0giGe6u6IVLuLT3xQIFPTe+l3mXpaGfaU+aTZ6f?=
 =?us-ascii?Q?UP7vWY7Pwm8K11usqsyU90ri4OED58vtOwdI0KQyiSbSJy62Y8Negv3BGW+p?=
 =?us-ascii?Q?n63cr1kluWHj/ZQNm+Qd8hp+E3ORRdaA236l2gp8/HyS0iX+Dzh/iVg1BWNq?=
 =?us-ascii?Q?gkFskXoXmv1ehktarostx9pFI2WUvOYYP+kdFANWyierpdie7w3Hc0n7ccC5?=
 =?us-ascii?Q?Oa6q1R7vA5WtBMLrF6fO7IDciQyQW4NATOAGpyGElhJnvqBarwNVTSYy1b47?=
 =?us-ascii?Q?v38nsgFMeGHW61a7natPcdH+gWxZgY1vCOQAhCsj06eYQHs1zzXbS3O+qDG9?=
 =?us-ascii?Q?A5RYAizZTRhuBE5Ble7RBbi7M99JGwJS+Lvd10grDYUB4i/UUeBllVwGLukt?=
 =?us-ascii?Q?jMs6deIxLtF+zFXY+hJzYlbuy2A440DObQ4WMwWccaxh7LQaiXZbBDIVAdV2?=
 =?us-ascii?Q?iBZQfSJOMs12kgnuCz6gryWCRZaSRkG51x9FirtcOefshIcI775epGhWfglu?=
 =?us-ascii?Q?LYk+DdxGiMy2VLlaEskIwFAaa9HfeEOTPvzba1S9G0GX9RehpeLtpSNVchxW?=
 =?us-ascii?Q?HNgAO5/3TGZAPWGVYaCNqwa5MevRHldw6zF3muzn79+OLiPxm4ILMthvzOFF?=
 =?us-ascii?Q?D9e2KqCsAFJ8/qy8As8PZjzDIofjibhE7HEM2fR2RI6Sa2N3J2NjJtjgNWpO?=
 =?us-ascii?Q?cODEoVjW8vtuYEZ4lKf/JU9DXaxcyYeIryqzhkIoLW6C4qB314/t/yr0tYLF?=
 =?us-ascii?Q?d1Y9S5bfMXnd1X4af92PTx8X704uTcQTkyidiAI9q4pQ4bmW7KQ1IQe6EZyq?=
 =?us-ascii?Q?qf7VZdhqAh2PXbOhF85863RhNaQ9AVD08rVFiNGZZAc5NnwASfcRHNAMQSjC?=
 =?us-ascii?Q?+QkhjkODOhG4M3Ii+4bjZJi54o7drNkHxSSWUnsqe5MmnubSqF3T3/E1qrsY?=
 =?us-ascii?Q?VB4QJm/o9yIfA0hKOipF7fTKRYyi8aaxlZ/iCK+ye/T/DYXpW67hRm7wRtJ+?=
 =?us-ascii?Q?pczhxOBjUEiC8nrQz+FXU88Ch4nwXrFZPzBa7mi965puqmXkj5oPBhbGnSY2?=
 =?us-ascii?Q?aMGGqsgf5jVYwAA97A+UGDMojIwcUahYaupgeHyZusHUfta1Oy5Gk2pOX9Gy?=
 =?us-ascii?Q?HynEfk+bBrXkirNrNi4uQevYZWt4NBuxc0orN20ganNwb7w2RqJCrluQ8T5r?=
 =?us-ascii?Q?PyA85Ne4YQTIcKo1NEhTmC5OX02veIZKbKo0AI32zhpfxuhwLNmDQHFRMC0/?=
 =?us-ascii?Q?3dOS0NQcmNUq9GbhQQsX4Rtl1X/4PvFNe8Mgu/SG/GrtqJQzcqVhiXwx6REl?=
 =?us-ascii?Q?YpIEeFvlVu7wP4mA+9dFsI8CiOI8T8gVVB0WfA8tZfjLdD09zSfkLYDEQzFk?=
 =?us-ascii?Q?iweAfZCExrjV/ptGUly3MzdVkRGLJHIbxx8L0x3E+cvLgrRTffoN/7F6FJEH?=
 =?us-ascii?Q?DlTpbIpW/gQLfGnAOC0YrkJoILoKHJoWmCgba+Jo7r3a/gNfmTuIk5Voyb3Y?=
 =?us-ascii?Q?BomHItTICl6zDDXg+mQ4pdsj5Q2JCxgPH+UPuKAh6V18OlFt0Z1naXcohR1s?=
 =?us-ascii?Q?7Q=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a531246a-b8d6-4687-39ef-08dcedec3be6
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 14:10:05.4114
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pFYf3b7Yuh991rhiuRpUlT2ROYFLpB47iGGNX7VSzbiHTD5Y0vtmZ78vMXkxU0yo3DSQOMkAXTyViGwNaPD7jQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR06MB9178
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 16 Oct 2024 14:10:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5513

The VOLATILE_LOG_DIR variable was removed and it's functionality
replaced with a FILESYSTEM_PERMS_TABLES entry in
https://git.yoctoproject.org/poky/commit/?id=3D2f8806deb7655b37d6f8d12ff546=
80d6acf7a298
("bitbake.conf: drop VOLATILE_LOG_DIR, use FILESYSTEM_PERMS_TABLES instead"=
)

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 .../migration-guides/migration-5.1.rst        |  6 +++
 documentation/ref-manual/features.rst         |  5 ++-
 documentation/ref-manual/variables.rst        | 40 +++++++++----------
 3 files changed, 27 insertions(+), 24 deletions(-)

diff --git a/documentation/migration-guides/migration-5.1.rst b/documentati=
on/migration-guides/migration-5.1.rst
index 298ff3e250..2b945f8165 100644
--- a/documentation/migration-guides/migration-5.1.rst
+++ b/documentation/migration-guides/migration-5.1.rst
@@ -117,6 +117,12 @@ Removed variables
=20
 The following variables have been removed:
=20
+-  ``VOLATILE_LOG_DIR``: :term:`FILESYSTEM_PERMS_TABLES` is now used inste=
ad.
+   By default, :term:`FILESYSTEM_PERMS_TABLES` now contains the value
+   ``files/fs-perms-volatile-log.txt``, which means that volatile log is
+   enabled. Users can disable the volatile log by removing the value
+   ``files/fs-perms-volatile-log.txt`` from :term:`FILESYSTEM_PERMS_TABLES=
`.
+
 .. _migration-5.1-removed-recipes:
=20
 Removed recipes
diff --git a/documentation/ref-manual/features.rst b/documentation/ref-manu=
al/features.rst
index b2ba731bb2..6e52dfce17 100644
--- a/documentation/ref-manual/features.rst
+++ b/documentation/ref-manual/features.rst
@@ -327,8 +327,9 @@ The image features available for all images are:
=20
    .. note::
=20
-      To make the ``/var/log`` directory on the target persistent, use the
-      :term:`VOLATILE_LOG_DIR` variable by setting it to "no".
+      To make the ``/var/log`` directory on the target persistent, remove =
the
+      ``files/fs-perms-volatile-log.txt`` value from
+      :term:`FILESYSTEM_PERMS_TABLES`.
=20
 -  *ptest-pkgs:* Installs ptest packages for all ptest-enabled recipes.
=20
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-man=
ual/variables.rst
index 32c9e7407d..c27a0ad7d6 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -13,7 +13,7 @@ system and gives an overview of their function and conten=
ts.
 :term:`K <KARCH>` :term:`L <LABELS>` :term:`M <MACHINE>`
 :term:`N <NATIVELSBSTRING>` :term:`O <OBJCOPY>` :term:`P`
 :term:`R <RANLIB>` :term:`S` :term:`T`
-:term:`U <UBOOT_CONFIG>` :term:`V <VOLATILE_LOG_DIR>`
+:term:`U <UBOOT_CONFIG>` :term:`V <VIRTUAL-RUNTIME>`
 :term:`W <WARN_QA>` :term:`X <XSERVER>`
=20
 .. glossary::
@@ -2988,26 +2988,30 @@ system and gives an overview of their function and =
contents.
       :ref:`ref-tasks-patch` task as well.
=20
    :term:`FILESYSTEM_PERMS_TABLES`
-      Allows you to define your own file permissions settings table as par=
t
+      Allows you to define your own file permissions settings tables as pa=
rt
       of your configuration for the packaging process. For example, suppos=
e
       you need a consistent set of custom permissions for a set of groups
       and users across an entire work project. It is best to do this in th=
e
       packages themselves but this is not always possible.
=20
-      By default, the OpenEmbedded build system uses the ``fs-perms.txt``,
-      which is located in the ``meta/files`` folder in the :term:`Source D=
irectory`.
-      If you create your own file
-      permissions setting table, you should place it in your layer or the
-      distro's layer.
+      By default, the OpenEmbedded build system uses the ``fs-perms.txt`` =
and
+      ``fs-perms-volatile-log.txt`` which are located in the ``meta/files`=
`
+      folder in the :term:`Source Directory`. If you create your own permi=
ssion
+      setting table files, you should place those in your layer.
=20
-      You define the :term:`FILESYSTEM_PERMS_TABLES` variable in the
-      ``conf/local.conf`` file, which is found in the :term:`Build Directo=
ry`,
-      to point to your custom ``fs-perms.txt``. You can specify more than =
a
-      single file permissions setting table. The paths you specify to thes=
e
-      files must be defined within the :term:`BBPATH` variable.
+      You can override the value of :term:`FILESYSTEM_PERMS_TABLES` variab=
le
+      in your distribution configuration file to point to your custom
+      permission table files. You can specify one or more file permissions
+      setting tables. The paths that you specify to these files must be de=
fined
+      within the :term:`BBPATH` variable.
=20
-      For guidance on how to create your own file permissions settings
-      table file, examine the existing ``fs-perms.txt``.
+      In order to disable the volatile log, which is enabled by default, o=
ne
+      can remove the ``files/fs-perms-volatile-log.txt`` value from
+      ``FILESYSTEM_PERMS_TABLES``.
+
+      For guidance on how to define your own file permissions settings
+      tables, examine the existing ``fs-perms.txt`` and
+      ``fs-perms-volatile-log.txt`` files.
=20
    :term:`FIT_ADDRESS_CELLS`
       Specifies the value of the ``#address-cells`` value for the
@@ -9983,14 +9987,6 @@ system and gives an overview of their function and c=
ontents.
=20
          PACKAGE_INSTALL =3D "${INITRAMFS_SCRIPTS} ${VIRTUAL-RUNTIME_base-=
utils} base-passwd"
=20
-   :term:`VOLATILE_LOG_DIR`
-      Specifies the persistence of the target's ``/var/log`` directory,
-      which is used to house postinstall target log files.
-
-      By default, :term:`VOLATILE_LOG_DIR` is set to "yes", which means th=
e
-      file is not persistent. You can override this setting by setting the
-      variable to "no" to make the log directory persistent.
-
    :term:`VOLATILE_TMP_DIR`
       Specifies the persistence of the target's ``/tmp`` directory.
=20
--=20
2.39.2


