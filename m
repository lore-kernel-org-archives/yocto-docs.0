Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 288D1CD98F0
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 06:41:39 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9681.1781678491741489554
 for <docs@lists.yoctoproject.org>;
 Tue, 16 Jun 2026 23:41:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=l1Unq48i;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0628fa2e08=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H4wdpB887882;
	Wed, 17 Jun 2026 06:41:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=wFU+YD60/mGvqD+nyVQ96ExT1DztJsmiFDocE7m4TCs=; b=
	l1Unq48iGTOm9KWyIRD9XCVddFqb87lvvu5nVzHhWzzcG7n/1IKtdfkesCEuOv+3
	9u0pLWxjVilMNT0ZyFw/2BHUANmwyHChIzL41JIDK/egtEAAsnzLtyFJvcwf+Dam
	9rCvjweYOM/SpURGwC+Q5irVTPAKiKS5VwFlpwy6CrY0X2oo8I2l0ziO6Eh2iyX4
	AnLYwQQHL05/KOQO20y2nIQaHafKH2jh2uZi2tGZ76U1elq9hP0obEF+0arv2urb
	EGKJ5zmkPgPwJDR054otrhBn+Jl1DtkHrdjxJnpcW4lsKs5s1F02/YdRmFOMlvIN
	Gb7pBxQVnRkbkc/my7gyNQ==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011011.outbound.protection.outlook.com [52.101.52.11])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4euefc0jn5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 17 Jun 2026 06:41:28 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AT8uZAUSM32PGaXXtsf2MlmZwODzvvltAZ3ZX6IUwA5TpxmahS5N81lPPpKwa2RHARy0FwFKyCIXjHUo7EOct4sdXa6myb+CtT4x+pUIEhXuTYo1fF8xitxhDoHiRjcnnAwRR+HYC6BlU2q5Ak69Nik6gpRUnbEQISVBEIvho6TWs1YxImizmBa6dHF8/Ae5wtRwj/lKmSsXk/tjy1drWn6xmP9W8EY4cV0IGYSfzZZelaBguUoH9nKy/nv2V1anO90PAV16rJQ1nDH//C47B5a+nXQO7dgYrgnRsDi7gj7Ep07w1DwRsrsmToVMUo3NzEGP9mnWamwcI3trwxO0Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wFU+YD60/mGvqD+nyVQ96ExT1DztJsmiFDocE7m4TCs=;
 b=f6zesVpKS2uwOG0SDdqp1g2sBuftyPwzAhU3CfC83bDoQbluRPwJ/Omx8viBdZi4e6EsjToFYbDXDLX5JzDiVgqsvEdpW3+kE4hOM+dF7VdhzO29RorLg2ZMMG0t/56D1P8fbX28DnrGWlBq6u+yofGk5b1InzEVX2vRsC1fbyfHKvwKsFM9avLKThkOwg52VqGbKkmxMBSp7+4iCixIz/+xQBoV6UrcZasMC7Ibwb66RqSFvtnVUBhOqPkfNTNf2U0ekFzbsXXz+y4xMCbKqVtyIgZ4Gwg0C4IVD0v7dSt+41M5dBDBBPF4OtIaYp/kEsa6G/cY4q7zbyiBuctRRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by MN0PR11MB6277.namprd11.prod.outlook.com (2603:10b6:208:3c3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Wed, 17 Jun
 2026 06:41:25 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%3]) with mapi id 15.21.0139.009; Wed, 17 Jun 2026
 06:41:25 +0000
From: Qi.Chen@windriver.com
To: docs@lists.yoctoproject.org
Cc: alex.kanavin@gmail.com, paul@pbarker.dev, Randy.MacLeod@windriver.com,
        antonin.godard@bootlin.com
Subject: [docs][PATCH V3 2/3] ref-manual/variables.rst: add UPSTREAM_STABLE_RELEASE_REGEX and STABLE_VERSION_PARTS
Date: Tue, 16 Jun 2026 23:41:14 -0700
Message-ID: <20260617064116.2672321-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260617064116.2672321-1-Qi.Chen@windriver.com>
References: <20260617064116.2672321-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0090.namprd03.prod.outlook.com
 (2603:10b6:a03:331::35) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|MN0PR11MB6277:EE_
X-MS-Office365-Filtering-Correlation-Id: e315deb5-c0c7-4747-8320-08decc3b7322
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|23010399003|376014|52116014|1800799024|56012099006|11063799006|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	ip6+jaednHjycFsyCBYkkrdJ5rxy0PODPtDj+ioPg5uLYEsMtlW3xVo77HgLYgQ9hK3x+Td+zJO3IVjy42gKim5WyIlDn5R+42pYpn6gKav7qCSAY5JHMJd9gzBtTc/8Mnqgrza4H2obgv+j+RR7MtWPpRX9nGFpXbFEKQX6oqxXf/vGvVg8H1QL1r7AK/kiG7VlmioZiPFgkqt84wpBh23KQGYrFKY/7jUxI6HGk1ivZRMN2cqUarA7R3UELw3kCBDqUP8Pmzww2FfV0ytVTbScteFlrIpsNopYWH65cBcNY7L3j6XKsxBuJmyeF4nCOl7oRBMDWAg6Gm5VBcB5YLClYetnjw9jaBDocY4VCkqYJqsMiOE83gXxPhejUGsDAjNJ1U35wiET0XqudoRGwPXyWryjDGVBTuG8rxleSZtVHF3EPtPl7a2s7obIc71IILNgZwAwvVfUDgCc57H9m3PXsAkExDB6AqQyYydwvtgOq7+BQbg+Ky4NWnHO2ltxw5rRHiDJ12h1SwSPUtSEpquSeIgfCCUL8+6h+xOo7Bt/OsWSmyJO5ibbvuaaMnFcWwmgibiKWfPD47WTSdIwoN7Q7EjvVnafAMq67HE+Mb3aYMyFhFzz33d4i9zNxkPtDlUAQ7RifDO4OOr2nme5Wdrnk4DQh+H8GsKL8olYJgo7sqjOuRFjRjRQFbDGPuXLHWH0C5pdRgbkMXY+zfn+h73IvGxAB8E72LzJw11GFC9jsvBI5pykRSIqjsV0by5H
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(52116014)(1800799024)(56012099006)(11063799006)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?H1Om1erpXrJSfiJ3UBtz+c/8qHK7CMWPM/uFssz+/q+UJaVJRC+adE8h1Kgj?=
 =?us-ascii?Q?JH60kf20C/tXho4043OliGPME7t/jL71JDelQDUBS5PVTPRdEmHone31kwZk?=
 =?us-ascii?Q?UMyQAeZxG3bVM4cKR/CDs6yj/lOPmWiP+kn4xoUzRI7yAEGFQQiw2f5Xrint?=
 =?us-ascii?Q?5S+MZd0klxWoNOWDudR5W16aAemjBouSppwPpF0j4t+EBalHbQodWCCjBceE?=
 =?us-ascii?Q?HJsnqNlf7nEXjK4Pp9qJ9HY4kJBTy3K0fZ7jkzMhsuB4QpfObqmA5R7rtWuo?=
 =?us-ascii?Q?Bg6hdHYjeCRCaJ2CpmsYOD5DjeOamojsCwrPHOMN8zOOA29kHnRVnI10CJGV?=
 =?us-ascii?Q?BXMEde+rmNDIWpplR6LU091Q0b4QlRheLmMp/oDm+BdG8m0AhqhoiHA7V/7c?=
 =?us-ascii?Q?HE5LXjPXjWYaYJSh6/Lo3fqfFhuftq8BizJ1h2ov2bmsuFBuT1qgB+IW5Eui?=
 =?us-ascii?Q?6rX38FF78c/zpZI6KE+Bw9bBzq2/lDyxrojXX4kmYEUXIvSSQchKA1Kd3jzi?=
 =?us-ascii?Q?wuzgWSYwXn4QLGwEv5EwxZKxqcMP73hb5PgqW7COiim0/KjFkVFAhr0GbjlT?=
 =?us-ascii?Q?21ne6ZobzyZERwZ5mKNX1DMtMUwitQZXK0zVWLa9gei7WexeHUhRevflR725?=
 =?us-ascii?Q?aEftSy9bg3ftsFzVzdv7b2+up3htpt4aPLgb+VAOkcQuzIDuCMBOrR4pyL2h?=
 =?us-ascii?Q?/y86kIC8Bav6ZJwEF8nWIR3yrsZkpkNS0iaf/S4i4E9BPU63eYMvWaJXBujb?=
 =?us-ascii?Q?JBFWxX/CUEnINWxbiijj3WRMCFIxlpyhkyEzWY2mUH3zDgMW8yi2ABahwI8Y?=
 =?us-ascii?Q?8LP5crh3gSE3+fyblgpV+01EWlDF+/45JWFOkxGiP5ZJyMiNXpYpRzwKEXlC?=
 =?us-ascii?Q?GHGMIpMswnsNcK9sAsCZJW5ruFBbZ83eCniHn9QXzl2DaVRS9iLmYSVHmr+j?=
 =?us-ascii?Q?2WaPzdPAiuv2CVIpUuhn4C1H/K1YuWXR2k1H+YYlROss8WZquvZzoiPWt7K6?=
 =?us-ascii?Q?otQksMML6cpA/rYgtVrsj7WuAgf2VSJeP0W7d3MVe1EKCDEnl7xgCfYexXhL?=
 =?us-ascii?Q?DBDm3H+tjY9HjC+S8xDc8ugYDNo6eQ+WT6639yWyFYCnguz2GrNl4LaS1IzI?=
 =?us-ascii?Q?VH7xyOVy5R2t1CusavJvzqyFQIzihUWv/PINKpHgujZq90kfWedJCefmSUL1?=
 =?us-ascii?Q?rvlthkms9bHFNlmmaMoeo1t1++VN8ORt/NFP3hVOVxC+y/c7epF8vmh8qtcY?=
 =?us-ascii?Q?gqec+5/UTfVFcZOk3w6JfdMzhtNWPgoboJxWUrAfCFdQc5WyXxrqFo+jKl56?=
 =?us-ascii?Q?Qthgy6cukZF+U1F1CivwFk3nso1/hkp6NPTjWyPEj6xDfdCDnOJ/rBb9c1u8?=
 =?us-ascii?Q?xfySDKKPZUDIoXfMqc6YIWhG8/RiNXpJ1oaGk5zuZ4hpOLzhbrE07trpCAVr?=
 =?us-ascii?Q?HPBMlYTrLR0EW2VItId4pMCQff2lL5UeDVPMCkX8rXqBo1xrQ7p2z1PpVkJV?=
 =?us-ascii?Q?fvh9oGG1/ltgc6eBXD2m7O6AKUFh2gPsz8A9CjP7mFgoz+LXX91AAGgVMsnh?=
 =?us-ascii?Q?KvDmp8wgX8sb9ziWGLm9JrKi/zm97GM72ztHrP7LbVs/vWzLYMaVvtYfIIhC?=
 =?us-ascii?Q?13na8rAoECpq0t+H6/UgWVqAkqze/gJHS2nFtolKhf3y63nituoid3srClCY?=
 =?us-ascii?Q?H/k5tnTvUxsJ9iTdfIEemIkG9wWy5NanGIPb6zdCt17wTZHRZNESWjIE8AM5?=
 =?us-ascii?Q?sc0+bNoZAg=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	XDQfgjmDtjUDYfamjN3v92O97o6x6CMzu43Wt5lKFWDx1ZG4lA4vx6HUBaZYMMsBop3Tsir0LE0kYiMJpnI5b/epfy7ObUNGD6yaCepLU7eolTp4BkGXRLQH9arEIVue/R5EUq8av+Ox52W9jk+LbYhgohqtE3gxP11sk2vsLP0pqKsR7EsHrfasPr+h7NWXLTKk6JdRqShsqzEWLm04I2uuF+ly2kV+q9VR7AY+/WqZdadA1hfBwa8kGBMEXWHKJzFbMyp2DAS+EwCbjfE9vS+Lwx8NQOgCf/+QmE40GeDYnrKuAGtsthoVRo7Q10TOeWITJ/CXF1GGpMxisuCOZA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e315deb5-c0c7-4747-8320-08decc3b7322
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 06:41:24.1369
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1bw5pn+pw8Nh8mXqXo48gT3HRM1N1VH2svTZYiqA6vLJu+7fDDtWKVqUHUBdZetODXll4VhumBfNsz5LAvzxyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6277
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDA2MCBTYWx0ZWRfX/QqIxiDsNrP8
 +xEPMwCLMZrLVQ1IXV3+VVIUsyigxw3rk7qYYzMG3tmU8orFEM2YgbZ9aLDKCw3iiKnVrhofxKc
 JCfb5r1pY4zHmXVaU+BkltHtQfzZUIHRrslhS6ZgI2H0IqeSaCQA
X-Proofpoint-GUID: XxQPv7l4NM255ogxtQpKyuoipQmydtku
X-Proofpoint-ORIG-GUID: XxQPv7l4NM255ogxtQpKyuoipQmydtku
X-Authority-Analysis: v=2.4 cv=ObGoyBTY c=1 sm=1 tr=0 ts=6a324198 cx=c_pps
 a=+4AL93Ollhzyglb1kYk7Zw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=Sh2Md9FlZb4d1zb7sPgA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDA2MCBTYWx0ZWRfX0bczHNZ8bZsW
 sWZeMP7jAkw0vsfwF9XtFKadhI8PU8USXPjakN9AW66V0ZhUIqtLlfKBHiBrkztRXhi+tyiroGW
 g3NXkkWQuafcQ/UVmPcY2u2VFcXch4swnQlcUIuxWgwRJGK+BiayHGWMV6MrgAd539mX6rG/xN+
 sBxznJPyZebOJcjn64UzfVFbK8SLC8Uob/cd/ZiRpLUGjiHKow5WzgYwrZN/3mfUVZDa0NzZMLO
 MoeNev0CbStBAaAvon7pLPJuop53JZYVH2X6h6NJJtNqJ/ASsmd5OyL++bQhc+hPPQttcZjVhsZ
 cS2fGHYZ8b+1ZvjPo66ueA8f/tN+l2zo2z+AyTNd/9CbDCToJppkiu2MJoX+Ec62gicThRaazs7
 gPB5u4PPzaR6R8rMg/xTXTourD6bwezngSvT1n1oEfVGBVNK3bHdNScv2q34shiy/YsfUfIkmzq
 g+rz7cy2Etpt3ykOA/w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170060
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 17 Jun 2026 06:41:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9765

From: Chen Qi <Qi.Chen@windriver.com>

Document the two new variables used for stable point release upgrades:
- UPSTREAM_STABLE_RELEASE_REGEX: filter regex for upstream version checks
- STABLE_VERSION_PARTS: controls how many version parts form the stable prefix

AI-Generated: kiro-cli

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


