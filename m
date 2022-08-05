Return-Path: <aryaman.gupta@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBDBDC00140
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 19:21:21 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.1825.1659727278657218122
 for <docs@lists.yoctoproject.org>;
 Fri, 05 Aug 2022 12:21:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=mPCoGeUE;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=521612ba4b=aryaman.gupta@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 275IjTfG016466
	for <docs@lists.yoctoproject.org>; Fri, 5 Aug 2022 12:21:18 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=9JxcQKU2hHiDL4rt/fb6Yh6o09AMKkDo/KiBEgGfzAs=;
 b=mPCoGeUEZDicmisp7l3hfztAubo8WxxpWhorwFRuHOA1b9vzW8ndGU/X79B+++ClOmeN
 XhrS0GBy9YxhtN9d3N14J7AZfJKTso7xKwWo1ebSCckqOs2r2aISch2jsSFzj3QhNNu/
 kv3Owl+8uGKnwaC+yCkyiwC/SZ2hP5jb2f7ZC3LQXXyQhEq0mRqG00gRGQbUtOsFrmlu
 8OA+PoN9q6T/9ZsT/YpI1k2CQ+7cv5tzB1SohMyoBG7S9OlVbGvJnavJ2D+FadiM0N/u
 tOoKmRmaSq0Dm4rjNpN7P45z41DxBJSfIsyOiUO8236N5QmvikQX6XDtAaRWpOdVna0J +Q==
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam04lp2168.outbound.protection.outlook.com [104.47.73.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hr3xpsn1s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <docs@lists.yoctoproject.org>; Fri, 05 Aug 2022 12:21:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZZKunmA+kn5JjcDMbXQRei04T+hX++winRk+MR8Pj1OZIGKBkXEDsLaTRHu5luv5Kga4/t7o2jU8f6M9bKniCAbb28dAmX3w/j+jbExF79TTxFgwJLsR5QR2HIVfi3Y/OzC/5HPKrrQJMSe+WaMZ6Z+RUmxYKzaIqJZihrh6z3GJfnP4XE90yjWf3+y+Ck7BDB8BX+oFwcvuAt6e2zu209VSKkc23mKPd3UYyUEl6J1C+K2HtYx81U+/3ZWVUth4bPcY4cSVoHqkw4idJeD/pHbhg1BNnIREmnG1zEKfT093S6oraPUhf5ZB+M8LpheFhhuGWJS+rfsZj7ZS/2mwIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9JxcQKU2hHiDL4rt/fb6Yh6o09AMKkDo/KiBEgGfzAs=;
 b=CRL25iiUdwawQnXR1Ex00pFR5V6lT0H4xrSrtZsFQu5u3DIin2P1Cuu19RB9pGLi3sDiP5QXAKQv9TQ8To8Imo4XEZcte8ppjHRNNqtVmyrekV4RpUYx5vTOstw0fXfhzHx3daGsgyy9xpvccLMwakoc4AQxiFBLo0OHq5AG+vubP25uIUxBeAFpTomilj2rZYFV847LqyuOnQV5ORUZEGnzO8lAiQADn3QKT/vzt0WSJEv2uX/toU0XRT4iXLHcWUvosvH/kRByCwc3a7HUXTm+ThtvkGdXn7vOxuWq8ZuCxX66lpdxV5uaLxxl0W6o8WqhyivujpT6UN7+ZhshOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB6030.namprd11.prod.outlook.com (2603:10b6:510:1d1::19)
 by CY4PR1101MB2086.namprd11.prod.outlook.com (2603:10b6:910:1c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.15; Fri, 5 Aug
 2022 19:21:16 +0000
Received: from PH7PR11MB6030.namprd11.prod.outlook.com
 ([fe80::300a:e5c7:e79b:9a36]) by PH7PR11MB6030.namprd11.prod.outlook.com
 ([fe80::300a:e5c7:e79b:9a36%9]) with mapi id 15.20.5504.015; Fri, 5 Aug 2022
 19:21:16 +0000
From: Aryaman Gupta <aryaman.gupta@windriver.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH] ref-manual: add definition of BB_MAX_PRESSURE variables
Date: Fri,  5 Aug 2022 15:21:05 -0400
Message-Id: <20220805192105.1970030-1-aryaman.gupta@windriver.com>
X-Mailer: git-send-email 2.35.3
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YT3PR01CA0073.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:84::7) To PH7PR11MB6030.namprd11.prod.outlook.com
 (2603:10b6:510:1d1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 31cc5f4b-bb83-4f87-1ca0-08da7717aab4
X-MS-TrafficTypeDiagnostic: CY4PR1101MB2086:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7t1SOgNg7fUFib8rzHdUm3sF9kSpCxGUG4tW8fiWziBPcPHPY82NSIeKqxDOvcaKr90lmLEm2xj2Fain6ara94CfHB9Qej3BYW2uXLjyrny5hytlqG9Gf1afLHdIdRFmjbEZb0ldW+lLOu4vFG/xlptVQNa7Tu9e7Ro5wCpT4LyEdAZeVE8MPE25UljI9pttIRpMr/1L8azgZP1cPqWF36cilX6vS2hRx8Itf4KNwQ0wErYCaW0hY2DepLrPd6OuB/D15HqlfuHpH0XYOI5RoSukUkWhpfC/76Rb4DxGDCP/ILUYH0BUuk8L9d2U9Xnlc8SH8NoA4lycZ9CFnnHQqv/emtEy448wjKP3xjyaZ4Z9JLl2336pEOHIxHGZz2KxS9tzuLX29ez81pTBXqlFZY7rwZvgZQOvKfvpy+UCjDHqASUIcL45me5xISyb1gQl/Tjl4IaZNvXxoBwlvLU1tA2GCMqao0zGfwu3ExT3vNW+rHr83i/0sNHmW3OB+YI29q+1DcSN5iHc+5xGUbO6soMyK+xnShdsS7haVwNZH8jZ4qQ4SBaCWAMS6d25QDtQdNOnUEuMTa4Lbv5KWKBuvqze5cnf4qVKifmzINTUzTV1M5m91ZAGFVTzcwIiQs1oRV2d5fHcdWnuNAxBZleAB9DJFE29noyZuHbVFmnO4GMvkk2py/NkjjQq9eUt4Q+M33YcluBXdJvqwdb2XNuX+2lwmLVa99tfvXJkqxAfgKmPRpQs1wmRu/C7FCFO4/5E/uEcC6C0jnXFn0UQqtHkxZBjw9TIh/ubae+nZB2A0szH13luMUCtTbDAfff+TmbH7BYWIVUE2dZeBerSapJPbQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6030.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(39850400004)(346002)(366004)(396003)(376002)(41300700001)(36756003)(5660300002)(2906002)(83380400001)(6666004)(6486002)(478600001)(2616005)(52116002)(44832011)(38100700002)(8936002)(38350700002)(6916009)(186003)(8676002)(1076003)(66946007)(316002)(66476007)(66556008)(6506007)(6512007)(26005)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?B3Mm/uMqF5TBhql++UQ6La55vidC7NeicVYdrVeyKHI1cO19rpKgUpIwN+2F?=
 =?us-ascii?Q?FDUcX2RKwnNw6W0B7P+aaxP+HgRKWfBs6+6I7hZpJTsol09zjfjCQ1CJ2Lj+?=
 =?us-ascii?Q?CXWippdpKm7KKmV8Q7ZLpl0vfN9QGv8B0pSOimHeHquzgVQXMXgJJMeobw4Y?=
 =?us-ascii?Q?m6MpT6w0QxW+h9Bfqk/ZGT3pCOM/Vq1NA2VnuFKC13gWSzA2kwXBg3RUthFn?=
 =?us-ascii?Q?425X43Ri8mqYTaIDBvFKQFCytfIrIYz3pKox+r9lGJ+TaW98Z/mKRHCEY/BL?=
 =?us-ascii?Q?jVvU68tnFXir7R0dMr92K4Q61w2xJQWWaZIyvx1WgdoP2U0xp958Ui7R7Dxt?=
 =?us-ascii?Q?GZsmlR/FVbKruCKyyJsIYz3HiKGu5LwJspx9NZ20jGFCZ3rwBihIn5VXMUs3?=
 =?us-ascii?Q?iAtdt3vAKj9O/etH0+N9liN9MdebXofFDeKvcPBFsPOVCmqo/mZhM3pCL3Qr?=
 =?us-ascii?Q?DyuCJwzEy3+kj4Lj4pro5OPxQJeI+0P74DYQ9c8LO2+0WMNa00cHfnUzrla2?=
 =?us-ascii?Q?XckHCH9VoDt9S+7pJmCddbuv7zzA1kWLvR9dnBj7FSH3TxH0ZOyB4SsRRaWq?=
 =?us-ascii?Q?ckuzV4EKB1E67xu7coaySlTCewJw2jWUCSIFxtexSjQcbuJmIMtyOdS/3K40?=
 =?us-ascii?Q?OGn5t/ClgW72113Tljw7eJX8hw7rq2u0s4IRcPHqT6Fs8XeDesepB6m/nZqe?=
 =?us-ascii?Q?3+hJjIvZtUfDMLFcqW7EUamL74dWjsIoLLYdWHXMhnHIrvdp4iESbF/4XCzx?=
 =?us-ascii?Q?ZLA0FC5rJkcFLuN6iWdRsodORs/AUlTkcS0OCv243JTMnyz3aCuTcP7uH6uJ?=
 =?us-ascii?Q?zd10JwccNodZc4jGEx85+EX8KGYpMRAas/5tWb5fhqfYMU8TX1ISoTvqS+37?=
 =?us-ascii?Q?ixhKf5O1HLPCcQUwBX403yNc1Qd0rzgCBk7WG2C4Ykc7B4pYVjVTf4V2TFeI?=
 =?us-ascii?Q?tEMOYLQH3D/aZFCQ6Rj9GR0o27EwgjXHcQYgb5rDt9tcwqu9dtIDMgTmIslq?=
 =?us-ascii?Q?SKcWnDjSp/WvOO2g7achiUdN/7oHhJPdMwJfD7/RJuizzjUgp6+ml4aooOvU?=
 =?us-ascii?Q?dl17wrMaQpacU0vChV1vGc0ty7/8/8YT5Xz8xULGfHSteGS1k/luvuMRkMCv?=
 =?us-ascii?Q?enZYC3euUYRTTVPyIxnl82mra6FvmDbP9qT5E5ILchDpAr7WkwaoDaKXKxsj?=
 =?us-ascii?Q?7cr/d8qvQ7z/E4bpyjiLIG04yE1NDLs8boOzQ4fIUxQcMXkmWdj0qX0EfgGh?=
 =?us-ascii?Q?/NekPLtNa/TSoCAGaRFocx0CGbD5zQHJeTWSqUDaSZKgR60/KIF154Pukj+p?=
 =?us-ascii?Q?rQ42MEgBQ72PclyBC3rqL1bfFHj+DwUt1QNdpj38fOjMOa0xS/Doj999l8Kj?=
 =?us-ascii?Q?8+uqykeZu0c/jec+3kanet/W1nMgcGPImtCz8LY/KUhKudHwlRy2o+1JUnpC?=
 =?us-ascii?Q?3ewdbRNeKtpwaETOM40TBfn+rR/g3tLyAkN0IC9g8UbtXwhhNkkXW2gftKVX?=
 =?us-ascii?Q?B6saMFLTpdBS1nQbMzxmAvgY/7YwIo8NsrVAnhODTLkEkRkXG+q4/cP0F9lx?=
 =?us-ascii?Q?d841hwY45baIwR9KjDNcHT38reXWRD/rEU+W3zHCm6+GbbHmKHpWCUB7v7+D?=
 =?us-ascii?Q?Bg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 31cc5f4b-bb83-4f87-1ca0-08da7717aab4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6030.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2022 19:21:15.9492
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 aA4yuIqPu6m7V9H9aZmIdG4g21A2FOOW1wryosH+BBuOko9CHR7xdGnc6gjnLw0LUlf38AJ0osQufTcO3CvY3Sq9Sylrv1D1eCDdJcNfEpo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1101MB2086
X-Proofpoint-ORIG-GUID: D9NeXXrdH9GpNnkAQAo_qkQlgz6re-xJ
X-Proofpoint-GUID: D9NeXXrdH9GpNnkAQAo_qkQlgz6re-xJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-05_09,2022-08-05_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0 adultscore=0
 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0 clxscore=1011
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2208050088
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 05 Aug 2022 19:21:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3112

Signed-off-by: Aryaman Gupta <aryaman.gupta@windriver.com>
Signed-off-by: Randy MacLeod <randy.macleod@windriver.com>
---
 documentation/ref-manual/variables.rst   | 73 ++++++++++++++++++++++++
 documentation/ref-manual/varlocality.rst |  6 ++
 2 files changed, 79 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index cf817e954..de1ff8765 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -513,6 +513,79 @@ system and gives an overview of their function and contents.
       clean up your :term:`DL_DIR` directory by deleting any Git or other
       source control work directories.
 
+   :term:`BB_PRESSURE_MAX_CPU`
+      The threshold for maximum CPU pressure before BitBake prevents the
+      scheduling of new tasks. Once the :term:`BB_PRESSURE_MAX_CPU` threshold
+      is exceeded, new tasks are not started until the pressure subsides to
+      below the threshold. If :term:`BB_PRESSURE_MAX_CPU` is not set, CPU
+      pressure is not monitored.
+      ::
+
+         BB_PRESSURE_MAX_CPU = "500"
+
+      A suitable value for :term:`BB_PRESSURE_MAX_CPU` can be selected by
+      inspecting
+      ``${``\ :term:`BUILDSTATS_BASE`\ ``}/reduced_proc_pressure/cpu.log``
+      The format of this file looks similar to::
+
+         1657905652
+         0.36 0.08 0.7 142113
+
+      The first line of the file is the sampling time, 1657905652 in this case.
+      The second line represents the "some" line from /proc/pressure/cpu. From
+      this line, the last field (142113 in this case), is relevant. It
+      represents the difference in "some total" pressure from the previous
+      sample and is the value that is monitored by BitBake when
+      :term:`BB_PRESSURE_MAX_CPU` is set. However, while
+      :ref:`buildstats <ref-classes-buildstats>` samples approximately once a
+      second, for a majority of builds BitBake schedules tasks anywhere from
+      10-100s of times per second. Given this, a proportionally smaller value
+      than the threshold determined via ``/reduced_proc_pressure/cpu.log``
+      is reasonable.
+
+      By looking at the distribution of values in
+      ``/reduced_proc_pressure/cpu.log``, one can see that the pressure usually
+      varies by several orders of magnitude. Currently, there is no alogrithm
+      for picking a precise threshold but values lower than 100 or higher than
+      1000 over/under regulate builds respectively.
+
+      More information about /proc/pressure and each of the fields logged can
+      be found at `Pressure Stall Information
+      <https://www.kernel.org/doc/html/latest/accounting/psi.html/>`__.
+
+      .. note::
+
+         The one caveat in regulating builds using :term:`BB_PRESSURE_MAX_CPU`
+         is that Bitbake is designed to always have 1 active task running. This
+         means that even if the threshold is exceeded, a new task will be
+         started if there is no other active task, potentially leading to
+         higher pressures experienced than the value of
+         :term:`BB_PRESSURE_MAX_CPU`. Furthermore, there is some delay between
+         starting tasks and observing increased pressure so when large tasks
+         start below the pressure threshold, there will often be extended
+         periods of high pressure until the project build tools, such as make
+         and ninja, are patched to also adhere to the pressure regulation
+         scheme.
+
+   :term:`BB_PRESSURE_MAX_IO`
+      The threshold for maximum IO pressure experienced before BitBake
+      prevents the scheduling of new tasks. The IO pressure is regulated in the
+      same way as :term:`BB_PRESSURE_MAX_CPU` except that
+      ``${``\ :term:`BUILDSTATS_BASE`\ ``}/reduced_proc_pressure/io.log``
+      can be used to gauge suitable values to use. At this point in time, experience
+      shows that IO pressure tends to be short-lived and regulating just the CPU can
+      help to reduce it.
+
+   :term:`BB_PRESSURE_MAX_MEMORY`
+      The threshold for maximum memory pressure experienced before BitBake
+      prevents the scheduling of new tasks. The memory pressure is
+      regulated in the same way as :term:`BB_PRESSURE_MAX_CPU` except that
+      ``${``\ :term:`BUILDSTATS_BASE`\ ``}/reduced_proc_pressure/memory.log``
+      can be used to gauge suitable values to use. Note that any memory
+      pressure indicates that a system is being pushed beyond it's capacity. At
+      this point in time, experience shows that memory pressure tends to be
+      short-lived and regulating just the CPU can help to reduce it.
+
    :term:`BB_NUMBER_THREADS`
       The maximum number of tasks BitBake should run in parallel at any one
       time. The OpenEmbedded build system automatically configures this
diff --git a/documentation/ref-manual/varlocality.rst b/documentation/ref-manual/varlocality.rst
index e2c086ffa..d4d6d06ee 100644
--- a/documentation/ref-manual/varlocality.rst
+++ b/documentation/ref-manual/varlocality.rst
@@ -88,6 +88,12 @@ configuration through the ``local.conf`` file.
 
 -  :term:`PACKAGE_CLASSES`
 
+-  :term:`BB_PRESSURE_MAX_CPU`
+
+-  :term:`BB_PRESSURE_MAX_IO`
+
+-  :term:`BB_PRESSURE_MAX_MEMORY`
+
 -  :term:`BB_NUMBER_THREADS`
 
 -  :term:`BBINCLUDELOGS`
-- 
2.35.3


