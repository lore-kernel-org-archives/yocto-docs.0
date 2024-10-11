Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F30EFD0D7AE
	for <webhook@archiver.kernel.org>; Fri, 11 Oct 2024 14:49:20 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.101])
 by mx.groups.io with SMTP id smtpd.web10.13683.1728658158982925223
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Oct 2024 07:49:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=i7UoVc5y;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.104.101, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fRBBbRW2fHUQqncoGjVwJhy8a4om+S+lteb66VrJ7TGwdnOoCHC5pwAQNao0bWhXjtk1iu0+4+5WIUowtrjSlkCiEhu+Z/65rXPsEGXx2Eh1zY0d2cy+VclEMu5qjNMhYAiDeA5pdb91hQv7S85OLwxStHvZ6o1Hmn1468fJrA7VsklK+0H9/wlpK2vyOaGjxASP1pgM8wzcEG/JLBnHMI1IW6Dca3uM9NvetkX4e09QTN1+vRBK2yiV7d79LmV2KX4OqJvSZP4aK9j23B/yWkteLleGqJmYn4ik68eaxpn4htuPhl4tHLfg2i3sjklZC1ckLUJkLmfPAOJlk9JOrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cKmLrJETa/r+1erbyfZLtEZ7SILD+ipuMJV9WmX4gdQ=;
 b=iriSuQlROlA/g+Lh2Ba2z3j1LiSVTIJFalwgY0/PDaquG/MVB0fcA8fvHm86qF0BPFaKWywoAryRfx6Sl/c4n4jH4Zw4a/ehaLapPV0WW97Q5dLqlTfKwD5xn1pvsf4Y21EtQHVdVrHJAscyUW/fj8UMNlNzefITJdU+bQKLTClk9gl2hYkJGoRZwJ2tCbMVmyy4Wh0N6uqvuG3IdUd0UIRnzsyaP9EblHkWGn33SeliBwc8DFGhQARJ0l8Y/LKFC2yl7Yj3LQhWeccLaMU6ND2vyH6eLd8YcGXjquIYbgZbq44iIf3vVBxynFfMQAHYfB5RywAid8f7CbLGF3PELg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cKmLrJETa/r+1erbyfZLtEZ7SILD+ipuMJV9WmX4gdQ=;
 b=i7UoVc5yEZC2AkaNWda6cHb3FZTrRJQaj3QzhOq1axEaAjs8FWeKQ8ZIu9ZOqdVtW3uE85mY4fAG+4MLE7ndpSHduOptqCz1w7GBSy1zrMqYLfbZCWFQ7cP4+fjothxFeKmSki7HMWrBDBL0liO/CxSxvqK5AUDAt/2Uxcpx28ez80OLgXEKFkG2073LAI3zC8qiCwPqfbg5hgqHIFyONgWz+tkCyp/lqxYw1OIgzRt+mysno/OJvVk5Wh5d0fMp9Zeymmthh+hm2aiZ05nqne8aJsuMqEsqJoAyAz/L4wR79sYnnqsHbQu/gkEWCjT3oCE1QQLJZK0bsB+YILW88A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by AM7PR06MB6519.eurprd06.prod.outlook.com (2603:10a6:20b:112::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Fri, 11 Oct
 2024 14:49:16 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%6]) with mapi id 15.20.8048.013; Fri, 11 Oct 2024
 14:49:16 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: docs@lists.yoctoproject.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH 1/2] ref-manual: Cleanup VOLATILE_LOG_DIR
Date: Fri, 11 Oct 2024 14:48:46 +0000
Message-ID: <20241011144847.1332607-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3PEPF00002BBA.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:6:0:14) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|AM7PR06MB6519:EE_
X-MS-Office365-Filtering-Correlation-Id: aba6b0d4-b284-4576-d6a9-08dcea03e107
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?gRMm1k8hzc85h/+i9o4jQB9+N0sr9Tv/pgcyqiD2MRTDkDHC0WBaq1/9fLkM?=
 =?us-ascii?Q?o81HpXZYV6IeS4dRuaP1vLHfTyCV6MwpcwGScOnw8fPvVvWuA4ljiSwjHUpt?=
 =?us-ascii?Q?DPRpWnGQIg9znC2/9qcIJvYilVUWy5jzpDgn2HRHxHz+OV7Q2xJC6LJnul1m?=
 =?us-ascii?Q?714rz4/Owt9KeNf+FQwE4NT/7Kf/tUAcaS7xesGuD77Y1uu2TCY6j0AGZgKv?=
 =?us-ascii?Q?T/V1NOG0Zh06PcpO+rNsCCbjB0CqA/thVAg0opPdQl/GDPHHseeoddsw30XL?=
 =?us-ascii?Q?C/6uDODkGsMfsoopW47lBHwqZo+QgtKrKU9E92G5VLbsqBEm/zEOglxdP8Ou?=
 =?us-ascii?Q?rMSY3tbd3rdgmAt6u4GPyl5bGzsQg9UbJkolZJqZ7caIXuG69CN2j2mM4VMN?=
 =?us-ascii?Q?aFdctUUQ05x+0WD8JuvKFRDWsY/5DOw0I7etXbwFl+8WnpGjY4VYOj/iq2G6?=
 =?us-ascii?Q?CUjWPYPlxY4fZO+aYzTSfXl8kzlG6cxnojwXnWfiPnORw0OzH+HgV65tvQTj?=
 =?us-ascii?Q?cd+yd2C3dGolifW4s5KuM3reVJn9lXExxkOqBk9+B3R4Z+oqIf9yLeX93lZj?=
 =?us-ascii?Q?EAxgE65s5oTFo1ljjMAxKDhH+pYy6qeB9ufu/Zg7+x9zu8kR0zmIGZpKjj2d?=
 =?us-ascii?Q?6DJpVBUCnNDEYnnGHbeK9O2mFw1z3gfm4JUE5RbFKfhtU0Z8ZPTdOeJih/bX?=
 =?us-ascii?Q?GSXoUkg3pZBR2a6E9UlFtrlL3fVsLtI7AJQez3Jr8HlXewocqMMh/Yrxn6gA?=
 =?us-ascii?Q?10saFJHu8TLfHvo5aNuuPbK7l1/hrlnYRG4kbR38mnHLVDIR2Ne5TdwcV5gA?=
 =?us-ascii?Q?W+BzVfij1ozLBPOiTt/c2pLNGwibckVQuuZrOgcBqsmZ1cANHHECnGmzD27Y?=
 =?us-ascii?Q?dRXo1JwObpNXwmyStlNpl0TSqEtNBkvE4j5nreUDQjyqqMrnMwIEUSjtAg9a?=
 =?us-ascii?Q?p7AnfNzgV2fby2AJipop27evaTzMrx8MQBl4J7DDPKUGvvEq/J4admpJrhlX?=
 =?us-ascii?Q?wYDh+uXnADW1HqPcfuqlzOxLZUUllLxHWrJDuehXxZ2CDRfX83eZH11DQ7FC?=
 =?us-ascii?Q?j8yRtODcQ0grskJeKSmMXzBPQupkGDIn+H/IjPzGboAmg3y3qgmulJ1T8p28?=
 =?us-ascii?Q?qLt1w6cLm0qBJspLzE6tDF37TQ8xpyD8ZowkK/YVmyC6j7+cRcLgitrAAJgc?=
 =?us-ascii?Q?ote/jMr8k5HrJDlzprioKVFXEi0NFr0CPf64ZlUM11uA8Xs53H/0YAIShYey?=
 =?us-ascii?Q?VSh2rLr0ZYychmwBRJ/cakF/R3fLmDMKRL1rbOvgBg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/ECr2rYVAtbsaDmVGH98p/nBJ3ItPrPsuEnYa4u/7hUL46VUJ7ED9Iu8kv1d?=
 =?us-ascii?Q?WkXLghKR8XK2/dRb4ushcZenzzQ8pnK2HmvsgGPIJ1so2d1ddKrBS9RoqF4o?=
 =?us-ascii?Q?U5D+gOtsuyLZrzhfXywt8XQd1ypHJu/92DM6sAjT2MgmNnGEqjc2PsE5a7in?=
 =?us-ascii?Q?5MyxWGLma+oqmD0csNlaVOfgGCYgJdXrLGUIJI3rCaCts0sYJtP4DJBw/l4Y?=
 =?us-ascii?Q?X/eCXXGnmbNJXNFp/Nj1B/raHYka6y8sil8EBfQlIRuJ1iFGX1vaomfhiPdR?=
 =?us-ascii?Q?kFSo99uuyysNL4Mu3RVYTPztUBA8/r4oLAN7+tfeNi9QzgUIpjqWbqmC81z0?=
 =?us-ascii?Q?TAvio5bOvVi+SH35MJsOKQCY+ugJYAOIOQsY/ge9ukVzYnQyy1iDIjUktFiW?=
 =?us-ascii?Q?l5hJVvbzhePTORxbd6WrSxJM25qjiEddGygtgrOjJ7cVQ3QiPnztmr/cfSDk?=
 =?us-ascii?Q?DVFeqDgsMwsCeoxt2xxnhNr8dzfvGUatpK6QInr1K56oibcZh0EDm6RH9zhd?=
 =?us-ascii?Q?0At8qS84tx9/pAh5Z7lQuER71uTEwRPLDqH6wz3oq7T4nAo9qBKlYe7MWLVU?=
 =?us-ascii?Q?FLxc9GqLAXA5lqbeCcktiWbOATK3euxmhCe1pZDM6Y8dINZVKpKaNdfgGdVX?=
 =?us-ascii?Q?qzCAD9kuf/32llSfy+It3TguEclwiS9W6Fkh5JvxBxE5M8nrieqpydZTrU1d?=
 =?us-ascii?Q?8KyHbmttB0/JSrfGL7GFCnvUnpvD5tuuyzA4G5L2dFhberUiY0VXLgeHgrRV?=
 =?us-ascii?Q?QDabvNVPMXzaoVDZMU9lQV9rdTd6a5+R5gvAXDwlcbfxz/foiFUEkDh6W/Sx?=
 =?us-ascii?Q?iWzfRc8aTFJD4Olsj9vnt8kAkw7RfrhjS4ks6GibPoadxHFf6+d2qVx8V4JV?=
 =?us-ascii?Q?xV4tf4m8Wj3ks+l/hrX8Dz2y0ETxD+5Yw/ReSlF0MgBZ2SXFm4jA7fB4Z3wY?=
 =?us-ascii?Q?jmsFGBz+1hI1xYiPRSqsXyiGPJEkxykN0zQK6cW00FFzqvBzGeQXymHSPlBL?=
 =?us-ascii?Q?VsZXqZkkT9Va8eIrIV+iX6I3NiUPpzXEKvgUBz6yJFDDN3wggPjrk9YHfs5N?=
 =?us-ascii?Q?J6DUdv+dkeKZmhJTeSAr1xEuAokZWCEgCx0H706Wf876uN3g6CFeSMEfmv/z?=
 =?us-ascii?Q?4nh+vBxH8tz/yNXjCsU1aKTPvKa2usnS5QJPnvRVbbsBTrL2HzXiZ6fvBGj+?=
 =?us-ascii?Q?KsX3byUuJaDBmF76shm4Qtty1/Zor/zbjN1gcClKc2lIM1MeezvfL/Wi1opt?=
 =?us-ascii?Q?cAAHX1ACA3bNB1lftbwYFzsmfoSy8iOdTtJJ3v5TV+omnUqXsY9hDUitPF0/?=
 =?us-ascii?Q?at90P1NU1X8bdsr6ZKtNsO6wt14EAcBW3IbxNqONHB4tRhelMPvWYwQ/G7fs?=
 =?us-ascii?Q?64uhYurRyF2CaFbhvMjAywY74+WUpako7BrNIegK9tAGmS7dvDl5qxcoLSFm?=
 =?us-ascii?Q?wQA5Kv7l2pDUbKHYyETbCRlgXvlkBcMc+gupCiCnTeonZZsfLYStHl5vbOMV?=
 =?us-ascii?Q?7pB4nxfxjDNVaWhQLWVeS3PTPFgleGJFBeRen08zNFYVArfysIQL9tqHS711?=
 =?us-ascii?Q?dqYTW+U6wsO+cFH1OMS6gtqdHf5U4GmLrpn0yDpRJibHDiQow+Ci0EMsQZ3v?=
 =?us-ascii?Q?EQ=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aba6b0d4-b284-4576-d6a9-08dcea03e107
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2024 14:49:16.1795
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w4FOeNMxiPte4Q0S0U1ulBJa1AL43b+MuPfsBQO6wMJZZ3VPU3ZKaGFXj4jziUaol3xYSc4jT5kz1QPzc0/JKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR06MB6519
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 11 Oct 2024 14:49:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5470

This variable was removed in
https://git.yoctoproject.org/poky/commit/?id=3D2f8806deb7655b37d6f8d12ff546=
80d6acf7a298
("bitbake.conf: drop VOLATILE_LOG_DIR, use FILESYSTEM_PERMS_TABLES instead"=
)

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 documentation/ref-manual/features.rst  |  5 -----
 documentation/ref-manual/variables.rst | 10 +---------
 2 files changed, 1 insertion(+), 14 deletions(-)

diff --git a/documentation/ref-manual/features.rst b/documentation/ref-manu=
al/features.rst
index b2ba731bb2..84ebfa81ae 100644
--- a/documentation/ref-manual/features.rst
+++ b/documentation/ref-manual/features.rst
@@ -325,11 +325,6 @@ The image features available for all images are:
    the ``/var/log/postinstall.log`` file on first boot of the image on
    the target system.
=20
-   .. note::
-
-      To make the ``/var/log`` directory on the target persistent, use the
-      :term:`VOLATILE_LOG_DIR` variable by setting it to "no".
-
 -  *ptest-pkgs:* Installs ptest packages for all ptest-enabled recipes.
=20
 -  *read-only-rootfs:* Creates an image whose root filesystem is
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-man=
ual/variables.rst
index 32c9e7407d..71b3325c8f 100644
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
@@ -9983,14 +9983,6 @@ system and gives an overview of their function and c=
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


