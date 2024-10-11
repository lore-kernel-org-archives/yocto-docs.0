Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00E65D0D7B0
	for <webhook@archiver.kernel.org>; Fri, 11 Oct 2024 14:49:20 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.135])
 by mx.groups.io with SMTP id smtpd.web11.13746.1728658159509387586
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Oct 2024 07:49:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=G/fBdyPr;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.104.135, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hEypB5PBWW5YQuzEanVV962xZh3+X4/1KacecgGGgjyzA5fE9ygy3lbj29kTnixN3CQLiMK1ZLNFP8wz/dZn0TnoARfPdWzBtlQeiM+OsIzqpB1uPpCkhWkZ2A9hYTkbl6+51CLUS5Vozo4ME3C8atqu87zCQeYjrFk2gTGGOAS1sBvSRULLpg0xXELn13XiVbvfmQ1gGRxgKd3b1cezPaZ6XAKV1nkcz7Pa8/Wss0JV/il7A8VI4l4kJjyOQIY+yslc7joDIBo9QBx4wRUj/D4s84BA1BAYX4ZK2nFjXlWhdEFwbHYsGvNVLcQXqUzG9h0PFZPQ1UEi6RwcJsM7PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aW9BfG85hxxDiRYpl45cCPT4VLGbT8W4V8fnToU3sc8=;
 b=RPpScAK2bcsrk1a8FA+6KtvS3/6pLI0LMUjv1V4diJpCBjYHbpR9CYSSXm+xsu/+IoBfXuwG4zhf7EOXQRi9PdRUNDjqhXHWxIevqaHn5M8wVjAbVsGeRYYQPyfCIFtcPVkIOWmoCkmYOnoms/kOENKFd4JynFlLSyJnRUACtnyInOonMem59eiJoCe6gnHZQ5I8v3QkwY1dP/mhWUApEVVFwIExlnTN5JplG2tRTh8mrjzfUAc1VTUWaGKodH5XtjwgUDuwGPRqofNrzq2PIDXiwOYHXy0xt5dyASY2zYV4lC7LNrEqCczXCEdeacn5AcB1c8jFmf14mqtzInSIjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aW9BfG85hxxDiRYpl45cCPT4VLGbT8W4V8fnToU3sc8=;
 b=G/fBdyPrkOhF3r4mG/rjbhrCtxOKtD7fsmDHRwO5eI3CmaWuv6tJkhFhkATRJtG83DzMYD88GgHdH3ObWDxB3axGcvT1ccPxiWz96CuMo3w760cKIFIvyEoqVYC0q7p+bD7bVwQqOq/AwLkPa7CCKD0kB06PStDlSZcCBfH+/g9rM7+2DqcqTkjdk7mCpoT8h76rDWkMwPqLUGVvy/fhYerzOeBqd+lSZOwKrpumFNpW/dPvBf6vMa3AEMg5uxKZ3SU0sqd60urmSNwPD0ofByRpEGslUgVLu0xg1TaY9ikKqg81e3G8Pn9vCNsDjq0wVgsIVGHZ6IFo+G7llsV+jw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PA2PR06MB9112.eurprd06.prod.outlook.com (2603:10a6:102:407::16) with
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
Subject: [PATCH 2/2] ref-manual: Cleanup VOLATILE_TMP_DIR
Date: Fri, 11 Oct 2024 14:48:47 +0000
Message-ID: <20241011144847.1332607-2-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241011144847.1332607-1-niko.mauno@vaisala.com>
References: <20241011144847.1332607-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3PEPF00002BBA.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:6:0:14) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|PA2PR06MB9112:EE_
X-MS-Office365-Filtering-Correlation-Id: 15989e02-aded-4e3a-3791-08dcea03e138
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?d3cp4EnP41+4Mb9eHIDJDr8i5weQNeTOY6J+ty/VvxayKTqKfKTo2rqdp2cO?=
 =?us-ascii?Q?5doiSxWuuYBLSMlDt7ZMyADLi6bAUFSo/Pb1/g3WFWkcsxUSNnq1kKc1eE3M?=
 =?us-ascii?Q?r87LSycHhTW+VTqpXP6QNjr6yux4NQvtqQOy0i4QmF36QJl4A++e7C4qCkqw?=
 =?us-ascii?Q?61yuO9lp4nAfZoFZGlShubQBoegJsIPHKzgV/PLLkiDHssZvteczZCvh8glf?=
 =?us-ascii?Q?dWF0H1kWe0sW3NTjpXx3eh0o0ZOMx8oy/Ozz58TZEcXPVXQiwbhY/LCnPkob?=
 =?us-ascii?Q?gGbfDiS2TtCIW6xNfcfljzOH0XPIGR0fIShvlISishmWtlSrm7la5X8n4VeZ?=
 =?us-ascii?Q?kYXrMVEl8M8qShN7SwpXPdW5Wu+Ldz2EXMRfbG4WS/lAwKgxy9NuiEaddkhf?=
 =?us-ascii?Q?SRT2c3qxBQqJZtqz2851v1lvcQhecWCAPDlwdz6nXhGbAi2lEE5Bt/4FUmfq?=
 =?us-ascii?Q?KRGhlF9kwIcg5wjK05LntRuzYj/os6X8ZzU/PlEcg3UDSrtNvz0uvUlARS4d?=
 =?us-ascii?Q?3bSJOIwNNs+5WgqUHbYOHsD7r1VzEqoMeAGnXc1UDfuAnZYjZeUk+KsmQ9le?=
 =?us-ascii?Q?V6Zxkl0e3O0y8sN5EhKmRVZRV4qBtTOGmleTeRvdV96ActiBImsM+1I0WDll?=
 =?us-ascii?Q?9q+YB7oZ2/L6eGpWC8eW8rr5ptgj4n+cyLa8+Qlktfag3lH2BcWawUGLT0M7?=
 =?us-ascii?Q?e+lidUxzcVaDU3mTLAHKfBwRLEnGJNEIYP7V9JJHMmMYvwPBoqZi636ndZmz?=
 =?us-ascii?Q?oGUYPfj1pu9vDNJ9xW3ONhsliSMx1Zgp8Jk1krAqOY67Qdy8K61GbIrUP1qe?=
 =?us-ascii?Q?UoP9d75gWEUmqQRwwTqA4DHGtP3UNIObByfbPErppox2KzMNhkoRwv3HxakF?=
 =?us-ascii?Q?Eip3Byes3RSF5m4XY9usWwboaKEvcsM3+1iXYDQAcRHgcEJ1i73ygid2ezf4?=
 =?us-ascii?Q?IDEZ/l8rJAuVbAc9CbPdZ88Al0woVNln9axLGg1zdbgCql8H7yoTd8lg6nYF?=
 =?us-ascii?Q?o14/qWmrv1eikRzIp86VlQG/xdvsi7wLKBEa/CEOm1Jqnzi/rk2OlbmmitlT?=
 =?us-ascii?Q?v2gyBJg10yxM9RTUFcgjD9uPqJP3fGyH9j7XEcUEE7fpk/vnRrrEt9HCC9Ch?=
 =?us-ascii?Q?iFS2xCLHZzQJESndSwwz9JEi7ptz0BW1euAwGMSTny09UWOHqD+s7ERXg81G?=
 =?us-ascii?Q?wCHN+Vdc4kyYSFo+gwZ0j4AWJcvdbhwQaVJS/rt5oKumNHK0zhAVf216a1q5?=
 =?us-ascii?Q?oHMVEJOnKJZAS5OIXbfyV31xySGHuj2AvoTgpMoi7A=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Appp65MCsHXzVtoE++mWkc+dQ65d11MtsWTWimN7RMslqqrPSHMGUeHKfIsA?=
 =?us-ascii?Q?7K6TzA3ESM46hmtlSKqyrE4vi7aMy3R19LQhMm+305w2lrhZxmDNpMMMSqCl?=
 =?us-ascii?Q?8yMlSkCaadAlzVPXi3O4+5k3PFRaV/Ace7/Lo7qKfqGTiEBNSe1xge9v6T0Y?=
 =?us-ascii?Q?t6w1o7K0+WOeAvPFbJukLcEfNIzizpfPvEFKeczak6OHlfiFLZHFQjg2bUR+?=
 =?us-ascii?Q?ja0sxlmIHHFAfoHKX6SU+OcKqkrWpwWO8zlYOAeI1j6v6OENRSSaKU9CS7Hb?=
 =?us-ascii?Q?zRPrOcElQ6G6p897o3B4a/RB1YaArxTG7oVeWyWvEHMq67JnBz0pG8r00E6D?=
 =?us-ascii?Q?KPM8p+/RPy3NaYwR5SbQUKDrMnhBxqPCHCdRPM73KkdYu2tv/tE2KcNjFWI3?=
 =?us-ascii?Q?rgJMe2FMSY9srT0Ua9czGhs+VMv0GnNkTtf3tfAqRnph6L+lIhxftPLrrAkt?=
 =?us-ascii?Q?bG71pGuSCwzm+xbf/JPzTFUtkjvQ5wOrppYiGPyBqTw6FLfZX+3NDvkingyn?=
 =?us-ascii?Q?AmAQdu1vZSEg6+DW3lSCEq2L0uJqyeiXMx1Fj6KBi28mtsOrPCLzmJAyEQCG?=
 =?us-ascii?Q?Z4t/ZGQokoidGdHi9CmBFyfxgcCbxiNs+DYPv/LJ2emeFn8D4MhX6wMnAu6W?=
 =?us-ascii?Q?psCaV2NH5Hyw8Jv4UAEO/iUARFs+iR4BCBLHqRBMcANJ8ssXIDS4qtzAg7dY?=
 =?us-ascii?Q?8QRg5aXL/8n4cvqZAB3qqCLW3an+4dOs+1xC2r51GKWnwmIYtGIn07378J+G?=
 =?us-ascii?Q?yPmDabJEVlx/63s1qMBuNeZ8q4FWVtF1p5+rm05jZywohj+t9UMmhgijT9xW?=
 =?us-ascii?Q?97MPOS8Jz5VayeqER0l0C4XoCUo6amgjg98ikHpwUCsghTSHAjUcUMRUTuiO?=
 =?us-ascii?Q?Wcsz6emzdAWUAyhW/bAOgWy2WeA4pwRO/v7rWRgjUg3u2uO6QtLG8pvsZwuf?=
 =?us-ascii?Q?292Z+V4j7D0b4DmX36HA8iBvsthGDv3HoVas76cmrUbVatICWXascqeymCy4?=
 =?us-ascii?Q?D3q2oIdxciMGT7cB0DDXJl1IFnTPck2Eks1cYP0gseOMBLGcLNfLv5tTZaEq?=
 =?us-ascii?Q?rq/CJlkLt+b/UKcAuozpU1i/khkJ6MO7O6j2XBSL+ZtFrTpCp2XXY9sTdak/?=
 =?us-ascii?Q?pFC+SzEHVg3TmCPPYg9KIm4b7btpUk2rPIxAZTFH0FA9uSNVLP4tAEtZqeek?=
 =?us-ascii?Q?+RU7Qwr+k5xpXGv+MrTmY10DOVvyBA4XmzkU9sdlI1K/g3juyIxWlWdKl0t9?=
 =?us-ascii?Q?B6X4jyxPBfK4GIIu6dCJ5UgOsXQv9kiL2nHrPwIN9jCNjFibADfUbM7Bwd29?=
 =?us-ascii?Q?qVa5vgIzPiK1Jyi6J9qpoSNNKxpPKdNU/8hHMkCu5yehxgOLN+X0u0lYuiLh?=
 =?us-ascii?Q?7vHo7M3TQBSSqQAepHd2yz7cJvxHUhHfFnw2yFXEtCaA+I0exCdWx1Fk41Oq?=
 =?us-ascii?Q?je1zQdHH2YkmsWs0fUtpYIHOBwkkpTcXA+KyZGlQOz/3rZiSVQJk0UBnx/Xe?=
 =?us-ascii?Q?AqRLTmLU+IrzomR19PbCVIwB8d9NI8iVSma6w4iXzkaW1imeNWXv0fcuyHYr?=
 =?us-ascii?Q?05wl1Tml7sAoaP1qkWGRwZbmRtu/nPG2zygmyfhWraWMRdjbslzvBGdvE/jc?=
 =?us-ascii?Q?AA=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15989e02-aded-4e3a-3791-08dcea03e138
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2024 14:49:16.5176
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7qoqdVqwoR+V2UgX8bdJjSxzB3l0dziS/5Hm98zt6Br4M66C9djaIlQl68J+cIq18Gx2zygTHdK1/0FOlFHsLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR06MB9112
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 11 Oct 2024 14:49:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5471

This variable was removed in
https://git.yoctoproject.org/poky/commit/?id=3D2f46b6f27dfa3a9d5ad177900fce=
cfe64c3536f1
("bitbake.conf: drop VOLATILE_TMP_DIR, use FILESYSTEM_PERMS_TABLES instead"=
)

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 documentation/migration-guides/release-notes-4.2.rst |  2 +-
 documentation/ref-manual/variables.rst               | 12 ------------
 2 files changed, 1 insertion(+), 13 deletions(-)

diff --git a/documentation/migration-guides/release-notes-4.2.rst b/documen=
tation/migration-guides/release-notes-4.2.rst
index 30049b89f6..ac3bb9cebe 100644
--- a/documentation/migration-guides/release-notes-4.2.rst
+++ b/documentation/migration-guides/release-notes-4.2.rst
@@ -38,7 +38,7 @@ New Features / Enhancements in 4.2
=20
 -  New variables:
=20
-   -  :term:`VOLATILE_TMP_DIR` allows to specify
+   -  VOLATILE_TMP_DIR allows to specify
       whether ``/tmp`` should be on persistent storage
       or in RAM.
=20
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-man=
ual/variables.rst
index 71b3325c8f..7686e538be 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -9983,18 +9983,6 @@ system and gives an overview of their function and c=
ontents.
=20
          PACKAGE_INSTALL =3D "${INITRAMFS_SCRIPTS} ${VIRTUAL-RUNTIME_base-=
utils} base-passwd"
=20
-   :term:`VOLATILE_TMP_DIR`
-      Specifies the persistence of the target's ``/tmp`` directory.
-
-      By default, :term:`VOLATILE_TMP_DIR` is set to "yes", in which case
-      ``/tmp`` links to a directory which resides in RAM in a ``tmpfs``
-      filesystem.
-
-      If instead, you want the ``/tmp`` directory to be persistent, set th=
e
-      variable to "no" to make it a regular directory in the root filesyst=
em.
-
-      This supports both sysvinit and systemd based systems.
-
    :term:`WARN_QA`
       Specifies the quality assurance checks whose failures are reported a=
s
       warnings by the OpenEmbedded build system. You set this variable in
--=20
2.39.2


