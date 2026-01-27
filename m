Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05A19D2F023
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 13:07:20 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10615.1769519230117000648
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 05:07:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=UyqrjgMm;
 spf=pass (domain: cherry.de, ip: 52.101.70.28, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AY+T8TipyOB/i8cBAbsRWzXnq1bRCKfW5+XadZgKnrbhyrxTDcIjfpyeCoJ+hWGu4c2JboGLgoM6gOYwTxPOtGYlE4PEXfFK+oe7qkJfPDox79/VVxQwtDmzQsCrphnb1XrzBHdnkwC1knmLW/B5yaHKZmehAlIPvurP+q+CzDVjg4/b5O3IFc7uBrYFGqDEnylTWFSyjAZ82lfSKRxHXbmMVbgdrvtOhrv4LfNKQ7JXB1fMAY5UG0U1TVdYtRdcr8GRRKSDpyIkvddy0KDx037GbXig6VsaF1YUedLKHYlsnWx1B53Nd6Dvgx5uB7Odh+o4piCUyZN9QK81Kjo8cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bxb8dpPvOlqiCHpcnrm+jzItC9muqK8boKUnUgPf9Oc=;
 b=t7Kgu/Dz93bKuoO87y2mM5WiHIYTguxoc7223/+XgffTRyqZ7OjDBpG1aS3Q1miadN5ID6sQhTj4byyl63eFRONdmudnVaLM+uMSbHpEHjJRsH/ra5MTScY/+tUlZRipuN3ppnIE7n41MBjIgiUa80rAkw0Nh32d+za54Y/xsB6Pkau7kyO1Zxb02iTIMVOuQMx0Mmwu37b/30ffiZE1YqqSj0Pm9M6wG7tqs00+eHIoWy2mhhkXViFPlrEdxh2TiAsa2+cmoYRymipvm+Zqv+MWITpuLDPJykNhyOfpBES0T1vlLPw4b5dTG0t5sdt+JweKV1YXxHVRv+PCzQxNGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bxb8dpPvOlqiCHpcnrm+jzItC9muqK8boKUnUgPf9Oc=;
 b=UyqrjgMmRHioobmZSNIqvcNRnAGE+e7Q8WcuHhfiMcDkMUnIfqWktl3RTpTkJiwr1ei4bU0I7uC+8EI41+TqS7ELcC+EsqiueH4cIcyfg5XkY6eWSuxc9ur+lVCqKHbUIjDp4eTP0yrHpjV/sg9BxxbY1X3yGHOjZNH5zRw9PGE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by AM9PR04MB8617.eurprd04.prod.outlook.com (2603:10a6:20b:438::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.9; Tue, 27 Jan
 2026 13:07:05 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9542.015; Tue, 27 Jan 2026
 13:07:05 +0000
Message-ID: <8f2ab126-291b-49ac-ab0f-1395ee014f4f@cherry.de>
Date: Tue, 27 Jan 2026 14:05:50 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 05/56] kernel-dev/advanced.rst: remove obsolete
 poky repo references
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
 <20260127-remove-poky-references-v2-5-74bf80cc4e5a@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260127-remove-poky-references-v2-5-74bf80cc4e5a@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0221.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e4::18) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|AM9PR04MB8617:EE_
X-MS-Office365-Filtering-Correlation-Id: da873105-5496-4751-f8f3-08de5da4f807
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|10070799003|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?aEM2WEJJWVlXZzUxMmlYY2k4VDNzb1RBMWxyZjRGT2Q5eVJicGNTVjV6amt4?=
 =?utf-8?B?UlBKVHhXT1RlaWZhaFNuN21JaXVTM1d5czltcVlFN0p0YitXK1g2QnVGeGgz?=
 =?utf-8?B?U3R3TEttVzVsZG55am90aEtzV0NHOEVPemRRK3E4eTNYYlhEYzh3aXVzdFFy?=
 =?utf-8?B?ek52MUgwSVdOU3gzN1pvdld4MEs3emlwN1BzTmg5ODJVc1RZTHd3eHNza2Fp?=
 =?utf-8?B?Z3lTM2VuV0tVSk1RRXk5U2ZnbDZ2ZkttYVU3dUJKWjFGMkQxT3h0elREMnJs?=
 =?utf-8?B?RW5LeWpPWlBweXpOdGpuUWxiWnRRMTVIL1pxTlF0QWZHbUt0UWlkM3RLQWdP?=
 =?utf-8?B?c2pkRlQ5NS84eDdDalFFV21USUhRVUlSSkFFUFRweXlNQlAvcE1TV3dvcnBL?=
 =?utf-8?B?bFdtRjBLTjNKa08zWUt4UDhBNytkV2lvRC9RdmE2ZUlxMndjMDZ4WDdEL0Ur?=
 =?utf-8?B?RTdtZ0ErQVVnMDhaZWhPVGwvZXFhK2pobU1sb3RSYUU4dGpzZkJRdlV2TWhj?=
 =?utf-8?B?QklMMVJnZkNKUGNTc0swandxRDlFM1JCclZXOXYvS3Q2UlNvcDJvTWNUb0dX?=
 =?utf-8?B?WWFUeENsWk1zbWNlSHhBMk5KUWhPSFlqQ0lsL0pvZjVVMjVLOGVlajYyRUEv?=
 =?utf-8?B?amU5Z2FtMjdwc3dxOXh5MFRKcUw0L24rcm5yTjZ1S09udDlWQnNhc056WDVV?=
 =?utf-8?B?akk0emR0MEtCV3JoVDRDQk5FenRySzlPeVUxckpIM3oxRzVlZHVOOE5xL1c5?=
 =?utf-8?B?YXdocGZvSDhWd2wwYU92c2ZQeE4zRkJVREtSQTBRVURibUc1MVprWVc4WTFq?=
 =?utf-8?B?bGRRUXY4SnEyVHRDbi9EVlhUVDFkMFA5cHlJcithV2Z3bmNsbHVJeUFJdnNK?=
 =?utf-8?B?OWQyQzVBS0xmcFZCZDVWM1VSVVRjdzVOWFkyTXdqNm1HVFBsNTQ1emVFRFU2?=
 =?utf-8?B?R3h4VjE5ejI3eDluNERDQ0s5aW1XS05vaHVlSlNBanBVNnNtZm1zL08yUEtr?=
 =?utf-8?B?Wk9SOHBDN0VyQlFINTNYNEptMTNlYXoyaXJDQmY0d3c3S3crdmR2OGpDRVJl?=
 =?utf-8?B?U3NSaUVvSkNMM2NBdVh4enlmdmlXamI1dVA1WnlxazYwc0l6dlUxUnYzVWs1?=
 =?utf-8?B?ck9UdUtFejh1a0wvVytHeCsrV0t1T0xUZUlvcHhRVVQ4MFRNenY5eWZBcEVW?=
 =?utf-8?B?RlJHOUUxYXRLSGJWVW5BSk1ENTBUdnJrSzNzcEdUbk5LWGhKNHhueGZialA5?=
 =?utf-8?B?Mkk4S0h3Y2c4b20ydmZpbk5HcVdQWmpUdmxHMnFFRGs3ZU1nalNFK2dYdyta?=
 =?utf-8?B?Y2Ryc2NUZW9WKzNVT010WkpLTVIyWFpjemxiNVc5OFh6R2prdDhiZExvdVpj?=
 =?utf-8?B?M3FVMTk3TWZoUERkajdkMkU0WEVxTjM1Vk05a0E2SWt2SmZRckZqTkhTK2dP?=
 =?utf-8?B?NlZINDVpMk1MdGtJc2JrZ1hlOTFDT2dodE43N1lJbjNaUHFJZnN2aGxqWS8y?=
 =?utf-8?B?RHlJT0ZIR1JFUysyVG8rMU5YT25CMmZKVzdFeHlwNDZEZmlXYmFNeWdrUTdX?=
 =?utf-8?B?M3ptVkN1Ymwxc3BlTFM4NFRKcUFxYms3OE9IY2oxUmZxZjdnZ1BUaUkyQkNq?=
 =?utf-8?B?RXJvVjZsUU9tZjlHSlVVT2RZcEFIcmQranptT2x1TENXeVhYMUVpSzkxZzBB?=
 =?utf-8?B?QlZHekMrUWRMdFpheFlCMmcwb2o1Qzl3TGZLY0E0VVpPT2YxeGVRQ3lPbUkw?=
 =?utf-8?B?d3hBMkdYVzRlNkxvamh1MHE0NWFXd3ZUbGUwZ2cvT1ZNTmxIRTdESnlPOTNT?=
 =?utf-8?B?TEc1OUE2Mm9sU2JMOXErcjlyb0lsS1VSeTVuTGNPWFlxcUd4ZUVJQ0cwcElo?=
 =?utf-8?B?cTdkSk41cXZhY1o3S3N2S1AvZ2l2VlZXWjk1cW42dGdjMzZKQ0JtQnA1aEhW?=
 =?utf-8?B?SnhDOG5iQzRYSXZCWk4vbzhDT2xocFEySzM1SVVPM1RIbG1VYXdQcFY3UTRt?=
 =?utf-8?B?OGZLTThsRnBKenBtNDVoN2p4NU9hTlpuQm1nWUxLTlc3SDg4L3pkWDFQVkJr?=
 =?utf-8?B?MXBPaTEzdTVsMkRydWdjSno5RTNRMmxwNU5RNTdhbHdOMXhQL1pZcHREL0d6?=
 =?utf-8?Q?Cdr8=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(10070799003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Ny9BMEtQdkQyM0xkTnp0bEJCMTM4eUFDOThaY05QZzgwK00rSlpnOVlxem1t?=
 =?utf-8?B?VEpEQUpKZVgxRGVnNHpVMEd3dWhIeFpKNnFiVVZSaURZVzFJd2tKWkU2RWRv?=
 =?utf-8?B?UmY3MXRlbXlyNG5HZTIrTk5mRzMxRk1lZGVDYld5ZHlXbU1PcHNiY1RzOVFC?=
 =?utf-8?B?cWUzdjdkbXVwbTUwQ0Evai9VYkFWVU1adk56RzFKM1lEOWVJdkxwSjYvWEhq?=
 =?utf-8?B?cWRoRGNlekE2eHRFeHR0UG9MZkhFZ0RaSHNDQmxVYVJVT1FpeGZ4Vnk5dUNh?=
 =?utf-8?B?ZXI5MWprdEJkTy9CRWIzY2hWOTAvK2RiVjRBVGt3QmR0VVFBRWMxemtNQVNl?=
 =?utf-8?B?TEV4Yjkxa1lTK2tKU0x0RHBSZDNROVd3ZTh5TnFnVURpMUxOWUFlczJMM1kx?=
 =?utf-8?B?dzFkSk5SUWprbTNVWjJuWGtKU3JaOVprM1VscWhlWHNNZGVpN3QzbGMxOUd1?=
 =?utf-8?B?d09VUHdYUHpUampYcmRBUHg2SThFZFk5MDZpTktUNGNybFpJek5SWU5lb0pN?=
 =?utf-8?B?TzBKWkNBVEtYREh5UGh5dEdGbkYwdXJPTXNGTncwUDdNc0djL0lsSkloQkxk?=
 =?utf-8?B?ZjFKOVdhTGg2RkZVZXRlV3VTdVQ4Zmw2ZmpDdWprNzBPNTg1eUN1MWZ3WnYr?=
 =?utf-8?B?ZXdiTGo2VFgvZjFaeVJhUnF6MVNWdXBTZVRkbm4zaStCd2t6WUpEc3A5Mloz?=
 =?utf-8?B?bDc3UThlZXZxdzV1eXU4RnVIUGdxOW1UZ0lVcU0wanlRN05JYlR0NUt5SFlX?=
 =?utf-8?B?cHM3UGJQT1Z0Q1pLbkhFSVh2OE00UkhIM2tQTlFxakE2cVFBOXJrUlFKQVRx?=
 =?utf-8?B?UzdYdkg3dTFQUHJEZGlYdzRNU0RpdWhRVXM4aDJtekdqYzc0d3NIQ0F6ekJX?=
 =?utf-8?B?ajhvMEpZNElmSXN0LzVOQnJsdUh6d2lVWVdTc0FPQmFqam5xZCtoZVNmQ1c5?=
 =?utf-8?B?cGRBazQ1SDdlUVBXaVFWSHFxNWZxdm9ESW41eFZHdVF1cktVREtXbDJESU9R?=
 =?utf-8?B?TldlWFRtanhDSHN6K05KV0FITU9vc2dsemlBU3I2T0tZNU5jRlNxTFFVbFd6?=
 =?utf-8?B?RFhYRElDN2twSU1PaGM3Z1lNeWVPN0hkLzFMRmhEY0VUN2N2T0x1T3dCMDBq?=
 =?utf-8?B?VDV1ajRRN3ZMNHFMem1obSsyRUFOaUNZem1vMzhYZ3RWTytRcU5lL2dlbGxM?=
 =?utf-8?B?TjlhUmg4dWI2RWlodUIrMnByeDFUclFjR2RqN1FBamQwcjB1ZldBVWx2d2ZV?=
 =?utf-8?B?RU9pd3F1SWtraWMrM1EzTzJ5clVSaG1SOWx3cDZIL0U5YVVOdldlWGZnK1Q1?=
 =?utf-8?B?ckdwTWovNUo3VEpVc2NvZ3U2U29MaEl1dkpvVHZEdzR3eHY4NDJtUFJUTmZy?=
 =?utf-8?B?YjZVVFRNZ1p6MGJOU3dTR01NMjRCRC93OHhld01QOGpQdmhiRDRWSGI1c1JY?=
 =?utf-8?B?aXpTaDR3YW9CYVZ2NE5rdVIwZzlUWTdvSlhDODJNbnhhM3pOblR5dmRxWGdv?=
 =?utf-8?B?WXQ2dWxNYUJjcnByeWl6VGt6dnBzT0ZWekZPYjZ6bUNaOWpRY3NHbExMMEs1?=
 =?utf-8?B?K3laSHF1aXdLd0dCd3pZaCtvWGJwaEQreFVtNU1NQ2hNVFg1QmpBdnlIQ0pS?=
 =?utf-8?B?L0tQRmllcmZNMUNKZklSRWpQZ2twOFZEVnN0QnNSZk51TEUxNFY0ZDV2cXho?=
 =?utf-8?B?aHdzUzhYS0lFcW1UTjdLTmlvci9xM3FScExhUTZsSGgzQk1SSkV1eFg3UlF2?=
 =?utf-8?B?ZkVGZlpDUm9Jck03UC9KOHh2Q1pVazVzRWg0WFJOVHV4aGxWVTFzMlNmNCt4?=
 =?utf-8?B?aEZlc3VtUUNtRWRZTzZWbjBqYmdGdU5sTDFtSXlHYzIzdjFqWGUvdU85bjdJ?=
 =?utf-8?B?dW9IMEdnYTVLem0yY3ZrdDJ1RXM0TzF1SGlUMTJhZU9ETVJOWFlHTWs5cTRR?=
 =?utf-8?B?bE5ZeTg1ZFNodG1NeWUvZEZpUlh5ejBvZzBMWERmZFBQTjZrZTR3cy9MU0ha?=
 =?utf-8?B?eVl5WHpaSkd0bFdMOWRpOE12c2wyYnluNW0zQjNjay9aK3VsZU1CK0ZkcHp0?=
 =?utf-8?B?bkY2MHVVeWszN3N6QW91NXVINnlOWkJHWUNMYU9hcHVXK1NMTjNpUVREejRY?=
 =?utf-8?B?eVFiNFd6QnFlU0lKTmt1b0pLdC9NNHAxOWViajV2R20wbGFya2VMczRQOExk?=
 =?utf-8?B?ejJLSU1aVUlPNTg2V0FHUU82WXRtRzh4QkJXb0tIRkpMeGd1M2s4dTRmckx4?=
 =?utf-8?B?VlFLMkdoY3NKQ3BuM0pQVmxVT3dIeCtPSGFPeHBmeUhVNlBtR3Q4cDJ6bis0?=
 =?utf-8?B?ZzNsTXZGK0ZSM0cvKzZVS3ZDRUZWdER4VUJSaTl5WEpMVnhxcG9adTNVWTFx?=
 =?utf-8?Q?XGB7LOEAyx9K3InpHlqxqTDCObIKlNz8UHTir?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: da873105-5496-4751-f8f3-08de5da4f807
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 13:07:05.1828
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C+ZI1n9AsoJAzL7TzDjIBDTBfeMrxCZ4i0eHzm/SgcNSP/ZrU3GoQ32XVGgEpUFpMnyoV6/j8N3OuRvX+mUbS6AfWon7OA/wUF5HuU7z6NQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8617
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 13:07:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8736

Hi Antonin,

On 1/27/26 9:19 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Remove references to the Poky repository, replace by OpenEmbedded-Core
> in most cases, and refer to bitbake-setup or the manual setup in the
> intro.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>

This patch seems unchanged since v1 and had given my R-b back then, so 
adding it again:

Reviewed-by: Quentin Schulz <quentin.schuzl@cherry.de>

Minor comment below.

> ---
>   documentation/kernel-dev/advanced.rst | 12 +++++-------
>   1 file changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/documentation/kernel-dev/advanced.rst b/documentation/kernel-dev/advanced.rst
> index 4c463503f6..97cb663222 100644
> --- a/documentation/kernel-dev/advanced.rst
> +++ b/documentation/kernel-dev/advanced.rst
> @@ -24,9 +24,8 @@ grouped under the "Yocto Linux Kernel" heading in the
>   Kernel development tools ("kern-tools") are also available in the Yocto Project
>   Source Repositories under the "Yocto Linux Kernel" heading in the
>   ``yocto-kernel-tools`` Git repository. The recipe that builds these
> -tools is ``meta/recipes-kernel/kern-tools/kern-tools-native_git.bb`` in
> -the :term:`Source Directory` (e.g.
> -``poky``).
> +tools is ``recipes-kernel/kern-tools/kern-tools-native_git.bb`` in

Could use a oe_git link here.

Thanks!
Quentin

