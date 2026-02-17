Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1E10E9A034
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 18:28:28 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19151.1771352903266542607
 for <docs@lists.yoctoproject.org>;
 Tue, 17 Feb 2026 10:28:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=IoGNUS4u;
 spf=pass (domain: cherry.de, ip: 52.101.72.43, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qoQJXOKNGy9CkPSnP7ULot7NxLnuKH1GWiCboVdlgKzsAaoUEcUudB5Ud7PtF4zS8hZh4nAMyLqArwmg2bfFS2WxSdtK+r14mtr5BbdeRMBGScSf5ZTQoAjs2YLhZsbdt3MY82xoh38kjKJjtY1acn45nDoIFABAyX0k3Yb62cdkZ8hM7itg5FjD4NILiSZtNwSmbUvPf0RJVvXeYuqr12+YEEjuH4AkMnPGHQttBxAjD/W4ORlN5cKT+2mzLMrYO08ragzIyxZdf7NbLO11bMzz9OMXaWlkHS7HTwu0D51IT30dv4RgHp38UdCd3botTNOszAAXoV3aKkKaiDjrEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pf8DkafBK7JtIWux0ShK03mKMnjwSQTe8s7Jt8X6t1k=;
 b=OaO+JyAruVEhetw7azmQRTeVydcWwbPfCmiCk0NSdFz6yoecKYEx4y+s2XFvXelP8+K5F0/6vHQ72Df2k4/x5Bh5zB4HLs+CNZbugJOI8W3f9UiglZDi6smrnvohd+2IYiPw1hNeRu7kKde+h/aSXlXSm22kKGKwRUkAiyOiOEIqows8uxb4q9Z2HB5lknOmA6HTKHd8mIpyI3BmpdUbIPOvLg6VHmonDbghssTyz4vIIhjFOzrEEpWDjgd1EMqEeoIkEYYgpXptiHeyaTkFEacAedB0ORlyiViBQfjjB8eu9OujYK4xnMMukBWn02hpgC8DyeA0sXdK+1yuCpeKHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pf8DkafBK7JtIWux0ShK03mKMnjwSQTe8s7Jt8X6t1k=;
 b=IoGNUS4uXKlAjyOA8YdU5YYfog9CwyhBtoDd6D8AS5/4r7GDpGtihPPzqHE7CxLdE2OnP+LzoTkhVmEPcQ8BXuhpU1WqSA2xN4m3hHYduoJKzzGt+U5VVPfdQ8Ni0gshS06JrX9ufctmhtYGkA0LxAtch2/AcyNFklzq+hmMIKE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by GV1PR04MB10629.eurprd04.prod.outlook.com (2603:10a6:150:207::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Tue, 17 Feb
 2026 18:28:18 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9611.013; Tue, 17 Feb 2026
 18:28:18 +0000
Message-ID: <0394fe4c-987b-4512-a462-edf2d937b51a@cherry.de>
Date: Tue, 17 Feb 2026 19:28:16 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/host_packages_scripts/tlmgr_docs_pdf.sh: install
 perl
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260217-fix-latexpdf-target-centos-v1-1-2e2abee7a078@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260217-fix-latexpdf-target-centos-v1-1-2e2abee7a078@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0125.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b9::13) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|GV1PR04MB10629:EE_
X-MS-Office365-Filtering-Correlation-Id: ee10cdd4-7aac-4307-ba53-08de6e525228
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TlA2cmpTT2I2dktxcGw5NjdNRUFZR1FtRHFUNHZaSElqQWtlMGlhVzZwMUh4?=
 =?utf-8?B?b0tZNkY1S3N1RzRjRmN6MllkdE1GanhrZVJzc3NoYWFOWEJmS2p5TlpkMXhB?=
 =?utf-8?B?QVYwSTU5UGE1Z0ZKRVNoN1BBdGM4SzJsOHg3TWdzRnBQWkNxS3VGbGVqVnR5?=
 =?utf-8?B?T2MwcWQ0NWdmMWRtUGVYZFJTN0lxdm9HNUJaQm5YRTZCSEx1eGYwVjB3clhq?=
 =?utf-8?B?Q0N0YzB3UVZNOFI2dkhRTG13TkxtOFlLYWphSGl3NWZpS1ZIMTYvUkxCK0Zz?=
 =?utf-8?B?SnAwajd1TENSZk1DU0NPd0M0WDBOcTJ1dlFKaHJTUy9LdHRYZDZuTEhIN040?=
 =?utf-8?B?V3E2R3prN3hqUHcvRGtWdFFoZVJVcURaek8vdjNZRmJzSUp6cVhlWjdEWWhZ?=
 =?utf-8?B?QjBnU2RnSFE3STZ2ZWlMQkhaMlphV1BSRE5Dd2QyZDF1L3VJMFp2NS9ZSWNt?=
 =?utf-8?B?dlVSTm5GSlF6eDQ0OUI5TmtoQnVLWlNPemxHdzlwUkNuQ0oyUHhZSGR2ZU80?=
 =?utf-8?B?M0F5M3B3TFl6d0l1MXVNWWVaemhSdEJPU1lHSmtkaWRWWkFDTlBvM05WWTdR?=
 =?utf-8?B?andWY2lCeGcvdytINjE4MVMvdnE5TmZRREFRSUs4bFJSVjlvVDdPU1oxbXNu?=
 =?utf-8?B?ZHFTeFRPVzErbTRzNWV0SDJVcmU5N3JjUzd2bFBGazZNaVI3Q2I4R0g5SWJQ?=
 =?utf-8?B?cktoWEh2b296cU9XT3N2ZjNoUmlBM3ArYm4rcFMxOEJoekFZK3JqSGo3dExJ?=
 =?utf-8?B?Z3B5UURuZENDWXoxSXBwYTV2dGpIaHFqWkVDUGNsS1BPcU0zNUtoUWRwQklm?=
 =?utf-8?B?bVFnWnRtZ254VWRGaTg1NmRjVUd1L3VXSEgvL0VPem9VcWhJYUZIQk9NeWJu?=
 =?utf-8?B?MmlURDBTZ3N4Z2N2MVpoTDBxdG1rcFhxanNWZGptY1kvMjNSamU2NVpvL0dB?=
 =?utf-8?B?NnNYeng2V3lEWjRXZ2l6Z0NsSTJ0cWNKbEpkSytoa3ZHTU5OeHVuMkRlbEtl?=
 =?utf-8?B?ZFRVSEdtQkhXUElZUm83aFZzc0l4QXpiZjRSSEtqREpOVW5Pd0gyM0lpRjlu?=
 =?utf-8?B?Vnc3RFVhakg5cWZQcEhTeE1hZklzamFnUFM1bnphRFIwVm1BVSs0M3BiT2pw?=
 =?utf-8?B?aDlBODkrSTBRaUhOR1QwMm4vN2FldjBaNWg1RVh4YitrbGxlN1lVMnFpWTBq?=
 =?utf-8?B?NDA0cnduaWxZOXY3eHY5dFdqaHlKMWNTS1BQSmFPV2JjSjhEbkp3UDhwT29H?=
 =?utf-8?B?SHBqWlkyOEFGWWxXU05HTUxjRnpDMWNrakg1Y29wYWN0UTFSSTZHNXFzdWZz?=
 =?utf-8?B?VTJDTjVNNWNJMVZadUZjb0NSZmZPcmdGaWlHYjI0Y1ZESHF6VllidGN3WU45?=
 =?utf-8?B?SXFGd0xZdTJCZzl6ZUkxY3Z5Tjc2cjU1YVVqMDVYQnFCNHBjb0N0ZHJSVStL?=
 =?utf-8?B?MUVUU3dnTWQybTRYMHF0QklvR0RCSzFLRmVVN25ub3lQRHcxVEp4VCtuSXRH?=
 =?utf-8?B?bjJ5bzBDRXAxZjNwVFg0UHpNWU1kQU9ORlE2SzZ2MjZ4ZU0wYnNLQ0FJRWxE?=
 =?utf-8?B?aCtYVW5GNFJjVmI5Uk42UUZJZTk1LzhnUWo2akMwOVY2SlNjVEQ0d1FmYXp5?=
 =?utf-8?B?cVFUQW1WWFVubloraHhuVTgxYXg0RTQ2MEU2MGdYb0FEWGxXQU40dExZRTk0?=
 =?utf-8?B?bitJelFaZmlFWnArd2hZbDVkckVtLzh5aTBvMGN5T3VVSUttUTV5dXVIaEww?=
 =?utf-8?B?NGt0V0dDYVY3dUVQQmpORTJrNlZlVk5YSmlzWnRiM0g2a1pUOUZISFdWZFZJ?=
 =?utf-8?B?SnNQbk41bmJJbzBnbThzNGxQVmNSNWtzbGVUc2JaSnR3YjlKdlk4Ri9qOStw?=
 =?utf-8?B?RnlLNENHdjZ0V3RVajc3RjhlMllNMzFsK1RKaEFNUjViZmQ5RmVqN3RqVXNR?=
 =?utf-8?B?R1VGb0k0SjZ5TXlwTXYwckFwTkg1R1JLYUk2aDVqakVtQTZVMzFTZFNVT3E3?=
 =?utf-8?B?dFM2YlVtUGdqZUNlTmhicno2aElPMWk4bmdqaWI3RmtyRWx3Y3d6UlpEM1BH?=
 =?utf-8?B?SDFiclh1QVdqT3JNMHpWUWtlNGpQVTBSQURhTDZvb3NGVGRwejlsYnV2djRN?=
 =?utf-8?Q?ED3k=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?b3B6M01ZV3Z2QWdkNk1xaFdrRXUrYks4U1Nwc1JOSm5TMFBVakkyRTB0MnlF?=
 =?utf-8?B?M0krN0J3U0dWQTFjN0FMNGZtZkxnbDU1VE9PcmxkNUxqNjNoTDZvZEFTMjR0?=
 =?utf-8?B?VkRRRmpZdmVLMWczcitBK3BOMm15ajA0bGJPWHF0VEwwNk9tUjFPZ1RKUHZG?=
 =?utf-8?B?VmpkL0lCWUtHeWVPK2xSMHFSc1pvSGN4LzRnTGZZUklPSHJBRXhqNGgvRmI4?=
 =?utf-8?B?Y2ZsWFNzUVQ4WUxLaTZNY2JkVWV4ZE9iMU9nQ0luMmJhVnJxd25taGw3L1pR?=
 =?utf-8?B?dzZSNEJaT3V0OHB1anh0S1hTeUVlV3A5aDIwUHNSR3BtUytrQU43YWhiT2FL?=
 =?utf-8?B?VnFDWUcrVE1RVnU3WnBmenNFU0ltUkl6bXhVSjNDY2ZwZHVhNXpEY04xSDBz?=
 =?utf-8?B?Q3g2bjAvRmFqcnpUUmVWTXhGZEN2QVpxTXhDb1o5UXpwNWFkTFJZTDQ2VEFZ?=
 =?utf-8?B?cHhRYXlKekxKWVRUZDUwZGlCSkovWUhVeVZvOVJuRDg2WXo0YzRBYXdoRW5x?=
 =?utf-8?B?UGYvTStMTHhsYnFUWlk5RzZIa1U5NkE0T1VVWUthRUdHQjJCbTN4Wkh3TUF1?=
 =?utf-8?B?Q3FWNnNUeFRkYkdqczNRWUdGTzUyTlV6dzdIZXNjTDZDVjAzQjB2VUV1NUsx?=
 =?utf-8?B?aXNhak5SVkNJT3kxT2xuWjNKYnMvbVZNc3Y2a3FnTmUyVHBUajFySlJ2NEFv?=
 =?utf-8?B?Zk5UcDhkRDZGQnpjck00YzZzRHYySnVsQ0RLT3VrWjdYczB1U3F3R3FtK3ov?=
 =?utf-8?B?OUxBd3RNTjh1QkdHd0cxamRwSzhPOEM2VEdNUDI1RlNTbGIrb1RnVkdRbkdh?=
 =?utf-8?B?U3VzbEx2TEt2RUU1ZmVqYkNKQTFHL0dvNDJhek1vU25lSlNBSUJUVmFPbEQr?=
 =?utf-8?B?ZTBFWDVleEtYejNoZ2hJbFhBYlNOMjhMb0FOTWhpY1Y3a25YaThhQ3hGejky?=
 =?utf-8?B?aVJrZ0w3RnA3UGdITVZGNHpCUzhnWUZaTWdFOEFEN0txOEk0ZEt2WnpISng0?=
 =?utf-8?B?UFNheEtLdEdldlcwemtzT2JrSzR4Z0NEdmdzVmIzNXM3UzdHTVA3SnhKdG1C?=
 =?utf-8?B?dFhlMWtXbGZ1elZtczF4VUJKM3lDR1hqVUtYU0pIcnZ2emtQaVNyc1QveGYx?=
 =?utf-8?B?VW0xeVpDRkgzNDA1OWwxQjJnME5jL3FrclpIZFhqVkE5NFRQbFMrcE0reDNL?=
 =?utf-8?B?VHlydDBnQmpSb2V6L0szZHN5YXNvWEFTa2Y5dVpzVE5wSms1YXMzcEJVMkVs?=
 =?utf-8?B?RC82U2VDZGVNYmVmNllsNWVuNVlDRjNPRFlncWQrMm9NVEd4YVZqOTYrQnEy?=
 =?utf-8?B?bHhSQTQ3bnZVL0hxdXFOYkRqSEpZalR5TFdsdGN4VXJ1bXYwejY0cVpKZzdJ?=
 =?utf-8?B?NnRIRjEvT2dpMG1mWTZkT3d4dnUzdFlSWllXVzNHMVQvS016M2lCS0xIVFJU?=
 =?utf-8?B?a3Z5R3JjRVdkSVp3djBSNlh6aWVGSW5sb3VwcXRCN0pSTnBXTERuS2o3Qis2?=
 =?utf-8?B?ZDc5SVVuUTYrLzVhTTVWUHg5WXByZEdWSG5SNVBWK053U0dsY0Q0U2l0c0VS?=
 =?utf-8?B?OEFFRXIyakRQdFJ3QXhlN2ZkUWNyL0hWdmNWd3FmTmNIcjcrclM4R3EwZURZ?=
 =?utf-8?B?QkFIc1BFSEdIeHltVGE3VGZzMmt1eitGTHZVeFFkVk81Q1haTW5LTTRtNzVa?=
 =?utf-8?B?Rkc1Ri9nK2Ixc21aSzhYV1VTVEpFYld4eExPanpsdVJScHVvS0lXYktSRDht?=
 =?utf-8?B?c1lOL0NtMjJTMk0zazlBRXhzazRSc3kyU3ROV2Q3M3RLcm94eGNuSnExL1pu?=
 =?utf-8?B?QzlZTW52RXhOOEFOQ2RiR2p1OVpkTkVpRTlzdk94OWY4SXhuanBxSUN1NGpw?=
 =?utf-8?B?czB3Y2ZaRkRrQ28xeFhDZGFlWE53NDFlTW8wc3hhYytoWitvN1pSc3dYekgr?=
 =?utf-8?B?QVZMVEpZREcya1JJVjVNN1ZDRm9yN2Jlc2loc2kyaFYxNnZ1b3lObVhVK1ly?=
 =?utf-8?B?ODFmbzh0aTltV2prVHNpSXA5dmQ1ckU3ZEs2SDVNUXR1YzhPUERtNU52QjdM?=
 =?utf-8?B?WUVoeXI4Tm8yc3R6ck1sK1hVOXNuMHIwT1IyQmRXbU1uTkRuMWlWN2hTamRT?=
 =?utf-8?B?L3hicFN6Q0dYSXhqMENrd3orNDdwbVJqcHFUTG5UbWlxZHY5Y0NPcFFQY1Z2?=
 =?utf-8?B?Z1FEWThSMUJtU3JxMFNQeWtKNlpndXg3bG1ETlMxaVRKckFtejlrTEpSR2lO?=
 =?utf-8?B?TmNIRENvcVg0V2FuYm5ySU1TbzVnNDVEQnJXeXVlcUNqUVJra1U1VFpEWUlT?=
 =?utf-8?B?c01sOUFQak9PeER3WXNnWUZGSXo1NnhGcUVqYU1oNEUwMnVYZUwrQT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: ee10cdd4-7aac-4307-ba53-08de6e525228
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 18:28:17.8877
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vBZhpzGHA0NciSIQpSbeM6xjJqxHbprdkI1Cm223Gg2/Pj22PwPK6d+b4ytVndmWVdeDjYfcaApWdxkzU0F0bPL9rY+cnemSTRLY70NazYU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10629
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 17 Feb 2026 18:28:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8945

Hi Antonin,

On 2/17/26 5:16 PM, Antonin Godard wrote:
> Fix an issue reported by Quentin on IRC:
> 
>    The LaTeX files are in _build/latex.
>    Run 'make' in that directory to run these through (pdf)latex
>    (use `make latexpdf' here to do that automatically).
>    make[1]: Entering directory '/docs/documentation/_build/latex'
>    latexmk -pdf -dvi- -ps-  'theyoctoproject.tex'
>    Can't locate Time/HiRes.pm in @INC (you may need to install the Time::HiRes module) (@INC contains: /usr/local/lib64/perl5 /usr/local/share/perl5 /usr/lib64/perl5/vendor_perl /usr/share/perl5/vendor_perl /usr/lib64/perl5 /usr/share/perl5) at /opt/docs-build-tex-tools/tl/bin/x86_64-linux/latexmk line 97.
>    BEGIN failed--compilation aborted at /opt/docs-build-tex-tools/tl/bin/x86_64-linux/latexmk line 97.
>    make[1]: *** [Makefile:28: theyoctoproject.pdf] Error 2
>    make[1]: Leaving directory '/docs/documentation/_build/latex'
>    make: *** [Makefile:74: latexpdf] Error 2
>    make: Leaving directory '/docs/documentation'
> 
> We require perl for the latexpdf target to complete successfully. Add it
> to the tlmgr_docs_pdf.sh script.
> 

Could build the latexpdf target with
CONTAINERCMD=podman tools/build-docs-container $distro latexpdf
for almalinux:8, almalinux:9, centos:stream9, rockylinux:8 and 
rockylinux:9, so:

Tested-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

