Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.55])
 by mx.groups.io with SMTP id smtpd.web12.492.1619106544736078702
 for <docs@lists.yoctoproject.org>;
 Thu, 22 Apr 2021 08:49:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Mn4aBP2P;
 spf=pass (domain: windriver.com, ip: 40.107.223.55, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d0Pkb8MfFfK3gH0Fc6g9k8eMSVp9YUP6xJp5aatj/qM99lbeaax2U7qFY/WP0fxFP3WituXE18oe+57vpwYZZxgmRUAdWGr1GWAvVGHCEM6PL7tbbz4RULhHcpsSnr4/CKuow+2UlJcB+45rfVQHnbkzy1YuXOytiK0hLO2Jqs0hFTIy9prQueFTZzrNx1az4HGb1Si5BS0Z3blTdXkShiNL+Rj6ruJTbtlARCSusIASAPzaJfRRyV9GvCDumpZIQhtzC8pzN0c8iXssfFlZht5Oj5WKkNg20SyFGps2/DnRBajpv3ahun/BqW4ezd4v1tR9eFvP0TBRwjpoUAXI5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Dr+hwX8vCyWZ1anBJdZrCcK34LpBd/XDEH38/uWWXU=;
 b=nPmBafKNQBuifcMHXIbjE5aKG+1VJV1ar7qQQawZW6APSIzWdnaFKbY9H8cir4iRaKsQ66kn/moT0sztlT6jYhxOrrSQ2OjOPDMesOr3TeNgqyByqKaCmIz6Z/PeHRWvDc/6qOwcpD/ShnXoHjtUGNE/OY9F61fyXM/k4Y96uI+5ekS3DIMbLWXEUTaLdpr94PTKsVpP0qYlpW76/ajx/G1whN92AmY7c9cW6u2qzXFtHriCROeuTs4gpxMe5g4BvO3skTWpXHEBQqoA8CnT2nUGkAUE4G6cFTKV5aU+HYcZNGELnWXLhESRY+QWyTzCV6KwxmUkAqnlCWh6Bg1PCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Dr+hwX8vCyWZ1anBJdZrCcK34LpBd/XDEH38/uWWXU=;
 b=Mn4aBP2PUM3ajk0BEz/5oxTzzleRDqvLupD+wyIujfb8lF2r5epjth6CowqPutbsSr+4+8BcWwLjq93AW9/vxvgcQ7niZThPjWSAB1CfpWqFAVD1zIAXl6Lc4PZjL6ausVkw82SCLXdwfLE0ouBLgNkFjc/Dl3v04w9eIvDNO70=
Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3064.namprd11.prod.outlook.com (2603:10b6:a03:8c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Thu, 22 Apr
 2021 15:49:03 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::89c3:3b4d:43c5:ae76]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::89c3:3b4d:43c5:ae76%5]) with mapi id 15.20.4042.024; Thu, 22 Apr 2021
 15:49:03 +0000
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: docs@lists.yoctoproject.org
Subject: [docs][PATCH] ref-manual/variables.rst: Add incompatibility warning for SERIAL_CONSOLES_CHECK
Date: Thu, 22 Apr 2021 11:48:53 -0400
Message-ID: <20210422154853.2102019-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.30.2
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: SJ0PR13CA0121.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::6) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-tgamblin-fedora2.wrs.com (128.224.252.2) by SJ0PR13CA0121.namprd13.prod.outlook.com (2603:10b6:a03:2c6::6) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.15 via Frontend Transport; Thu, 22 Apr 2021 15:49:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2397b338-08d8-4eca-09f4-08d905a6274d
X-MS-TrafficTypeDiagnostic: BYAPR11MB3064:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB306486003E24A58FB033C1149F469@BYAPR11MB3064.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	e1Am1me2vt6Bf4RRZoLS0Y4OZ3qEy4+5GDr9w7BUYs68vJxEePAXVgxR0JcVhVktF7wzN3yNqB2o5ptfJQhrUhqU5j3zY46Co2pw04i2HQdODICuU6V1ZQv6fXxpFs/KhJqjuwNZzq7urCfypt7FJv4+Fm8K0nNyYRjyWZ1bPlsXtN8ICi/e/SeLFolw7H0tmFWsD6SamMWg1YtOwjG+78+R6K3AL19PSMZnl2EG3J6p0gRVE1RnOnjDYpMIrYLWFNyP64v49AP1mtLxAlDPUtxfF2vv4jdb+lStBU8hHTRgFE0ij6yIMQuJtaeBlTWoznJFtyvziKtFHvuG4Y2ICiRUA4PH7extikjoeDDWLboAiaCL5g1IS7pYog65U5AQBT0iWzcKG8mDV5XQkEMU1b6Hr5THmHPH882qsntHbMveMS2au7ZnyD8O1qfGNHAB+cMp1LMH0RJ8EyQGTNJguYrQ5pQjWbya70OtR6dxs7vKcZYy1S7Cv7+BaPHa10JPJOtU420gLPqQtlCjN0C/OlgdLA2SX1P8dp+PdBYNYGu4NECap1khOXei94ci3BfxVBHsdOeNxsSiez/beMDeeM0o/OiZviPaSrrEeUwzW+fNCvzq6XcImTdR4IU/JldrYa0dxIi7N5MqIaDZS1A+QX5dUvE8uqqtY8cde5IybTVPnO10Esnh4CrJQPPMoCu7VpbAx/Rq+dWiCIHUjjwoHLTYd+Syzi7SLDVdOGG20sQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(366004)(39840400004)(376002)(396003)(5660300002)(6666004)(8676002)(6916009)(956004)(26005)(44832011)(6506007)(6512007)(8936002)(478600001)(52116002)(66476007)(66946007)(36756003)(16526019)(38100700002)(966005)(83380400001)(186003)(66556008)(1076003)(316002)(38350700002)(2616005)(86362001)(2906002)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?WXwy4Q4OUc8VIeDLIvqrOSUQ+6mxyUOUTJYHdVZUFDheIKqa8NEBfzClZ4zf?=
 =?us-ascii?Q?QVVJVKAURdlr5T5bgX5Ndrm9nxlXTlr8E03sBDp31TObx1aj08pY+mJs768x?=
 =?us-ascii?Q?vc0Xi8WmYhFlm2GVwHFlP9Drdy/vIrIHaY230WAJzY3xprsLPigoW9JiaU83?=
 =?us-ascii?Q?KtNuXBt+E2Ou705eKpbEQiD8s8X41e93PKeuaqBlbI6gWqZuwGZxKkxWn2Yv?=
 =?us-ascii?Q?cA5gVvlzpXJzpfs1PzM6OL4IBYZuaSebpphuL+1n5hI1mN7SrM65yhcs7HXO?=
 =?us-ascii?Q?N3aOEd6HBdADRKQ8NK586l1V95YtmtzsDJGFhza6ouDF9yltX2/Tos199/Ud?=
 =?us-ascii?Q?yhHtCxQqzsuwxzp9wFND2ezsj36dqkadBEWXdSdLwFmDSagO/kwa//g+Hh7m?=
 =?us-ascii?Q?WwTq8UMxcsKoqoHnoO/Eq/wf/Hu5F9xePqmZvPjxM7ZjNcBOt/FFc5zVL5Ro?=
 =?us-ascii?Q?pR7N0tczTnvjaO7GeaZQ3mvBlkZg9CA62dVMHN7JDfCE/FhpSNfk7VPIORa9?=
 =?us-ascii?Q?DunyvURTcHO9BHWyKuOHWiT58RYHEOR7s89FzL7QVLDd93xLwnBG8CMXGN+g?=
 =?us-ascii?Q?OQ35U0FzFXueNDHkY7yUsCv+8T2RA3gI1QXeA/s9Fs3pKNKXmEvQ4zEkuGNz?=
 =?us-ascii?Q?FjoLwmpl+hNxqabb02VHqV0x8Q3TvKCORy8BegO/rgfW01jHq9oHWQ67fWBD?=
 =?us-ascii?Q?mWyb4duyw6RWfYvO0QK8Y+pAp8NNgUmmaK91QPI3Wt7yOGL4lIUDTwpYtlLb?=
 =?us-ascii?Q?ck7MappVqULSlSnHnK/UYBcxDBELThdpjbHficUeEse3ruPlAgfjo2HaOZA/?=
 =?us-ascii?Q?ENEzfPIpmkSjNi2avIsyGigiSUe60zO41ked7k4bvq34gFjXU3uUSe8Q0Rrk?=
 =?us-ascii?Q?Fxxjiu5B+V44qHFn4qhqKhdhbvO1Cz0BoEvbKiCsGvwXofxc3e4Qu5tEtb2B?=
 =?us-ascii?Q?Od6nVRdkpapacpBc5DZR6hvvM452K9UbIuAC60ZQxUdiTajwmDSW4ImIfZOA?=
 =?us-ascii?Q?VT5QklwKmMM7LrPXuYRxybLMO1O98CWMu2YycJVsahbld+2XN/bUFaH7k2WD?=
 =?us-ascii?Q?XZx8fzCQPSgWg3MkKxjB7ya0P1EOkCSx0XGeZOInI9LblpPTx8c05tuf7qpg?=
 =?us-ascii?Q?epUFjQm5oCP02E6w1DUm9AQV0bRQcPlW2hG3/HEAVEjerfEaKc9A1Hd4ng4H?=
 =?us-ascii?Q?Pq6Sj/7aFKnX0kegYOM43hcT6Ke+bopnRczcZVjEFPiiNpTo6AiEoSfTKmZX?=
 =?us-ascii?Q?Gb3QliJgAty03wC2xoZ9LdQJpJc98ao3QcVkqVroSNvfpwGpIFBfem4hRtcf?=
 =?us-ascii?Q?s9PbVFy+7jqBCEgYqMIxFQOT?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2397b338-08d8-4eca-09f4-08d905a6274d
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2021 15:49:03.3405
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aDZGk8UrH4qrPU9JbLcJT2SQPnRL0bkn7egMxnegtBJXBHQPEA5PMw2ExIhFMdzvJNFmIh6/p4wHTuHcj1DCK0R/3LVy2cFIadsFBoZZXmw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3064
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

See https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D13921

Add details to the SERIAL_CONSOLES_CHECK entry to clarify that it
doesn't work with read-only rootfs.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 documentation/ref-manual/variables.rst | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-man=
ual/variables.rst
index 74ac12bf9..7a87d219d 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -6929,7 +6929,11 @@ system and gives an overview of their function and c=
ontents.
          SERIAL_CONSOLES_CHECK =3D "slcp_line0:ttyS0"
=20
       This variable is currently only supported with SysVinit (i.e. not
-      with systemd).
+      with systemd). Note that SERIAL_CONSOLES_CHECK also requires
+      /etc/inittab to be writable when used with SysVinit. This makes it
+      incompatible with customizations such as the following: ::
+
+         EXTRA_IMAGE_FEATURES +=3D "read-only-rootfs"
=20
    :term:`SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS`
       A list of recipe dependencies that should not be used to determine
--=20
2.30.2

