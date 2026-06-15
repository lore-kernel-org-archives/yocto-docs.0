Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A898CD98CE
	for <webhook@archiver.kernel.org>; Mon, 15 Jun 2026 06:24:52 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.123782.1781504689957317431
 for <docs@lists.yoctoproject.org>;
 Sun, 14 Jun 2026 23:24:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=LVINFMOX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=062669d7a8=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6Ntvj216469;
	Mon, 15 Jun 2026 06:24:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=R01EzcQtMYeD0H1edN23mtvkvwIa84mX8CdACb/Q1Dg=; b=
	LVINFMOXt+vmSO2rYiWGh0lpG+4Qc7h5rkTYPFRAcTq+F1YYNJejjgyGjO3+7fsr
	xF7QV0RDleYGjPC+7UooPCay2c8MHeR7bfsz+uOWDazZLzXNcFIH/uW1bzb7DxVT
	ImMOo8OjX+WkrL4cuU3ZVBfrJrnMj0jiv8dwXbUIvzsLs2EFk2LvYiq+QEDzYN3R
	R2caipdYZFI9JBHsVeYOAqxfbQqSIrth2ljaAqJPk2ujg5uMPVju3gqGLJpO9R0G
	S77bR7WoIVcGPKHbpr0WGhOMXMCs5BcH3aJ4swk5wsDfb3nWrykurRA8QFJgf5Ql
	YbIUqVtVnOsXSav9xZTA0w==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012015.outbound.protection.outlook.com [40.93.195.15])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ervkp2bvm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 15 Jun 2026 06:24:48 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oY4KLoO+3quQ5ftPggl2ck1xiHABCxekE6XsYx9Zh2D9pS6tBHyPcAQyBiC00u4Z/APhCSJ163F+JcWXM9Gvu5/AOnmSeoNHWYQVhyPtG6sBlqw4JqINEWBx/zYb33A9/Ne0pgoCPhL9TnDpOrJ35O5bqkZystNMs95/X7KcyRA8cg/H32raXkXtJUiwW5K4+sf+vyMuTUQ/vjFync/QXQsjSL7MAUVmBhEqC2qQ0ugslB4illCLvIjg0d2KixSrZrW4WVWXETuNmPPLZGacQoNDpMiOL1CehaOyr/Tafm2naNKgYbbeRHLnkoXqM8Fk65P2b9fg1Y/qatPPoh9K8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R01EzcQtMYeD0H1edN23mtvkvwIa84mX8CdACb/Q1Dg=;
 b=SaFI5rrWrYwWAfFhIlkZxFFN4Bs2ozxlpGG16Rm31CJxLyu0nTSvOpkQI4HzNOJEIGUdY49wSPvIYhRl0mvhlGuVhmKDGpcPt738Az96MJMx0GmS2lDvQ4eYecIzmaVvHaGHxOulKIfOgEUzL3rbjWcsS3nm/8CvmgYREYm0JF21PcB100dQYueBBBkmS1ZItQirCGcQM8S7Kn9qjA1zL0h1TmSyGUe5WoszE5AOQNU1GWk32vJdvf/MHkJGCLBnXtLVTmeSg0m8RIGEiElvl+jFh4h6a+DGqmA0VkoSHOC+OYUrpmKMJ0m+61M5M9ckLeV5EQX3XR8jUj3aMIXOMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 06:24:46 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%3]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 06:24:45 +0000
From: Qi.Chen@windriver.com
To: docs@lists.yoctoproject.org
Cc: alex.kanavin@gmail.com
Subject: [PATCH 2/3] ref-manual/variables.rst: add UPSTREAM_STABLE_RELEASE_REGEX and STABLE_VERSION_PARTS
Date: Sun, 14 Jun 2026 23:24:35 -0700
Message-ID: <20260615062438.3119651-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260615062438.3119651-1-Qi.Chen@windriver.com>
References: <20260615062438.3119651-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0143.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::28) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CO1PR11MB5154:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a1c434b-3699-4abe-d327-08decaa6cb2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|23010399003|366016|22082099003|18002099003|38350700014|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 
	dF1CB8/ituABH6B9oydx4JB9N2p1egPFoN21actDC7IS8JZt/LEzScNxOVx6L5PZUown/3EsYrgMfXpPZdMItCq5lqYULjb8VZ8wlfRy3pf1F8aSLuT2+17IYiexLHq+jEbtXiBAiQ5T0jSrVJdZQYl1HMs1aofZKXfL7pqZQcxvIrw98nizdLvaUsX03V5Bfj0H6qXmt1sZv6OVyS+XH6wIj003xESmlIxzAcy3hBcXdbNdNiiHKQppjZ+iyEsG6TiYxHFHkbr8NUGtx+GI4LSk04d0lmj2Sjzv/ZwVBPvN3uqtrvmXwn3lk2NiTplD/r2A+K1MwyFzMuf6x/8MQhRTJXwV8m/zWoLB7WEpSouxf2ic48bWiS4naH94+x/4kQLqgFBGEUfHGwBGd1Okb0XsxyZPgC3JMoeqZbAIgtgbQgEn0/rphZPWuz/n9+GON+PGkXFovLRkYmjYV764XMZly04L1I7SYYDx+i3ORNgi5vB8D3I7zGDyT9tenx6QWTUJmbPsUeHmbYnQ65TJoNXOMD7AvJ82JyXfyiu8UELZq8V40fZYbwTadlIWLrIZCE58tqjxiQvnpf8HfxSXGxqzof41Lqb1OH9UzZmwHJQjsZmPEsFtgzkGjzgHRQwvIZ3+eTSGo7CQd7INPQ6Xw9O8ggO1MgXWYPdug8iZsiSc6u7zlwv0YNWAM1HwuGm8iazjplWQHTr5zj1L2duK0RiEikzYPXnEvG9INBxbtttlqsslYDQXfVO1szl5ueLZ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(23010399003)(366016)(22082099003)(18002099003)(38350700014)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?mEvmJF9o0Nh2gagaFUTWLJ6mMxbNttf94Caz8SoWyHUk9rVvGDPBEf6TMcUz?=
 =?us-ascii?Q?A13yJ8oAytnudbyR7raTL5ujW6SW9TGqJb1CqNYY/Aa5RUVgOrexvT4I/UEG?=
 =?us-ascii?Q?HsO6YB9L41ZPMOpqZXtxL9/mL8WYmlLMM4MOSfOl9WKYQA3XpfuO5/9h78+y?=
 =?us-ascii?Q?Czj84rjIiwQfGZvFCZmcxIF0KQlWqMC/eHs6BD/ARactHhkT33iqK+wkc8MD?=
 =?us-ascii?Q?zS2RM80cHKhXp9jHXMQFZdxzTQHxph3Ugs1JG4xZAfsxkuAyrdcfZdXCoZVX?=
 =?us-ascii?Q?AFnWfIHJ6fVUQkYTUs9kv/jA2PI4tgbFf746ARnuzaMTu8nAo6Ndf3+L/kFo?=
 =?us-ascii?Q?mIZ1lgb4TbuZ8WT5bQLs63NiKXmCZE+YNQYY4qasTCReZwzQt7oh56mId89C?=
 =?us-ascii?Q?u/d0zR2MceNt5GmU8LA4eGJluNIQ1mBeKKXJkaWZnBZNvjq+rXc2hPT842Ux?=
 =?us-ascii?Q?2P9SrkQMyzQku1NXFGEdQ1j5n1ewMkCEbF9Tj5mKN9z4xD5ZaupNv0ef41TA?=
 =?us-ascii?Q?i9qqyU02qQQgGKMCdohtdz2Cmv7J5z/1nBc5XAw2eTEsHJpg4rP8HL6zyn9o?=
 =?us-ascii?Q?hTzGZjwYx8z82GpTVKDEs6666ukFQp+x7a3kfYtBLb8v2mw3PAANdg3jXssW?=
 =?us-ascii?Q?BsXyvGubSVtbmHQicNNaeatjnhjE9BW6D3KcS3E9R++cnYIGWEENwik+plPK?=
 =?us-ascii?Q?mdBP3+/AbojP+D5lyWLREPcpTKR69vnYJ+DG8ISPG+PCEvIuI2GlDeLhwo7D?=
 =?us-ascii?Q?NWlQh/2rKD2KoZ9SQdSzuft77AaDiBJYBjJx9NC681PRtUo6iuj74navaXqX?=
 =?us-ascii?Q?N8AQrZu4pGD7KFw3NTSbPtXRK3m7w+7PYz4+QHTdadRMFC6xYLAGfCLdh2HM?=
 =?us-ascii?Q?sD3BnS1eDkGde/D/w4vWvQ3C3AkPjdSp/DsV6jlbAny5dDizs52r6uPV737L?=
 =?us-ascii?Q?jY+lSNK7bExcLJBDfyU3FFxbB+COTAAmsCksbc3MEF6I/NEzQxKsbNBcMPHF?=
 =?us-ascii?Q?ifb3EUdisuqZnMJsBXILGTahed1rEbR7C6qbsuYBRLcFM3Rl0QZd3bAuuVg5?=
 =?us-ascii?Q?/+US0dPO8raOjg6pkKXXKBga7fYx3ezA4aEl3j4ZjUVLIPb+rdaYX/fAgeeP?=
 =?us-ascii?Q?GbP9+rhmVQO8++cnPJXTUyPfLyO5FdzYgwd5+G9vRD+Nfipk5d+C2HbEFZwz?=
 =?us-ascii?Q?PFQUkvy4zJ/ORyYzJL40bwAuQK1bcSIkfSVeFmSGtroBmPe2ncwfo38NFsU+?=
 =?us-ascii?Q?eMj3nPGBVDdDurzsqStLKLIbxeiPndf0ONvVxxo90/1AwBEXgq/zDo40H6nU?=
 =?us-ascii?Q?fkulu41D5MotixefHPJyseTqRJ1rkHbsq5yknSWo48HaMKdruUUmzlFfpM95?=
 =?us-ascii?Q?iyVDjT/BwTCaJqv3jX8ToZ1JTvh9QZUSuqPJiKxdEBUzHy91+vNqZlCTIoLW?=
 =?us-ascii?Q?d2GiSZ16XrTZYzZzycpOFzXyFhHu/IjqUC1cdpESY1v9icpMZZSPzW97QlGw?=
 =?us-ascii?Q?T2BBIRN3eYNMFri2dY4UlGwf4NMcL4zbeMF0OQHxw/Q5unQspICKDvATSUfn?=
 =?us-ascii?Q?+2vYRsnorlVGfVpviKVxil5UwIiXwaYx+f2R1Y0gEJ34EebNoULaR4wru0WC?=
 =?us-ascii?Q?77GfYS5bFRYNIKdzMaGBFKBARqhQhcsuP66ixRjFIx3LG5BdaLY2eSPFZepF?=
 =?us-ascii?Q?7YTm68XyMKQYz0Rpz7D+QpuVaPr1t7hjAStXMOfVvu4vBNueNGAd2SKkQQtD?=
 =?us-ascii?Q?0reyPRnlEA=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	NOF4ihK+L3ztJXQQux5OeVV8VYzc0PBZm9Yu4EXmZ995psq/iLu0leGO2/xulmXKp3GbP2nmo1OjEZCjOShXEhf115EjOFK3N6+MOjFFmxniYNS2OPykdndnf5GOkGhO6iK5jTOVQMki/8eXdmk77KLqKgtesexlzvkIhLcskJWg3scaNAxp0mAal8Mc0VanTxJg7F6uwxYmNi8etRU0q2FoSXuCvdIDi/qXiicMx/DbbjPus3ZeS9JqOxol+8SV/Bw2oTnuZWIdzWQVXrWKopWtitfvpNbbbHE/ZX5mHBPoH5VvCYLpjUyiFBF08CMFimpQKcSaRD+8cO5gi/D7TA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a1c434b-3699-4abe-d327-08decaa6cb2f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 06:24:45.6990
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6bT99PP3dtXapS8KRsJXDevFUKSdBITXXo97scUHbgda+oCJFtQWvayzfcfp4ddMNueyId6VMoxGods43Ymfww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5154
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA2NCBTYWx0ZWRfXwuUf88qAK54g
 wzOARqmjtQhdSjGNNmBi18ytY1w781F2CeHKHOoYGAePo5fyBeaq3gGs+eRqTyabd8X76pjJZEm
 YhyMuXWimzbya+ICLWxjWWzbsc5nhFT3hH7gIhk2oaMNax8sZF7d1zmk3MALF34cxtYz2iGvyGg
 Jfq7P92ZhiXt572MDHP/MoYbmb2w6MC6ZTFBHtq4rILDyN8DCYervWj+qzV+5oi1/qElGmz8bIN
 tQJMfihK0s6pucGjjI8eD3DMqoxLqliIikcg0TeN80tNKlyqj2otLFZ71a9nAADkhUGNodzFRku
 7S96+eB5ZcHPUcHpBsFj836k3g4F+/jtw6YNvC1T+MMLerLGm4vP/3fiKP/9jM9ofVvqMhU7qvs
 P1eKvwfHtojqrjCDBRtd2WX4T4M9hsgPf5EnU/6JjZ3vi+SFdy3HjY7m9lEVkWCw2kmJD55s0lH
 YVFbY63udIuu7dHBgUw==
X-Authority-Analysis: v=2.4 cv=BK+DalQG c=1 sm=1 tr=0 ts=6a2f9ab0 cx=c_pps
 a=OAmo50eV21M7Ophgg7+Z+Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=e08-atkVFR6WX4J2vB4A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA2NCBTYWx0ZWRfXw++7SYPHenMM
 Dog0PzrWPLk7lvvK4itNkjz/MOrppZL+OesCpv6lKKPsdNyy3VMJtBltnQ67ex5GDuwirzjg9yB
 eDTs5IgpWyzvclzmeDUxM0EcEQECaTgio2lW8o1PFF7FTyK9dGD5
X-Proofpoint-GUID: FeR7lVe2pbgVJ0boFVQZmsSExZAbX1Wh
X-Proofpoint-ORIG-GUID: FeR7lVe2pbgVJ0boFVQZmsSExZAbX1Wh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 clxscore=1011 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150064
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 15 Jun 2026 06:24:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9714

From: Chen Qi <Qi.Chen@windriver.com>

Document the two new variables used for stable point release upgrades:
- UPSTREAM_STABLE_RELEASE_REGEX: filter regex for upstream version checks
- STABLE_VERSION_PARTS: controls how many version parts form the stable prefix

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 documentation/ref-manual/variables.rst | 28 ++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index fe3d5a999..cb11f7901 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -10097,6 +10097,15 @@ system and gives an overview of their function and contents.
 
          SSTATE_SKIP_CREATION = "1"
 
+   :term:`STABLE_VERSION_PARTS`
+      The number of leading dot-separated components of :term:`PV` that
+      constitute the stable version prefix. Used by the
+      :ref:`ref-classes-upstream-stable-release-point` class to generate
+      :term:`UPSTREAM_STABLE_RELEASE_REGEX`. Defaults to ``"2"``.
+
+      For example, with ``PV = "259.5"`` and ``STABLE_VERSION_PARTS = "1"``,
+      the generated regex matches versions starting with ``259``.
+
    :term:`STAGING_BASE_LIBDIR_NATIVE`
       Specifies the path to the ``/lib`` subdirectory of the sysroot
       directory for the build host.
@@ -12001,6 +12010,25 @@ system and gives an overview of their function and contents.
 
          UPSTREAM_VERSION_UNKNOWN = "1"
 
+   :term:`UPSTREAM_STABLE_RELEASE_REGEX`
+      A regular expression used to filter upstream versions during version
+      checks so that only versions within the same stable series are
+      considered. When set, BitBake's fetchers (git, wget, crate) apply this
+      regex to discovered upstream versions and discard any that do not match.
+
+      For example, if a recipe is at version ``1.4.2`` and the regex is
+      ``^1\.4(\.\d+)*$``, then ``1.4.7`` would be a valid upgrade candidate
+      but ``1.5.0`` would not.
+
+      For recipes with dot-separated versions, inherit the
+      :ref:`ref-classes-upstream-stable-release-point` class to generate this
+      variable automatically. For other versioning schemes, set it directly::
+
+         UPSTREAM_STABLE_RELEASE_REGEX = "^10\.2p\d+$"
+
+      See :ref:`ref-manual/release-process:stable point release upgrades` for
+      the criteria under which this variable should be set.
+
    :term:`USE_DEVFS`
       Determines if ``devtmpfs`` is used for ``/dev`` population. The
       default value used for :term:`USE_DEVFS` is "1" when no value is
-- 
2.54.0


