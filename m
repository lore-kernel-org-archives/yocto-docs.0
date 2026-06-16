Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BFE0CD98CE
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 05:20:30 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.147733.1781587223812871640
 for <docs@lists.yoctoproject.org>;
 Mon, 15 Jun 2026 22:20:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=KJhHvUim;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=06275b3310=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G4qepO2727607;
	Mon, 15 Jun 2026 22:20:22 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=ahYqaRpfpBXvLvg+rHQIz6uixkY8tvHGIfcxeYwBTUY=; b=
	KJhHvUim1aFeTqSXnGrE5BIaH+8RWdmeJ4ibDbg7ue/7QsA++jUVPazthEWPXcDt
	4UM5yaEFWTvKsk82zonDUd/7q6+t3LEgpfA81xjkCk6FTAR9PNkORJQaHPes/HES
	FAFu9s6Jn7BJBIz3yiLJh5FOtT9+gDBwF3rZLcqthD1g0g95bmInmsCKdqIl3CHG
	iBonwZw1aK9gKGuW2ePZCNpPVkMlh2EPGa+21eeLQgNFY2ncAsic83rwbnodeGt5
	vFh2HFjrTuJGvqqUk/U5HloBU9uzLV92UA3G2MlxWvUvdzKerR4rHW/Iagpo9gLw
	a6eYgYxn/NUZ2Cj54qOasQ==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010063.outbound.protection.outlook.com [40.93.198.63])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4es2g0bxpt-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 15 Jun 2026 22:20:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pOCjBtrWAXmwrOs/q25tT7iT8jCpyYJ6EbCBRRNFNbo7Kv2L+TZU5QuNk6eV92wDLHevThUyJPiLm9s/lrW6lqQ/Pne/ZX9h39C/AflkjLng2ompBYRtwB7rk9aMGIYRk6uIIYpMKtqFuwrytSdkL46KDN9Vdedf1Q/oesFJeCOejjGK1zhSx/BP7lgMXFAHvALK3yJMzCymzGvn2dckPeWKrMZ5dpw9+7tNHU3B+dUbFoYzM2EQUVlFQKHKekSxJ2CFpg00y7srbRZASzizk2hNjDyQVT9LKUMPICB12CAJCvBL9S/Z6gniFWc/q6Hg6jSA3HMUYTrKV78ZWsTqHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ahYqaRpfpBXvLvg+rHQIz6uixkY8tvHGIfcxeYwBTUY=;
 b=iOgRHVVAgSaA5XIqgUSQQYnVCbfsOvJ2+mxIWZ4ciyTUWRT8MpizAj/qKeNbgpESTawaNlZg7P7xrjDCPuran4n7K1nyKcl0nUhtiF5uIpKxnQjeakWbkVF6/0qvCzYWdaEW6k3+ZiKzADxCOkBClD96ScPDBZku9HkpPuddSndxmi0aDrh3SJPBHXy3Nj8iBDj7YUdjNjvdzhGl6TCEIqYjPyRN0RYU/3t83OPwCkD0vGa7fI7+vUQppr77oNY1A4py7JwpPMBE63N47cuoW2uv87lw56cOub/k2lAq/O9MAG+4+H8n7Gxa2IecKdgp3T8RWKgsohCNAe+2lYG5OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH8PR11MB9533.namprd11.prod.outlook.com (2603:10b6:510:39f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 05:20:20 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%3]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 05:20:20 +0000
From: Qi.Chen@windriver.com
To: docs@lists.yoctoproject.org
Cc: alex.kanavin@gmail.com, paul@pbarker.dev, Randy.MacLeod@windriver.com
Subject: [docs][PATCH V2 3/3] ref-manual/release-process.rst: add patch acceptance policies and stable point release upgrades
Date: Mon, 15 Jun 2026 22:20:09 -0700
Message-ID: <20260616052012.3286114-3-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260616052012.3286114-1-Qi.Chen@windriver.com>
References: <20260616052012.3286114-1-Qi.Chen@windriver.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SJ0PR03CA0170.namprd03.prod.outlook.com
 (2603:10b6:a03:338::25) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH8PR11MB9533:EE_
X-MS-Office365-Filtering-Correlation-Id: 6aec02df-c5e6-4e32-b6a2-08decb66f593
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|23010399003|38350700014|22082099003|18002099003|11063799006|5023799004|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: 
	Y3phdj8JepPIbWsqc/DPU9j5lqVZoCu5WMzNiCNyfbIUYQJ9tiFFvf5iJQpWcW67VlbdEg1HZQMc9RojuAoVEPfZkvFH9UlQ2t5w7uPb5eOnOBSlLk1Wk9yTnQnfuf0dLsPVsjlvhcvetBwr8JOJRzvcWpZDdc52rSYs7aqIgDG7HwLr4Xdm9/ys4H0jXCGlAGtHv+OPnTxUd3z47NqTBd0fbITdLwUwG8Xi6SiO5HtmbRsNQMIsOfyC/qmPxQoXsgr+mg0e5pao9RMNyhDFMrKYER7QFAkgWrGC849324uBUbZ9ubzxKENhTkAE0rSpnFzuu4AGWv/KtUeFb7v/FC/YtpsY1CEdWEuKcP5Ltjh3HY3dHXdf8B9Ya1lMj86aQX4GmRvpeAOP0n7VX0OhpgxDwccrslAR+zjmSNzudeCoHPTeZymUE1ipJF7YKPo5vlTSlltnlKY2JPJiw3n4zW1WQl4LWfZ6RK9EYQBSUyY+ks4pz7JQ/B2dTcFA//dZ5bUPz64ag7OV+4HWOh6y0T9x2qkfLBb9DX4s3/3Che1Swr3OcXdrE0Pf2JsjO4crlhTyJX1xNBxnvk1PpMSoTtCYyvg8IJMVLTORF2xFcn8mSxfOwRCM5Xof7cMFx0XO/NF/LwB5lwkXPN0i69/YS5YaWgsvhklHBq9XIAKe3Np7SSVNW2cGpSIXnOEOw0XsuHW/8P4lEomnH1hO/3WXgrP0TXaSTzTqtnPRH6tFKZ3PQQDIcIKnrVk8GVp4l84O
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(23010399003)(38350700014)(22082099003)(18002099003)(11063799006)(5023799004)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SEE4RitvT29zc1RaSHhuQmwxWmgvVHNjVEkvZ1ROd0hpSks4K2NFa0NsaGlQ?=
 =?utf-8?B?TnJjYXo2VWRCbzlONWVCY1o5QTB5czlEUzhsY2M4UDFXeWRIdy8vMkMxMEVJ?=
 =?utf-8?B?b0tDaFpyWWlaMDRleThMMnRIUGxNQlc1Yy9uTkkxTE1KaThtRTF4K3g4WTRm?=
 =?utf-8?B?MlVVbGlNNGtpdzQyUHU5N1JWQmZLVEd1QXRDZzI3RzlqL3k2bVZvcTc3Q0ts?=
 =?utf-8?B?L2R6OUVjM0c4b0dwb2J1UUdxQW90MTRCbjRuRm85Rmd3VDMvSmRwemxma3o3?=
 =?utf-8?B?QnZaWGd2UVpCWTR6Vy9aT3FBbHE1bWM2dHEzeDdxM3NPUmZOc0dIb3N2Y0Js?=
 =?utf-8?B?ZzI2Zms2ejlZTzFDbC9yKzl4d2FxVWdnTkt3YWdTZHpJV3FDMm9WMlFndWw3?=
 =?utf-8?B?MWVDSEtFNHNIeDQxdnZmbUJmL0lNdW9kNFZIeDcvR0hhdUVhNTdzS0ZnbTM0?=
 =?utf-8?B?bUNUYlZCRmpmTk9hYzZBWHpmVkZaOTYvR1JnUWR4dHdKczRnOEJSdGhWek4r?=
 =?utf-8?B?bFdINFdTOFNVMnZLVTJwRVpzckxCQzh4aFZFYUl3dituQk5mcWphbUJJUCtP?=
 =?utf-8?B?VjBWZ3lwT3pzbFhNZEoxV3NpaHdBd3NwQjUraW9ScnQyMEw2WUhhNnpQZEFR?=
 =?utf-8?B?dWJsaHhlVGlReHhSZ3V1NXhjdVFXZEsyUktGZ3VaZTlEN004U0FSdGtOZFd1?=
 =?utf-8?B?Nk5qZ1JOQkpGL1NDdlgzS2RJU0N5ZzlZY2RZbnBwVXllMi9tY2ViQzJ0MEx2?=
 =?utf-8?B?cWxuOWxJcEczdFFHV2FHL1dYQmY3WjN2Y1V4eThBYWNEZWdZS3hwTFlLb1BP?=
 =?utf-8?B?SHJhQVN1NmpPNVFXOWlUTFM3YlByOU9ZNU51SnljL1o4b1FlekYvVjQrMEV5?=
 =?utf-8?B?L1FSNmRpdEVuYkFnWEJNZ1V5ZHgraXJxSmlmRTNIMHNSVXRucEJrZ0hEOGtS?=
 =?utf-8?B?N3B2T2VialN4NFZEWmRuMDFMNkwrTVlIYzBobTQzOWVaT293T200YXFDNS9P?=
 =?utf-8?B?MHg4bGJ0Mk5HK3B4UldhSGt5WEszM3VIMDl1V1hTOWxzcU9EUlBoSHNmdTZq?=
 =?utf-8?B?T01rakt0YVFaOFdmWVdRbit2OUhiUzZjRTViZ3pxV1ZCYmRDc1U3RUdHMEdu?=
 =?utf-8?B?WGVMaWFZMlFaYkwyVmltRUo0aEZ6anVCVTF2TGZ1bUxvKzRUU203b0N4bExL?=
 =?utf-8?B?dm16N3dMaWdLQ1NEd1VOT3hmNlo0b2JWbjFRalpQNnptUi9QeVNVQWdqVjNa?=
 =?utf-8?B?M2pNQzR5OEJVOUh0L3E4QjhNby9VSVFSNVh4Y0p3ZHRjNDJ0ZDNHYmowK1Zm?=
 =?utf-8?B?ZDdMSWlUUmlCZzlBSFUvbmY2dWFyOEFVMEpCN0laVkJpWW9tdFZTVXp5OGJX?=
 =?utf-8?B?QlNmNmRmakh6eG8xMHlHb1NKbG1vZmtkV25ZMTI3YW4wY1g0ZFNlMkp1U2dS?=
 =?utf-8?B?NXFIZTQxNXFCWm1jR1JjUEs3czlCd1kwaU80R25jQitmakRIa3lSTis0Zy9Z?=
 =?utf-8?B?VVROZXRUNnI5OW9GTGs4bEQ3WTdKMEZic2ROTnZDeGFSS1l4dmZvV2FiTzJK?=
 =?utf-8?B?SlV2SVJuQi9vSXVkaWE0U3hkcXlHVE5CbVV3QW9ZdW83ck9vMi9DTS9RYm1V?=
 =?utf-8?B?NDRlZ2lxeFE0VW96eG5yQTlLSVdUcFZDVkVoU3hxMi9oSWU1RjZ3V0VtZnZO?=
 =?utf-8?B?K1U2UEtpSUZqd0l2aTV5TllnVU4zajZjZksydlhNTTlaOTExUnNmOHdFWjhj?=
 =?utf-8?B?c2lIc0IwdC90bjRGWnpVT051YXg4OVAra3N3T0x4aSsxcU8renVvV0s4QUZY?=
 =?utf-8?B?M1JlUGJnaGJwelBHSlAvMTZiSG9kRlFQQkk3WmRyNDVPSHkzaEthV2Z2OG5X?=
 =?utf-8?B?WlAwNTQ1Y0hxcVgzUzZwT3dqem5uNXVUNXZRdnhxcGdEZmpFVG1pSmYvcWVC?=
 =?utf-8?B?RytKdkQ2Q3VrSGwzNnlRUUxjN2xsdGRZWGswb3N2K1dBVXI2cVpoZlp6YmNw?=
 =?utf-8?B?ZDBHUmZvTW5WSXZvY0FBcjljRjcxNnBSQlJUSkNITUk0cjFQRHdYNVNTb1Yw?=
 =?utf-8?B?Z05YNTdoQ21JN3hNZ1RhM1pocHh3RHhQWHpiWnVZV1orMEx1MFA3QjZaV0RL?=
 =?utf-8?B?Sm1tNmZIRjRjVk1EQmhxVGJmTndNWXdWdXNkOC9RNWxkLzFNdVMrS3BkVnUz?=
 =?utf-8?B?Sit6WXJLbEYwVEdlZ0VMdnlwcTh5SVl4NmtBbEdLUm5DM2xxUzFQUkNscEc0?=
 =?utf-8?B?enAxQmxNYjBIaUxUc1FaUzVqSGxVM0dLZmlGUjdPbDBVdkQvMnVHbGVlNEww?=
 =?utf-8?B?WitseDRTMWNTNmVRb1M4WjVoSnRjZFNuR3JTd1VmbEFsT1NmTnVLQT09?=
X-Exchange-RoutingPolicyChecked: 
	Bxt/v8lGrvffKtdFcDxW48RpSz+XaT0QKFRvrYSh/zx+U9KN84H7ehyWMX5x537P8rlIRzLX8b3GJ1D1H7QcdbyOY7eVtfTqizydxidKSrq47W0J5o2XB+Clj6G+4A+OdIpinN5TT5jdzUZuPVA4++wT3WATuYrU0dbU9SQ8crmx8hshk8NatJoHKeDtG/yl0C0b4MmQqCaveS5jyAlndRiEKc51SWMu/t8tfuRIurEA28rb43IIzf62GC6s+rAAEYcFCfqjXXxzzu8LOCAt6fVM/h1p1/TbK3HRPO76BZbywKHf+Z0SvkZs1EAEqASlFafZtI+mwp3OE6fjcCfDSA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6aec02df-c5e6-4e32-b6a2-08decb66f593
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 05:20:20.2017
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZYM6rZ7bFDAI+uet1FyF8gnYrDbQg9vlJVXsi7dtCJ8RxWn66R8cITBMp0iknGFMzhmQZmklItihuNk1D2ni8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB9533
X-Authority-Analysis: v=2.4 cv=ZJ/nX37b c=1 sm=1 tr=0 ts=6a30dd16 cx=c_pps
 a=nBoeifw3k4y6eW1CqgP3Vw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=t7CeM3EgAAAA:8 a=VShSNdALnTx5IIslTvEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDA1MCBTYWx0ZWRfX+4OEUsfER6zN
 m8Wz64F3R0tdwiy1jHD5JFJ1zUYaIBCTJLvkcrU7RZ3gE1WvcGQpvwL3lIbTjXwa1rKYfGnNaH8
 r7btUrHulDm90exnWT4DTMYk25onx/OwDG+Xgqjyi7mNanFfR8KEFpxkpufshv+OSnlLFDv64Kf
 V2EFUwTdkATlVyBPdpSbhdMDKIf/vAE2PAcf2S65PlYOUTrZml7UieBgPa1SpA8H3+ar3uOZFJB
 czad96OirsFQFmzOjZwJgXJfgRthIBQkiNHe3LtS1HRZUAK3KeVFR3NdU+yt5JpIP9fLdIUyj6+
 FBTn8omOeEYdLZanzX7prEGaqeMagqL6oWSwMDVzc28kkfHntqxn70cLfDdUAe4+DbMVe40mT+i
 ZxTGhK5N8/tV1KeMySkZ1IcPA88VD61lpgKF6LO3TvrCW/EV9Nrj4L6cqglFvJVxms+RMm7blBE
 Fps/ONvm6pWVmSbd0dw==
X-Proofpoint-ORIG-GUID: mOfaY9ivMkIiLbUC5rZfd_CnVRDSvC7I
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDA1MCBTYWx0ZWRfX8pxExl97s4Tw
 YJazZyFcVfyGm5gliDScufYBRslXc7u7hlePE1bCL6TosTUDxW9uu9N+Kl0pc1ePHJVZI/hz5t/
 a/xNg5JMQc1VjYd4bNoeEywZUJa0V5fEURPxsAnW1wb9wBpsL/yM
X-Proofpoint-GUID: mOfaY9ivMkIiLbUC5rZfd_CnVRDSvC7I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_01,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606160050
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 65G4qepO2727607
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 16 Jun 2026 05:20:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9728

From: Chen Qi <Qi.Chen@windriver.com>

Document patch acceptance policies and stable point release upgrades,
including criteria for qualifying upstreams and how stable release
regexes constrain version checks.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 documentation/ref-manual/release-process.rst | 114 +++++++++++++++++++
 1 file changed, 114 insertions(+)

diff --git a/documentation/ref-manual/release-process.rst b/documentation=
/ref-manual/release-process.rst
index a55187c14..fa712869a 100644
--- a/documentation/ref-manual/release-process.rst
+++ b/documentation/ref-manual/release-process.rst
@@ -127,6 +127,120 @@ stable release.
    exception to this policy occurs when there is a strong reason such as
    the fix happens to also be the preferred upstream approach.
=20
+.. _ref-stable-lts-patch-acceptance-policies:
+
+Stable/LTS Patch Acceptance Policies
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+All changes must have already been accepted into the current master rele=
ase
+and any other release still within its stable support window.
+
+**Acceptable:**
+
+-  Security and CVE fixes
+-  Fixes for bugs
+-  Version updates which follow an upstream stable series or LTS that al=
igns with
+   the original release (based on compatibility). See
+   :ref:`ref-manual/release-process:stable point release upgrades` for d=
etails.
+
+.. note::
+
+   Once :term:`UPSTREAM_STABLE_RELEASE_REGEX` has been accepted for a re=
cipe,
+   version upgrades matching the accepted pattern are considered accepta=
ble
+   by default (with the usual ability to reject if upstream fails to fol=
low
+   their own stable guidelines).
+
+**Potentially acceptable:**
+
+-  Fixes so the codebase works with newly released distros
+
+**Unacceptable:**
+
+-  General version upgrades
+-  New features
+-  ABI/API breakage
+-  Metadata improvements and refactoring, unless this is a dependency of=
 a
+   required fix
+
+.. _ref-stable-point-release-upgrades:
+
+Stable Point Release Upgrades
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
+
+Some upstream projects maintain stable branches that only collect bug fi=
xes
+and security patches =E2=80=94 similar to the Yocto Project's own stable=
 release
+policy. For recipes tracking such upstreams, it is possible to perform
+*stable point release upgrades* (e.g. upgrading from 1.0.2 to 1.0.3) rat=
her
+than only accepting backported patches. This is the mechanism behind the
+"acceptable: version updates which follow an upstream stable series" pol=
icy above.
+
+Criteria for Qualifying Upstreams
+---------------------------------
+
+Setting :term:`UPSTREAM_STABLE_RELEASE_REGEX` for a recipe means that ce=
rtain
+version upgrades can be confidently treated as stable point upgrades und=
er
+OpenEmbedded's criteria. The Automated Upgrade Helper (AUH) will then
+automatically send patches to upgrade recipes with this variable set dur=
ing
+stable releases.
+
+.. note::
+
+   Patches to upgrade recipes without this variable may still be submitt=
ed
+   for stable branches, but the barrier for acceptance is high. The comm=
it
+   message needs to justify that the version upgrade follows our stable
+   branch policy or that there is an exceptional reason for taking the
+   upgrade.
+
+A recipe may have :term:`UPSTREAM_STABLE_RELEASE_REGEX` set based on the
+following criteria:
+
+1. **Upstream stable branches exist** --- the upstream project maintains
+   branches named with a stable version component, and there is evidence
+   that these branches only collect bug-fix and security-fix changes
+   (no new features or ABI/API breakage). For example, util-linux versio=
n
+   ``2.41.3`` has three parts in its version and upstream has branches l=
ike
+   ``stable/v2.41`` with two parts. This demonstrates that bumps in the
+   third part (e.g. ``2.41.3`` to ``2.41.4``) are stable point releases.
+   Similarly, systemd maintains ``stable/v259-stable``.
+
+2. **Upstream maintainer confirmation** --- the upstream project's maint=
ainer
+   explicitly confirms that a bump in a certain part of the version is
+   bug-fix only.
+
+3. **Clear historical or common-sense evidence** --- the project's chang=
e
+   history clearly shows that a certain class of version bump is bug-fix
+   only, or it is widely understood convention. For example, openssh's
+   ``p`` suffix increments (``10.2p1`` to ``10.2p2``) and kmod's patch-l=
evel
+   bumps are historically bug-fix only releases.
+
+.. note::
+
+   Patches to set :term:`UPSTREAM_STABLE_RELEASE_REGEX` are sent against=
 the
+   master branch first and follow the normal review process. Once accept=
ed on
+   master they may be backported to stable release branches. Exceptions =
may be
+   made when necessary, e.g. setting :term:`UPSTREAM_STABLE_RELEASE_REGE=
X` on
+   a stable branch for a recipe which has since been removed on master.
+
+How Stable Release Regexes Work
+-------------------------------
+
+The stable point upgrade mechanism uses a *filter regex* to constrain th=
e
+upstream version check so that only versions within the same stable seri=
es
+are considered. When a recipe sets :term:`UPSTREAM_STABLE_RELEASE_REGEX`=
, the
+version-checking infrastructure in BitBake's fetchers (git, wget, crate)
+applies that regex to filter discovered upstream versions. Only versions
+matching the regex are considered as upgrade candidates.
+
+For example, if a recipe is currently at version ``1.4.2`` and the regex=
 is
+``^1\.4(\.\d+)*$``, then version ``1.4.7`` would be a valid upgrade cand=
idate
+but ``1.5.0`` would not.
+
+For recipes whose version uses a dot-separated scheme, the
+:ref:`ref-classes-upstream-stable-release-point` class can automatically
+generate this regex. For other versioning schemes, set
+:term:`UPSTREAM_STABLE_RELEASE_REGEX` directly in the recipe.
+
+
 .. _ref-long-term-support-releases:
=20
 Long Term Support Releases
--=20
2.54.0


