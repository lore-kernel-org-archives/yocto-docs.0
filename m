Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFB61CA5FB0
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 16:44:57 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.7])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10800.1768927488127565817
 for <docs@lists.yoctoproject.org>;
 Tue, 20 Jan 2026 08:44:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=FnMsX/80;
 spf=pass (domain: cherry.de, ip: 52.101.83.7, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XQtY0OU5g+gq7O3bPGGvJfyqtXT1AjLpMP1NIAQ2IpCvDBkTqi97oSkLmSNxJhiGGpKDSBBc+fkLNNm38zsgnO8BpufAu6sKHzcJNHhaguybdncCGnp9Z3erlPwuuI3vgigsjUR4A13Co3drv0IV1Ybp4Tm6E45rwd8F+D0MHfi1pJsoCJ57n6DmQrX6b+a+UZ+ahj+oosc3oHQ3B6k7I2eWd06/nL2nG5YwHAwDs3QocnGatHiPMbfRYVfw126pcT/syZsQ8Fogh2AUEx1rCBrM81NXY/8m9ZwMvb9ygV0cG2rDy4qyGsx7ZnJlAW7zOZMyeUxLVDuJTmMaoAP+/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M4yrNzj8WJlz2qG0Js32ScTAR1knogaMAVKeya34Bq0=;
 b=aOS/Q6Wj84LLzDxx5EzRDdc+tRExQ7MmwrWKMI7cQMJ2r+8Ctqw73FJajWLkshcGwLHdroNHF9Q7geegtyD7RUOsuSOyZX8UGMbBdkvyyDqVL9MOh0PdWMJgTt5gHNbd9BdjO/MftzjQLLU5/zMTcjjSedSq139ST8W/OV0SUfU0Wx7+Yg/NVOF5IvtXNR5e/qT1jIgE6FtFBVuWJyWQl9IJj8G2rwRLKtfXgny2Z/Z174k1DilIeXJMVhKePKMgoUtT1DY+Iee5X7oVrxrDNqlHjo+3nkjws5gkNCi19KAPi+zjk0q/RQaPAdVO1CNQqrUG+wuU6YfHSOWHch796Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M4yrNzj8WJlz2qG0Js32ScTAR1knogaMAVKeya34Bq0=;
 b=FnMsX/80/gTcWrWHCgTY1L1OL8uL2BlE5A4u1MuJMkz/xYRmw/Lccpxkt2bWY50Gd9X4lx+iAKWiIWTTveBP2m+kcon3Wi8KBpu0+RyGvPZ8Su3DKomlW6Wx12y7HaBqOCihUeFTnurPWzW/8OOLuQWjrjfm1UYA+t4FlInofq4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by PA1PR04MB10368.eurprd04.prod.outlook.com (2603:10a6:102:445::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Tue, 20 Jan
 2026 16:44:43 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 16:44:43 +0000
Message-ID: <8d17d4e9-3d3e-477c-99b4-0303495067bc@cherry.de>
Date: Tue, 20 Jan 2026 17:44:39 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 4/5] dev-manual/poky-manual-setup.rst: mention
 the Source Directory
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260120-terms-refresh-v2-0-fa49d15b209f@bootlin.com>
 <20260120-terms-refresh-v2-4-fa49d15b209f@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260120-terms-refresh-v2-4-fa49d15b209f@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR10CA0110.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:28::39) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|PA1PR04MB10368:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e9eaa94-b7c4-47d4-c6f8-08de584336bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|10070799003|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?YzBUa1Zva0tpbVUrc3JldHVCQ2RKb3ZEZmdGYzJabmxiS0N4VlFGaklvOHFh?=
 =?utf-8?B?djl4SlBhNi9IZVpWekJYTUd5R0JxUCt5bWtIYUxZZzhSajBSVFVtMElXWkhS?=
 =?utf-8?B?Qm1rZUFucGYwVWFPVjZMcUg4SDNvZE04U2lRQTZYU1hiV1FNMjdGV3BlYUp5?=
 =?utf-8?B?L1hTLytFZ3pRcHRiSmZieDVZL1A0L0h4YkpZeU14N3FZaXNIRnRzZk02RjQy?=
 =?utf-8?B?eVpUVittZUcweDAyMUoyc2cxcFNHUEFyd0VGTXJ2clVkM3lHK01CeUNqQk9O?=
 =?utf-8?B?RUhjUjZrUTdOMHYyQ1lleWVNaHEyYmFCRXM5OHdBQy9oUEpKTWlmdkxLM1Ja?=
 =?utf-8?B?dE5BdGJWcCtqRGl5YUorcGx3TnhiOHJBUFR3Zkxrd0hRbENZd3NGaFhuNzNX?=
 =?utf-8?B?VXpGK0QxSDNNTGR5Ui9pcHMxditVQk1QT3lDeldabkdzNDhvMEhXRkJzZjRu?=
 =?utf-8?B?ckN0YUl3SjEzZHdzNU9yNlVMVlFnR2dudzRMMTNuLzRvTVlYaVZINVFQNHVx?=
 =?utf-8?B?aHZMbyttMkRFR0o1V0RVU2lMaEhkdjBITE5ORWt4MlN3MVdCdWF4ZzhlU2Rr?=
 =?utf-8?B?U29TSUREU2U4cGhERy96TFZ5MlBNM0pCZ2RXQURGTVpLZTlnYUh2enNrWXhi?=
 =?utf-8?B?cCtWZzdjSWEvSlkxL3hEeWVaMVE4THd4UkxmQyt3Q09nMnRFTElTWU8wM0VD?=
 =?utf-8?B?d3phbU1PbEtHREk1RUoySERMc1RCOU9KZVE4R2J6MzhTSFhvWGpkTzhIWWgw?=
 =?utf-8?B?aW9SWXB3VmFhRnVIMVZWK1pPWnpCWWZtTnIvY21qSVpteXJ0ZFVIMnpsTTNK?=
 =?utf-8?B?YW4zUFVTc1FFMGxCazdad2ViTHlIRmRhdmhNRzdPcys4RC9SbE1TN2d6Nzd0?=
 =?utf-8?B?NzlMeCtuOVdMRGZWenU2enZzT0FqREttOWtlbms2ekpIcVU2V2FXMDlkMncy?=
 =?utf-8?B?d3ZFam10WlM4MTNiNkxwZDAzbFBFRFQwTHF1VlpXVXYydTJDQmZwMmZ4SmRX?=
 =?utf-8?B?dnlvMWVBNExIdUlHZ1BqT3dMYnVCekg5YW9SbUxUSGtOM1M0Mm9FdFlWUm9O?=
 =?utf-8?B?c0RFVFRBcmZOclA3eHkyUisxSExHK2c5RVFoWDZuY2Jrb1RPdWhxdE10NndX?=
 =?utf-8?B?eHVWM3F2cHBPTi9zL1B4bk83THdVeXphUmpJQ2MyeXZXV0JhRElSVUs4TmdV?=
 =?utf-8?B?SzVsS21vczhLWlVqT2dLWWJxYjkrZmQxajhNYklNVXBsRFh5Um8xYWYvSnps?=
 =?utf-8?B?cWFTc1F5WGQyWXFYRUNhNDR1U05LMFZ3bWR1WGI4clUrVVBKYVUyUjNzU2hq?=
 =?utf-8?B?cnlYWnhxMXJxUEM2OEg0MnQvQUdTbGcxRXRENDBDNFdMSFFrNHBIb2pObXZ6?=
 =?utf-8?B?elMwYU5MVTZFcG01OXBFQ0MzczU3MG9GeGJ1UExDazlwVk1NOEUwWFJLaFRQ?=
 =?utf-8?B?dFp1bVdUckIrSnBRUEpWaWQvN3JWUFp0MURWNHZaQ2RndmhJcnlpbTFXZURm?=
 =?utf-8?B?THBLTnN2bXBxeGhFL1dUNlR2RGlOTzIyZjBPcXpWbTVBZHNaNUdZbnJraDFn?=
 =?utf-8?B?OFVSYVZYZ01nZ3lKZyt3cFpqZ0lvMnV5ck90aGlSUUYrMzdMK3ZEeXl2ektH?=
 =?utf-8?B?Q3JlQWVyWU1QQzd0ZFNvYytyYlk1MTNvOUFGWnM3Uy9qOERHU0RiSTFCaEw5?=
 =?utf-8?B?NVlKRnV3UmdnSEFYMjdHc2dXL3FuU290RXh6TnhpdHV0dWpWQ0dSQUJnREFq?=
 =?utf-8?B?b1o5TWR5UW0rVk1nSmRSTXZxa3VERmNnSmdpZkN0d1FJMEI4UUdld1A4UmxL?=
 =?utf-8?B?c2dGKzJzdHZybFJPY0hjT0hmelFhRlhFaEwyOWw3bkVCQXB4RG92L0EyaFF5?=
 =?utf-8?B?VEw5L0pjK3NWWVdwQ3c5S1grRGRwcUJjRWJkMTdTeWxKVWNUQ1hMTFBxVUpV?=
 =?utf-8?B?NzdQZjF1RmZDdWVRL25jYmV6NUlPV0Z0VUE0Y011M0F5VWhFRFYwNFBPRElk?=
 =?utf-8?B?OGd4T2VsS0dHUkExaGR3YW04RTBIc0dWWjVHY0NhT0JhQ091Q3JCZG1WYk8w?=
 =?utf-8?B?UkVyWEp2d1prOXQ0TnFRYXFTSElyZmxMMFRTRjNkQTlWcm9jc3h5bC9GRHVq?=
 =?utf-8?Q?Q0lQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZjVzRjdYWG1PVEFWVWQxSFRRMlc4b0tlbVkvNExZb0Y5azdocU1jLzhkbGRv?=
 =?utf-8?B?UVBvVEVSZlV1QWJpbk1Ga0swQ0dQbDFZTGY3QUNJckgxb2JoY2hpemg3NGZH?=
 =?utf-8?B?ZGJDTXBMSlRoNzB5bGZHZ0pmU2xLcWdxSkg2M2xPdlNkMUhtcC9aRnExTUR0?=
 =?utf-8?B?ZXN5QVFieUlzTGhPKzd4R1FEUzYydWd1TDNITHl0ZWNyVkdrN2hUeDNGbHZV?=
 =?utf-8?B?amlqdFFZN1g5MEpPTjRYejhZSDFUd2s5TjlmREFWb3pqNVUwMVJ6QkR0QkVz?=
 =?utf-8?B?R3hLbmQwdmlJSzA4ZzdZbm5NYWxpUEV6VTl6bmtKR3NrMGNiZVRpMzZ3WUUx?=
 =?utf-8?B?ZlhtbnlZQzkxc09Wc21KakttVGFaM3NLWlE0RnVLYjYrY1RWU01HVFAwVk9a?=
 =?utf-8?B?cGtabkJGT1F6MEl4UThuUk42Qmg1OFNudnl5RDV3RkJUaHJxeVB4NllIcjRw?=
 =?utf-8?B?Rm16VVdQdUdtekxoellMZDI2TE9qWHdHckdMaFEybkY5Y3RHVU16VCs3WUJp?=
 =?utf-8?B?Z2MwWEFqRlFWMzdHK2xJdUlLMjhNNnR4UFVXeDFlQnBvcVVvMTl3MVZKY2VR?=
 =?utf-8?B?Z3pWR3lIMEFUcHh6WE0yUytzL2VLbko5Lzl6OXk5TmIwTFRrQjNHZDBWT25P?=
 =?utf-8?B?Zm1SUjJXQ3RHdzZPZ1RZa2Q0c3k0V05aWlU1M2tXanBCc0lJUjh4S21XMThW?=
 =?utf-8?B?aGFjVW9xYjRlR0Zsd2NFNGhNUUNYUTVMa3RZaWhIS3Z2cDlHU1Y4MVVXUXNW?=
 =?utf-8?B?R3R4eXp6RFgyQXZ2U25adU5BU1FWWFd5S2diS2phWjM0S2hUd1FUWkpwazNV?=
 =?utf-8?B?OFFNODQ5dzJIS251aFhoVFNPOS9wRTA3Qzh6bk01bWZONFAwVXR2OWx4VEtu?=
 =?utf-8?B?NjZSRFBoSVZZVHFTdGF1WEw3M0xXNm5nM2tJMTd4TEZqWWJpMUJ1azN2VTND?=
 =?utf-8?B?NktyREk4MFpVLy9UNHdYcEtNZzRsenBVQzFmTDUvcFVIK1FzUlFvVHlFM2tI?=
 =?utf-8?B?dVhib0ZUcmhSNlI5MjVUcWhaZFNkbDdLaE5INkI4d3B6ZEZTaGlxYzJ0citI?=
 =?utf-8?B?VVFtdTZZMjhuNVRqMEE3RVE0ZDI1eE5MbWlSdEpCaDFtVnltaTlSY0ZwVzhK?=
 =?utf-8?B?R25xaDlrVFVXenBXL0VzSlNOSG95c1lJazRoME42eTY3VE16WDRqZzVZUmdw?=
 =?utf-8?B?QlZFQ2IyRkZpMGFPN09abklrK0thYVRDcDU5bVVpanRYQ3ZwV1NaMGFaRUdp?=
 =?utf-8?B?dDRqRm0xMXF5NWhJV0tSQ3k5VnZtUmV3R1ZtSkJmdDhTaFZieUh0cjFtSlkv?=
 =?utf-8?B?cWYvSmplamg3M2dXajhVcFhic1NlSEVEOVg5YWtLaHN2aGVublBJK2RtbHJn?=
 =?utf-8?B?dlJSRm9yT3M3aXV3SUxRdGdLbUdxSTl2clZnNmp0NE5kVVUyWDRTQWNzQU1P?=
 =?utf-8?B?VDRzNHIxOTNpT3AwZFFjQ0xCcGNyUjJhOHlhU1ptbFVjZUdDRWFJVGxlRDJy?=
 =?utf-8?B?VHBVdC9MNDJ6bzFZNlVxOVZTS3VUSnZBYTkxczBnUDJGazB4bzdqYnp6b1My?=
 =?utf-8?B?Vi84OHJZSFYxcGdSakRUMTZtcDE3N3YyMUNTRUlpTHowZHdKcUJLVEZrblJH?=
 =?utf-8?B?Zk9YV2FYVU1hKy9DNDhIMnlFazc3OHRYb1lYb3ZGN1JQMFcxdElDeG1PbWhO?=
 =?utf-8?B?ekIzUVpqNHZkUWp1enV6TVp6Syt2NzE1QUJ0U1ZSRTFCUnArMVdLVmhicG5k?=
 =?utf-8?B?anN6Q2hDSXNxR21WZWMwVW9DSnNUMzJUTGZWZVZjbnRBWE5aZHpsajkzQUtl?=
 =?utf-8?B?VDBQSmI4QjlZTTBMZ3BRWFRkQzI1VWtDMVhDNk8wb3ZWcko2OUt3bFBhRkNq?=
 =?utf-8?B?bjRJUmM5UTlFTFRyTXlXcGw0bStQYmVheWh4OWRZRXM0aTJLYlFiYzd6ajBy?=
 =?utf-8?B?RFU0VlNjQlhxZFVMb0VQcmlrL1JpaW9wbEpoZlc0Z1pPS3QwOFpCcm15RFJQ?=
 =?utf-8?B?eFFnbUQwTWo4N0cxUnF0V2dsWUNQUllreWhlU3lyOUVKeWozSDk0NWxkZ2E2?=
 =?utf-8?B?KzJQVTduVEEyRkQ1YU00Z1pka3VzVGp3Y0huaFZ1TW45ZURlWGhpMlhJMnR5?=
 =?utf-8?B?UURwdjM3dCttNHNiMmxvWnN3eTlBc0JYOHFEbUNVUkVGUXJMemtjVDJVQ1JZ?=
 =?utf-8?B?VnZCVi9GcHNUenBZUWNGR1QwQndDNjBUVDdsOUY5MEVuTVFHUGtPMGFZMFBU?=
 =?utf-8?B?SUtWWkRxS3BmOURzQ2FGZmxsbHl1SWtHMkpzM3JQd1J2N1ZLRUFJMkpjbTVJ?=
 =?utf-8?B?YTMrYUtPQjBueGFENkJ4Qk10NU5lQTN3WUx5ZGRzbEZYcGx1NUhTMm51ejRm?=
 =?utf-8?Q?y1+4UZYCpd2z1++uJBwXFwzyTekffzol0W+IG?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e9eaa94-b7c4-47d4-c6f8-08de584336bb
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 16:44:43.8929
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z46RRjfHdEqe4VudaMT/Wqgx7i6oUVEQfvwjyXBPK+xIVe+8DIr1RAISNhYbC+jcVlC71q679M0LQMap395ARyxck2I9rFVTCYg4iVVsjAo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10368
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 20 Jan 2026 16:44:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8606

Hi Antonin,

On 1/20/26 4:17 PM, Antonin Godard via lists.yoctoproject.org wrote:
> After switching to the new definition of "Source Directory", i.e. the
> base directory for your project (which used to be poky), mention it in
> this document on manually setting up the layers for a project. As stated
> in terms.rst, use "project" for the directory name.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

