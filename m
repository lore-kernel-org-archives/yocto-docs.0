Return-Path: <charlie.johnston@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25788C41513
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 15:52:06 +0000 (UTC)
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (NAM02-DM3-obe.outbound.protection.outlook.com [40.107.95.105])
 by mx.groups.io with SMTP id smtpd.web10.426.1692287519218758591
 for <docs@lists.yoctoproject.org>;
 Thu, 17 Aug 2023 08:51:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ni.com header.s=selector1 header.b=HwMlVfWw;
 spf=pass (domain: ni.com, ip: 40.107.95.105, mailfrom: charlie.johnston@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n7TC+SD3XPr6nA8DxzZ9hiLJbEqeXdpvuXNG7ZLOL961sh4F23iOV+CDDh4E8sPinUlSTJoGyML6FenZ3zX17nhvbUz7PbNmsLg4Y6Km2up/MVH/yxK4HJEmqMYcNlF/hN/MukCZnrs7mx/lopCe/krURMLnx6ZOwTuLXmfjTNydQfnicFMMnbAiY7ZAHQT1avhoh5lz6NFZsTt+j7EtD+HXxc/ilHpDYNONb4A9Lb5NSvS9AggB0mcXf8f2TMJ08706nuF3R2j6SYqEHI54yzkbyyqolDwQmtKIlAL8BtkW+tjjdaHOvzsfI2xldSQAtKXsB/cEb98hHvHxsFVDcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+JOhzE8aw29BFdRrkmotIuQZ5L4HZMcE15IjPkNr1pY=;
 b=Zn8TiZsYlMB9vuSl/5vAFM06s9W9ZQuz/z9HwE3l3IWgxL2zRWnAtneitz0n9Eg/o6sXz+tdbPJrHW1QsZVq+FIgOAhq37xN84O0vo42WgLZeIVqC2g9uBJ0eqzx6f64YOhbawkc6IHttfiiy0sBS0vOnszD4dC6v+0aTVFxa000NkVTKfxaarnCsVpEPUaibwhB6isC7KY3HXB+oAkcARPiH8QdKERRTQ0hYvookjOA6OLKmCudNEszzuLKC4t/AFdTN77N0Co+zQjpaMMIKiLONrA9lXvGTfYwFH7aBp2EuS6HdqnG4TkzEIsJasVqAdcczF8GYuAg7/AY6fFMuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+JOhzE8aw29BFdRrkmotIuQZ5L4HZMcE15IjPkNr1pY=;
 b=HwMlVfWwyicO3beVOyr7rNdbPt2cLW4nm0lVcSC/CxE3Qmmz5Mo9VdEfwDwC4gq04sryM8OCXTbjk9DNxZyW6Z1DkMjDYpLkHw4gACKV9Za15vbpY39v39rw0hka9jLlUzYyUIQyhFBhVSf4EkoxqiVNcaKK0swKDA/L9IslBQg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ni.com;
Received: from SN6PR04MB4879.namprd04.prod.outlook.com (2603:10b6:805:9b::29)
 by SJ0PR04MB7693.namprd04.prod.outlook.com (2603:10b6:a03:32b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Thu, 17 Aug
 2023 15:51:58 +0000
Received: from SN6PR04MB4879.namprd04.prod.outlook.com
 ([fe80::c738:ef27:97ab:fa11]) by SN6PR04MB4879.namprd04.prod.outlook.com
 ([fe80::c738:ef27:97ab:fa11%7]) with mapi id 15.20.6678.029; Thu, 17 Aug 2023
 15:51:58 +0000
From: Charlie Johnston <charlie.johnston@ni.com>
To: docs@lists.yoctoproject.org
CC: Charlie Johnston <charlie.johnston@ni.com>
Subject: [PATCH 4/5] dev-manual: Include reference to package feed indexes.
Date: Thu, 17 Aug 2023 10:50:43 -0500
Message-ID: <20230817155143.2578874-5-charlie.johnston@ni.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230817155143.2578874-1-charlie.johnston@ni.com>
References: <20230817155143.2578874-1-charlie.johnston@ni.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SA9PR03CA0014.namprd03.prod.outlook.com
 (2603:10b6:806:20::19) To SN6PR04MB4879.namprd04.prod.outlook.com
 (2603:10b6:805:9b::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR04MB4879:EE_|SJ0PR04MB7693:EE_
X-MS-Office365-Filtering-Correlation-Id: 20e0a045-6205-411b-84c4-08db9f39e375
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lQvU8EX29GNYZ+sbHn+tBPXjW8eNBAalfLqt2hRPhs0yJ22LGAtnF0arZ8fnhTBvnuAzJXf7TkET1pSkWY82m/PdMPymZSIJ/F+PGCQb3/AWGYg3hA4U63BkTrVy521XM0Xb69P1rhRXi0KzQvmBY8zZxo2OtETEGfLyxNOafaWX5FbFZdy94tPxH5cgmMSji8c44r+aznnCAX9BPQEJI+urK1MMy05/R7xJKcDOy1nSQ2OOQ7ZqlzvRf4sXSrRb7zItB/RiBv7miNGqgcPU3Z/MxpXEFPJjQEpY7I3yvDeOX0wfqK7TBjGS/yoa9ltg9VMADYIMlOp8gif4QOimkZiXeZJH8UrGGWszkXmBBQ9hxYa10cmlywxNj6ijqWhQz4AKztAtYwCPV6xz3V2fF4Mr/kh/p5e4PHEKSebvaiCc+8SM7QcYISf6ke7O5hUcZcz8Tfme+ezj9Eu2/lUK9HPWnVv56MZfHyDRWpNeISq5Tvb5X8Qg8Mvnh7Ja3ErmNHJoRfGmojMTRdNdH/c2q4ZfQt1opJC1fmAQQXm/k8DXsobOrT594sramzQ7vThz
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB4879.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(366004)(39860400002)(346002)(376002)(1800799009)(186009)(451199024)(66946007)(83380400001)(2906002)(66556008)(66476007)(6506007)(6486002)(6916009)(316002)(6666004)(478600001)(5660300002)(44832011)(2616005)(1076003)(26005)(41300700001)(6512007)(8676002)(4326008)(8936002)(36756003)(86362001)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?E0WHmuFvrgAGK8z/NsnsmmohcWuF9ZbX1SRQz9xM2f7QGBsCO13LktK9sIBW?=
 =?us-ascii?Q?V+SYaNSqta0JTHGC8vIWeYCsosXhDqCK0DkBoUkpimSOEdshzuHSUxv+Jg8b?=
 =?us-ascii?Q?jgUQ6ZDxDbsfMHyaqMjADJK/F9eQQhDuP74yStUZQezv9fYa7eQs3bICKHZV?=
 =?us-ascii?Q?x/tND0szCqPaQfFj8xM02PoiIdIT2BUvSgEsGvlO48Va1LSYTdtUlqKQGDqf?=
 =?us-ascii?Q?j5ONd+1+WB1RqjWFrl53QD0RzQqzgRF807bhEAJhhm+MuTHmmP7WELPhv4sp?=
 =?us-ascii?Q?2PnjqNChZZVGvyIUsaqlgD848z5J9shYThittioSzFxetGkrB/BO2uEjWgJV?=
 =?us-ascii?Q?gj4rwNUY/hAkTlIxp7C1eahgLhWAAzxMByn/aHtbkkjKp/KlhDKdwQCNxUQB?=
 =?us-ascii?Q?6StvVclwSOg6FNdvVJQkGdrteIlBQO2fuCfv12DE8TgF81K0frhtIwmBp5tr?=
 =?us-ascii?Q?3zYm3JvwMqw+dZ+dPuKHbWSWwLNiJOxyntvEf1VjknR3HHMyOogI8Vlhkjvt?=
 =?us-ascii?Q?CPBLntkymvHjVIS0MGPH9VSyQFbj3IwiT/B+RX4jVR1JBM+q4STKYSojxvtI?=
 =?us-ascii?Q?t9HSxDEVW7XeAAvFfp5YgA320CrtyCY7hOfw+DLxmWJzURHmnvfJj569JLHE?=
 =?us-ascii?Q?pQntycOZjlxB2n2Uy1U9dNVVS4ztnHgaaFt9nRtiw42aTBJulsh/qD0asH1N?=
 =?us-ascii?Q?3uKZbYPUczSSHl4RD4myGwHlTl/Zzy8HUm8modOKIeEgwYyPpFpzJI9QSgew?=
 =?us-ascii?Q?sDTP4Vr+K6qA3C7owvGHkBt5pRGMiW+mHIrRoqVl4dBmbuloSAfr8QH1irQp?=
 =?us-ascii?Q?x1DREvhtDo1QlVJLixqmU3QCzQF4I0VE3WD8syYVprc1ZG8k00nvYnWqAtWk?=
 =?us-ascii?Q?TH6/eQQqJh/vLpRaVXpVw3nkZQCfAt8p2lQ25ExcaO52lGEZQs56azhGCDpK?=
 =?us-ascii?Q?M9LwQmHWi2EjF/vY+9YIpL1JElCiTmKiIsP4ceuG3JD6YUdBPfT1hW+vn/r8?=
 =?us-ascii?Q?CtMCYYzIXr5JuhyXNbEa6d2//04MjYdN+Muti+3tfXbx3LBgjKpqZ5wKrYbk?=
 =?us-ascii?Q?2oBY/aUQHMrEOqnjTIEDYpuRe0bOwYby1Rm3XDMQAMxBHVgkXtk+cJiupJr/?=
 =?us-ascii?Q?vSN/88gP1BIPVQaxfg3j09zCamHZyTpDJdzQKv2oRnAmJhBipbIf3UY9j5TY?=
 =?us-ascii?Q?xqbhS7sDFbUn5jitV10Ixal4kPnljcrOBlZjkZ30rIWCvTxVQSc2NQlorHn4?=
 =?us-ascii?Q?HY/WVkcHUNSwfdZvgOZaxc/GHcABFMKqwK3pejbxwdN2CC5d8cU7jH0vvfMB?=
 =?us-ascii?Q?4o21OXSP247XZFpBDGV0ZIGSTuotQEF+YjQjku7o0nkJi1ZpW64miKtyRsvd?=
 =?us-ascii?Q?Lqen9HnY3X+84Kg1TZZd79OiPOUP6LIVbBvzNfUjJTgtIgmRD6Hou3+5NGif?=
 =?us-ascii?Q?COwhzT25FV+FU/F5BCh6K7JglbtaNiavMygjc8gEn+tNkNGz6laSnibvYPAn?=
 =?us-ascii?Q?cPLsnUB1f5Z7jBW6kFN1tgMugokEQDy1IfVGoQOIpFDQv+UddU0t0mgQ6qGF?=
 =?us-ascii?Q?j/oE29zY8ghHG/Zti4DmvOTUkI/dBkqTfzrhhxJh7Od3UKx6ONtqGJxVTyot?=
 =?us-ascii?Q?TA=3D=3D?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20e0a045-6205-411b-84c4-08db9f39e375
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB4879.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 15:51:58.2344
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PL+FshQHWNtfLRrh2iO7V2rvbH/hf1m2bkcDKpNhrhcIv3S3BehAgDPNAtoGFwu0N4Mrig/6QLxU5UrV9COxQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB7693
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 17 Aug 2023 15:52:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4160

Update the packages document to mention that package
index files for feeds can also be created via creating
a deploy-ready package feed now and not just via the
package-index task.

Signed-off-by: Charlie Johnston <charlie.johnston@ni.com>
---
 documentation/dev-manual/packages.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/documentation/dev-manual/packages.rst b/documentation/dev-manu=
al/packages.rst
index 79f21d9f3..21d33e1cb 100644
--- a/documentation/dev-manual/packages.rst
+++ b/documentation/dev-manual/packages.rst
@@ -596,6 +596,11 @@ package index including information for the package yo=
u just built.
 Thus, be sure to run the package update step separately after building
 any packages.
=20
+Alternatively, you can create a deploy-ready package feed by creating
+a recipe that inherits :ref:`ref-classes-packagefeed*`. An updated
+index will be created anytime the package feed is generated after all
+packages in the feed have been built.
+
 You can use the
 :term:`PACKAGE_FEED_ARCHS`,
 :term:`PACKAGE_FEED_BASE_PATHS`,
--=20
2.41.0


