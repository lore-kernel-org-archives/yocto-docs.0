Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EB27CD98D2
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 05:20:30 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.147305.1781587223265672813
 for <docs@lists.yoctoproject.org>;
 Mon, 15 Jun 2026 22:20:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=qoFq+TB3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=06275b3310=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G4qepM2727607;
	Mon, 15 Jun 2026 22:20:21 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=R01EzcQtMYeD0H1edN23mtvkvwIa84mX8CdACb/Q1Dg=; b=
	qoFq+TB3AkfYspZsZoQk4OMXbUAkLjbEZAle3TP4VQyD+GVMFTDl2cvhAQPqM0ET
	qS+swtf5vrXCWkdTO7CFwo3J/ygN4ChsZDsWU54M3LSNRtSX/huXyjLtW/x/HKfj
	aNT78rRRIQTgDn8ZghYqODEV0CfAp9NdSj7V+rUSjueCJqOxqQDu/2ujdgTHFAF2
	tnMYGDDmLeB6vINSxYZxU7Yce2UMIQ6KDL8tRzsq4/DBM8Mm635HQrlu+hO5UtGo
	lxHR28/pch5kuGSCR0gq151YxodldDAapCkT7Ix8dcuKFyw5TJeTqtwUxTsA/Fh0
	tKfapejFTSJLHzHJgp81eQ==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010063.outbound.protection.outlook.com [40.93.198.63])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4es2g0bxpt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 15 Jun 2026 22:20:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wPSwqqKnFMr7DY12iWLQzCsMHxjxvyiqdgRFgds5HQX9gFPiwRhyByEVt63pHJxasyiVm8WwrsynMVk3JRZZmV2CzxIRclJupv8ulzGsnsJvFjkouhtOoG605XdD6ibvBaErPVwGNSo1y0REhYORvhzvHnpTtQflxcSiOKP+1/Ktpn16BTCtvF+kxt4+pJCew8LJIGfpv+r8YTeyMphdVqRA914d+q38qhWHEiMVmh55poOM05MoKYQpFL/OAaoauwPAm/1V3jxGbkPmVCXzKJgBCeInvy7BH6nE850+IVNjanKj6RmIbBziIPc9n8Lt1nNmVxEelEbbAHbha4ixQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R01EzcQtMYeD0H1edN23mtvkvwIa84mX8CdACb/Q1Dg=;
 b=cLi18eJ7CdGSp/7XFFgZuzFODHvBnrmhPRipt8UZX3CrjJALcFENWM7N/RJSIqlP/JSijGyhFGOGg72uY9uX6DCI9Oa7rXeFMYWvZAGypJknR+34Czyjmx7mjKQpIvQByyAUuBhdsTBIeLxc6Zq0heUX2kU7pOoGnx8t+cZEzVNwtIMSik+07xx9VPOUc358LBaRnrCUHXEKTLLnHef2nQXmWTAIQqe8iYWEwvXFitW4APZxEMKsxmvcm159DhVI/jnLRYdNXX6FD6FLTXJ6rFDMkYcWH6Iboeku3hV+i6NL+fqKOZZyxjrSxDCpzOUFk+YyCyKJD/nTQqvTU2ykpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH8PR11MB9533.namprd11.prod.outlook.com (2603:10b6:510:39f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 05:20:19 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%3]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 05:20:19 +0000
From: Qi.Chen@windriver.com
To: docs@lists.yoctoproject.org
Cc: alex.kanavin@gmail.com, paul@pbarker.dev, Randy.MacLeod@windriver.com
Subject: [docs][PATCH V2 2/3] ref-manual/variables.rst: add UPSTREAM_STABLE_RELEASE_REGEX and STABLE_VERSION_PARTS
Date: Mon, 15 Jun 2026 22:20:08 -0700
Message-ID: <20260616052012.3286114-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260616052012.3286114-1-Qi.Chen@windriver.com>
References: <20260616052012.3286114-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0170.namprd03.prod.outlook.com
 (2603:10b6:a03:338::25) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH8PR11MB9533:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b6aa2cb-0698-4be0-2c1a-08decb66f526
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|23010399003|38350700014|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	8ILvmKPlascBmloxKdFUbkQR7diBBrcfH964eS4VzA2UhmDz3PMAgQTBBiv8qUgKHPGNfezW6tmgN6m7BQnTwlmvMtcCPh4MTLHAOd1acNpMT4XseRP271VaiFC3ZDgor4PQjZXA6ppO6hoeJ5/3Ofk5jUUedSbz7mzVMVsU0oyzwEozFvag274qmB5QZPgGkfQL5xD8xStQC5K+57ePnwMFzIYVUOS/NASPqMI9E8qdnST/gUDf8iCgfxBpj215yA2r9o4U6ArU3mCbYvl/Y/M94YjIohLqyotkyb3P88jn0fTAqenwlbGGl/sW1B1I/pFmmtdbvlB2yfXyMjg6NzzAz4D3zljgBK1tB5CO4HYYFK7WofR1pnDix5AzEK6TLin5CutykX4RW58qV0x5CGO4OEVBDCtAAHHj3xTT7DtMpHPF/Nu1rJ2mvVK+z1xbEwytUT38sJP6EDhK61cCMImOmCqPHRb8GlyvvGtd/Gu2NvPtnI8rRlq3EhTFsrL28zOmc+v8cH2sdKAftoS9K7FmZfGBURiPTgGYD6znnRAfk+EnMIHldIoOlWv4GWyyyxAixFdkJeyKERL2Mt54MygMDR/uzcSCzJ0ZtfjMjpiy+AZ1XXwPEUwKIcFD975rS9HFBwWpo0yBlEuASXrKnmNxWWMpT2kRS6mDGDPj7dtlHYunBowzCCr8DtF0OFq3i51sq12YOGKheK92EJulO2wyQcWXE0wDB5u1GVCkvE9pL2SUYWgDdKN5bPFPizp4
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(23010399003)(38350700014)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?HfYwUtFTN8zLit+LNpbMEE1mbV6YnK9HtwUG0wlVf/0/5gaZywD3c5zPZYBM?=
 =?us-ascii?Q?gn/j2QbazG6BMHPdt123Y7gmQ/DxKHDPELbweBDf54eqyqJS0th+8d7nhtmA?=
 =?us-ascii?Q?hOBa9sZsKGSno9rZANpEgN8qJXrNR8AnMFBTbmAYyTDy62zfzGlwWh+zbQ4V?=
 =?us-ascii?Q?goTIBu3IuZFM3a6JRM4pcGgZBCLqcxsIkFec2HN59K1YMGOHWoC7+q5rhxu/?=
 =?us-ascii?Q?CgxQw1vomoaU4EX5uLi8OvvYewHIyrypMHZ2ukGo8zEiiqHwhiU36hrGQnCd?=
 =?us-ascii?Q?wNrs4UJXCpmW7w9nHHZXG8DOANwUPbBpwd3+byLxK+4aP6597xESp4j9I89K?=
 =?us-ascii?Q?6ngK1ZyFm0Kr2dH39R9wcqUdKmvg0Fm8ZouVv85+lGyHw4HV+DtmvHp6LdeK?=
 =?us-ascii?Q?fp525gIlDlsllqcinobB8ahFl+/JrgFOhlgCC3coXf4y0831VeJyYuM+U6vw?=
 =?us-ascii?Q?oxP9ie9GEJqjQnLN4lxUYW2tq3XwAlUSDyDf8M7jyCrzFxBfdX5WH4Pv+Xsm?=
 =?us-ascii?Q?zl/EYwZmxaSxgizVO2ZRGt5rjdRssWaZ6q2Nd1DGxqA+TpXOIY1KVf7NbDJF?=
 =?us-ascii?Q?+x0SzOKAn/1DqASeqNzcVNW1hOsX9YQysWnBy7wFqdSNbTz5S3crV+C3It7Z?=
 =?us-ascii?Q?X8KsXVxMNr4MHGOXjsvQGLDKFZX7zffETmWEXsnRAaca0EPWA3rmC8Uefq7t?=
 =?us-ascii?Q?jS799xu7cqsUYzUtiudbYUxhGS3jx8E05HaZn1yXjMMU1OMNWF+gsGckHWL8?=
 =?us-ascii?Q?LhJcxE9Mu0OXRp7WHtBxHFxgjfVjboQKhU3ENd/HGAOnr0ZNGuQm61uLRwMJ?=
 =?us-ascii?Q?boaHIbfmPWbYuQVjICN2ARVpsWQqyvhKwrLmlxAZ0rCAh0FiW102UyqO+Z41?=
 =?us-ascii?Q?0dio3kY6O3Q0SKhPdssCBPkVm7O+Gih3psn2AJ/nO5IU+OyaMxuGXv4Bu2jI?=
 =?us-ascii?Q?PuV1IaWD2SvOJmqSfa5iwz/fpggfZZ9HwWm9tg79PMhugL1KIapiLc7kpFun?=
 =?us-ascii?Q?MLuplR0Jznm4Ct60jEui5zP/BiEm+RYZwG/kTNNeyQsLcw8uIiqZ95si720r?=
 =?us-ascii?Q?cHkZ5xDoalJWqp2lc9xOK/i3/QICwirmu4Bfrlu9w/RoxfH7Fd30NkLsaDK3?=
 =?us-ascii?Q?/QGTSDjQw8GEnGQXqHDzq3znfmmIpmQ7rGsl6NLGUj2wc0Z/Pqp9OEktXMiN?=
 =?us-ascii?Q?YJhQheJoGnm1MswMfACUGryfAxX0SocvRZfhkSI7WQrIxZuPVNQSQfd2sGjQ?=
 =?us-ascii?Q?1DaGH4Z60mnECaZ/6MYnGlCOPFhs8Wg5RLcfd1qs8C6LCnzMAnlyv+zbcZAS?=
 =?us-ascii?Q?Uw9z0MuDZIkCcBItfM7uitVXSSJrOHLjwM1mtfG8AHbTfWzuIQFJSJ7xWHLK?=
 =?us-ascii?Q?V7R0ffhND4CPyq5qBDhgOf0zbb0jbcw2erVIbhec8pW9vGmAQYchAUpQfWTk?=
 =?us-ascii?Q?V1LUnuhLIZTq0z+wkR8B9oRHwjLxSrfV3zW7nbXtn5iyNkgSloKzUUQ3add9?=
 =?us-ascii?Q?RJ04/fYmIQ56p/whcPULYWp2bXSshcWuovroMpYZf1inzYtip5UtQm6mgW+3?=
 =?us-ascii?Q?uVMQ8p4+JBJdU49Cnw6QpU9WDfobZu2S50A5aAfNoLANUY0aGy4OAKDiQFnI?=
 =?us-ascii?Q?+j9UUWYjJiqxP+9dDp54qq7/sLDTjcQVKArPf6lwT6HbzPynsVz1ogh+EDWr?=
 =?us-ascii?Q?w+hkIVD/jQmsZIs/tqw7hluXwH8/5yxxh7Zcdd4DGKj25YO3LbxC/+DKYj5o?=
 =?us-ascii?Q?lWouao09vg=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	pl+z1G1ksxpBvRMhEmGvJ/SqEcaea9B3b/ImN4mEUdFFeooMgV91qk30ENZwbg3J1sjUeCic5+nB5qLrGIs8kuFXe+9Ip81glDK/zPsACt0e339lGmEVcRkwVgvdVkvZ7E3stnVx+ayxepIuehRMITp/RdxXZf/nLKqHIe/jguoGdOwC/Yai5jlrW7fQEw12c8I7y56MdA5txvO7bbBUCZLBdaEaO2SdGx4tRKCTrM6aln/wV1Bf/jFaoAQmkGWSxUsTYOple6rjD2XXuAPl0eKEtDkPPp44fnpiwaYNh4YAUwgp6uFI63w3rsYNJpkIkjBDTgR1kglK1AqHCwWL0w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b6aa2cb-0698-4be0-2c1a-08decb66f526
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 05:20:19.5321
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FCu2FTMouMpzYIL7euVYwjeXpjDFsIxJHdPwb3i1F2oj/D1xk1dyNymRzIdBNsqm8YduuqYpNJuC7ZLU+8L78w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB9533
X-Authority-Analysis: v=2.4 cv=ZJ/nX37b c=1 sm=1 tr=0 ts=6a30dd15 cx=c_pps
 a=nBoeifw3k4y6eW1CqgP3Vw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=e08-atkVFR6WX4J2vB4A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDA1MCBTYWx0ZWRfX2cEUwrc+oeIM
 VsIeFdx4myTSs2oaMGj+UI5gDROXJA9W0ow7xqII3fdH4BZC6F97q3Iy6FLP//ZDhM58/0F1aNW
 KZw6wOX3nYCTvUDI+XPuulO9Zqn8R2q4bkdIti8DgoJcuuXpShoIFtDu/XvR6ga79D6UgdBxw1e
 b9dpmrtxeAcMO7/9J01Kdc8IRq0IJjr62KUOv7bQRVprrIAfMJfJ+bstBBzAt0UHOXdiEMTp/KT
 e9nLccGezgKUwcl8E/z9f3808/d6hioA5+FdBaR6AvKyxbNYeTLdOfjmAZso1XV28Qcrx2YlzlK
 1lAcf8xPXVcitZ/qQ17WLuQrs/Pjk680R4AAOVPWLv37vgtxEtKFecqyRyzk4LRDo/i4cwiblCu
 wFY240LtgD4Gh2h3EMlMqevsnyJHcxHZrxxMPFOtRkrVDSh7DgSQSraVNapyk15NVKq2QfgXkgr
 nPrXWkdYNR/G0DU/3hg==
X-Proofpoint-ORIG-GUID: sQ7YHzXvMHdeB02FPq1DrADXwBqT7sOD
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDA1MCBTYWx0ZWRfXyNQEpbcBFQrd
 yx5y/aRY5jrbZIjQdqjjUcLw545tTTXXYl4kHAvNmN1MqXqiuHbgSvueQyjcVBsSwoQtn1ZfA5G
 HzH7tT3l4CrLCyoeqp862Nvc+jxfc1/6gc47Saot+vqZlyVPg3ru
X-Proofpoint-GUID: sQ7YHzXvMHdeB02FPq1DrADXwBqT7sOD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_01,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606160050
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 16 Jun 2026 05:20:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9729

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


