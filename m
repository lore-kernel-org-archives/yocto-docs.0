Return-Path: <charlie.johnston@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34BEFC3DA4D
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 15:52:16 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.111])
 by mx.groups.io with SMTP id smtpd.web10.432.1692287527621888314
 for <docs@lists.yoctoproject.org>;
 Thu, 17 Aug 2023 08:52:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ni.com header.s=selector1 header.b=JejsiRdi;
 spf=pass (domain: ni.com, ip: 40.107.237.111, mailfrom: charlie.johnston@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b//p/daz1ihuuOeTC1CM5iecpsUMhN3jOWi4e1YRdbUIFAAu+kbsoN/6+D7m0fpG0E9G8S2VVc+Kvsiae9fVpapzTTn2fl0GDVgIeBVTvMDELZXWxcfRNOSEibEdy+bMOQPvFWllJoyIR63073WW8GS1dk1NpLlleKnQigcWf1o8AvyzuDp0rR1zOviQeZFW7pMZjT3zENSMcszKxBD6M7Bq5ysdHA3aIAStSZ83IdaaatMIxb3PIZdvJkieYYD/TDl6MZEmReqrZXqiMCk4xKB9uI3QPq0TNQYtlCfoKVzqjWqTLva9ZMPJBMlc9xxqf9xlP48MeNjDsESJrUCkew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QjaWwjyIltSqkfb5/woMKnY01GNEdrpV9t22onFOSDc=;
 b=Buw6CmAh6p0nn62Mwu0DxJcMYgfXbaCIjVbzJhbaXhMsNgFXOk1bATMExHZSN0c9eeBLELplwnsg9qjaShk9oZh1qGaeIUQj9Vate1eYi3rsrsgVWZ469JnI0c5gP/D1KXRbsPq2zcgdz+9oiKVoCNpZG6G/z+UOaWBiiYJUyCLYmSVlcx+snxctELfaaxQxnmTZTZyrwFThKVl81n6XIYzvwquXOunCO8Ry4WGnWcnqaGwquxAG+/ZirHg/s5sQ7dcz1jZTtHu4+30C1lVBppSSMikTyCnnseAuQ8vREcBipPd1Hjlwh38fkFHKG9JMZJ6Eym137xVhdQa0ukdirA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QjaWwjyIltSqkfb5/woMKnY01GNEdrpV9t22onFOSDc=;
 b=JejsiRdiWJiUVWSfynkZi4CKwIZyo4deVf2mXbIlUpiRn0Myek7RDf3VkyYwQ1uSJQum0S68AJx+I+sP1Tj3+X/UZCCQ7MRCZKcQB+ZfSX1hw3vGmN8K/l+bLypYP0St1MWMVwekUqg15QSETZgTcO6eLwL/+v3gsI8lB9+ceYo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ni.com;
Received: from SN6PR04MB4879.namprd04.prod.outlook.com (2603:10b6:805:9b::29)
 by BY5PR04MB7041.namprd04.prod.outlook.com (2603:10b6:a03:222::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Thu, 17 Aug
 2023 15:52:02 +0000
Received: from SN6PR04MB4879.namprd04.prod.outlook.com
 ([fe80::c738:ef27:97ab:fa11]) by SN6PR04MB4879.namprd04.prod.outlook.com
 ([fe80::c738:ef27:97ab:fa11%7]) with mapi id 15.20.6678.029; Thu, 17 Aug 2023
 15:52:02 +0000
From: Charlie Johnston <charlie.johnston@ni.com>
To: docs@lists.yoctoproject.org
CC: Charlie Johnston <charlie.johnston@ni.com>
Subject: [PATCH 5/5] ref-manual: package-index doc mentions deploy-ready feeds.
Date: Thu, 17 Aug 2023 10:50:44 -0500
Message-ID: <20230817155143.2578874-6-charlie.johnston@ni.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230817155143.2578874-1-charlie.johnston@ni.com>
References: <20230817155143.2578874-1-charlie.johnston@ni.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DM5PR07CA0071.namprd07.prod.outlook.com
 (2603:10b6:4:ad::36) To SN6PR04MB4879.namprd04.prod.outlook.com
 (2603:10b6:805:9b::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR04MB4879:EE_|BY5PR04MB7041:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c975f10-397c-47e3-a5ee-08db9f39e62d
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Kv09mFERnGV+BycRLikQJuu6gpurpMs8KENX6ryeoURLQxtHKix5018b9TZ6YOZBpqOjabl+Mhc2fBWPyk+VAfZsd5GZ1H5/zm2BEZCUH96WHm+AlLcDCFXD7ornC9GFuVWFI2KCP5SeIyN87SBzBObqvIzYv8TBptslklHyJe2UgzWG72Ga5Zq0bEV42eRc4jFDut7Oq3kGhkCeEU0q/XetJpydcsZjjMX6Q0yXtbFu8jYhTJD02O+1o0QKUXtMSjkTUtLaQHlvPsAgI6MP1K5GKczz418cEbsQiFpgTmRNaj7wA1gYROUrZb+wfT1Fju0FQExK1jeO67a0ZGx7OCYuLh5z/d6BpDoYYnSNq3eLIhUuxE1JOldtXlESx0Gqgza4W8PMuAWXmOK2OoWXVjgLvc5GSSDTxq+ZaEsZe08J5I1MXnEeC6H1YYZGN154Q2rVoJ986ISXMnPn2MlIZ5ahELD+JUMbubyDwj8SC70TS2GdLE85EPlzbSdNFenqdTA/kqh1HxUscfvqvoh5HAgwPGtJSs8k5Czbb7jpUw+HMD+f7wrH+QSCKO9fCRmb
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB4879.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(366004)(396003)(376002)(346002)(136003)(1800799009)(186009)(451199024)(83380400001)(4744005)(2906002)(66946007)(66556008)(478600001)(6506007)(66476007)(6486002)(6916009)(316002)(6666004)(5660300002)(44832011)(2616005)(6512007)(8936002)(41300700001)(4326008)(8676002)(26005)(1076003)(86362001)(36756003)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Bsow2Zac9kqsLEuc3vYam7oF8owdn35hWpGkXlDng4LcTiQfSYwvDtHZX6Mn?=
 =?us-ascii?Q?isB/33eQ0ow7OmfVo8E164VqyjS6ieYsKTpbjDkT1OHf+WuwhF1xkIi5Voju?=
 =?us-ascii?Q?O79vcmDG1a9j43reg8fn3+oye7yZFtlxLxrHIO606a/tA+0yS8oVzbKfo708?=
 =?us-ascii?Q?LYrtw2+3GPSIsppGzRqO2kia6UNI+OUWpZkACv7j9uF21Kokbtdi/ADeKQXl?=
 =?us-ascii?Q?98it8RKGiJdQesiaauDMV8W+gEmMsauatWOyENyugsQo7LnRFIwMuiST46mE?=
 =?us-ascii?Q?uNznrU7F9StainHJIoJ6eNXQlxEWalXz0Z3+dYGKD0pT6osn6DUSnA3gh1Gf?=
 =?us-ascii?Q?3qtOMy7c4ZgQwAWKDT6cMwpTjuY0wZMIIH/Vx37qIdBUVYCtUG1nnf1OCBzq?=
 =?us-ascii?Q?jC+4OwIBQUeG7DHyEKrAisJFrX2zL1sBVamAoVlbp72lhFus8IADfpoK+cQw?=
 =?us-ascii?Q?TIPo7bRT6W4B+6kDOKOuwfzRs/J6cCQSwKKuT4GruRyc9wIP/xXMdW45c0RM?=
 =?us-ascii?Q?VpRBg5MoxEMeYMP59xX0AOwshRxWMYzcoCsHN9CIYsKn75rh6oiBlp/YP5AC?=
 =?us-ascii?Q?nR3zg+Np3i9bxQPFxbOgx4E5byuHLXLnhQzR44P76TTvopTXqOawc+CuPkxw?=
 =?us-ascii?Q?80+1sd3+zy6GV1WTDClAeZpleHvOGHgFpZP2Kep6y4SBEgZgqmjE+bxt7ym8?=
 =?us-ascii?Q?bb3SZkUw95Fd9rmTaWnsdeqmMe55y2+WoyuizEW715CCg01HSPjooKytrT+B?=
 =?us-ascii?Q?p3MOV6yJJjNbF3aC6fxhF1KU+YsZ9MuF+Zn8NFConUspYUbDfJQ+mTRAEkuf?=
 =?us-ascii?Q?rW8LC9GZZlNCWPI2cXwt+Q9gOsOLTf8s+ZFSCmq1RmKXEu4kRKVFS59RSaNa?=
 =?us-ascii?Q?KTYWxCBatLad5/+ZFIwz1D3uookAxglZXrR3+1knuDjIkTxFQRYzAuUuXA24?=
 =?us-ascii?Q?T3P4l1YGGjM8cr+gZ3EliDBxAU4Mqgb68H3gGkb59/qkUVZlh3uql2IjORrv?=
 =?us-ascii?Q?VH1AMw7vnO4vwMbhmNm0p3zzfN2XJ5Uvfyqoe1SsQROw0kV2M624KIkUgtB+?=
 =?us-ascii?Q?weFRNOfWFwlFh3vGaTHz37n4eZwVRZX9Kwrf3zz5wBjNzMaMz79ybAaw1Pqv?=
 =?us-ascii?Q?hnSOEOq2QB0UldMHh8Gmct00vLgNhKweZzR+MTR/Tw+bRISAdwMJ++S2CER0?=
 =?us-ascii?Q?7zHUwDgXl7hIX5FbKDDVS4oSr+AleOCXKIeGIuK9dTukjqpPfwbQXMQcIuXg?=
 =?us-ascii?Q?Q56DASlUZvV4iN2Hbwz1iUIH2eXIfhPYhafy2KuAam+Z9dfTXslCtmop0B/5?=
 =?us-ascii?Q?mqn+vCGr4HRsG+hmIkiONAFgxM0L+Yn8buX7gTWmxPFbJ8MVL4LIVHZER2g7?=
 =?us-ascii?Q?OuRH/xTGzFQEKFPKUj9qAJQ0Yv0KOcLNPI1CncfG3z/uGJS5GJtqtOl6fVaA?=
 =?us-ascii?Q?8D1dsiJdnZleKiXqI8388eku5/ztXSLwpjsaEtMGtynVBBV50+kOTwGP6Nbe?=
 =?us-ascii?Q?veHtgcs/fsmvMStBPYua+jIP4C2XOW9isnaBG+v8u0nc66quBGsUrm6y0M/W?=
 =?us-ascii?Q?tiV/6Xtebo8g5pU7/hLT4sCHS4p8sZk6E5+n+ziFlwRosZEyegPu1o3KgAOE?=
 =?us-ascii?Q?Tw=3D=3D?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c975f10-397c-47e3-a5ee-08db9f39e62d
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB4879.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 15:52:02.8050
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NDvLi0T/MeUq6hX3ot08OpEVEAnB4Phz/8PJnMPSwArYe/ndA2wD8A6X+f73upBWWZDsvCUa222Im0jygxR/IA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB7041
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 17 Aug 2023 15:52:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4161

Clarify the the package-index task will not update any
indexes that are in the deploy-ready feeds area.

Signed-off-by: Charlie Johnston <charlie.johnston@ni.com>
---
 documentation/ref-manual/tasks.rst | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manual/=
tasks.rst
index 649d19fd7..c848948d8 100644
--- a/documentation/ref-manual/tasks.rst
+++ b/documentation/ref-manual/tasks.rst
@@ -537,7 +537,9 @@ Lists all defined tasks for a target.
 ``do_package_index``
 --------------------
=20
-Creates or updates the index in the :ref:`overview-manual/concepts:package=
 feeds` area.
+Creates or updates the index in the :ref:`overview-manual/concepts:package=
 feeds` area. This only updates
+the indexes in the :ref:`overview-manual/concepts:package feeds` area and =
does not impact indexes in the
+:ref:`overview-manual/concepts:deploy-ready package feeds` area.
=20
 .. note::
=20
--=20
2.41.0


