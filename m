Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDCE2D34084
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 15:29:50 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.19])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13891.1769527784971351728
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 07:29:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=CDlygMdv;
 spf=pass (domain: cherry.de, ip: 52.101.65.19, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FOzLly/WAyE913RJU9Mr2jY9en3BOMno+ZtjyYmKFUWvx76omFLqjl59O5knewK9zlUDvpEL/eLr8QDpNKzpt6CAJU3gHzFddKnN4wzd4CyCe7d731+a7PuKkgahA296DlBez/XH+E8qu42MYchN0fCz6LtvZdALD2bpzxoIrGMG4SBcEmeoZL5NzuZeDTixlHmarK1hUmNOrzlFcC1wrlhKVKyktSUwuopYJ8lBdOS+tpTe0K/D8qfgG+yHX91kkgLFfrks01+5JV4Dd5OOOYSiFDTUJwsjBvp2bxYcv9QMt0+fHcy15BPtvK6Ra6jhN2MSLQdrtrXsAvE293HX5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kxjPefFsiawfGVxbuE7pvRQ/0u9MBzcqKgdNbZ4KfcA=;
 b=Bl8FvV685jhxUrwSEZbFgl00ccnvAQr2PWReDITXuy/quRkKgxDyPJSYu4ni2MaGcw29EZeFTbnJoFCUUDY07Hluve97zkLn6G6xSEtNELqMEYNVgLmovL9scPkIkgulq52vFrBzjoxmm8BOHowYYMLmTHNMXIi01Ye+iTqzsttp/lsy1saDYNxhgVCvurOOTv0mHSEyHPq+amhp1ozztXY+WTysFXV8fEdSGxC6MG895cSRuAnXeLPK6KfmJvUEkbQTf/GCttSOm9XWoXmuf13tEXFIvPxUPpYaSMqJ+gj2Os5gPmCiSe77GP7URx45oUiasr7b4zJtp8hVDKNvLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kxjPefFsiawfGVxbuE7pvRQ/0u9MBzcqKgdNbZ4KfcA=;
 b=CDlygMdvvOUhBZXGQY8G+21afl1DRpu1PGkeygKcBZMEU5ndDIoRKKVT38WN4Chdgyw7lzQgey7qSaYaO3SH36UdZ0DegshVBtdCNmo6wkOCXSLUpJOr7XZDrdaXn+E2ge+WlDH5n0oREuwWMQJvv0r0qn70+zeptiZy6wh7wjg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by VI2PR04MB11026.eurprd04.prod.outlook.com (2603:10a6:800:279::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 15:29:37 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9542.015; Tue, 27 Jan 2026
 15:29:37 +0000
Message-ID: <d1904850-a560-4568-9b3b-6ce1defebd49@cherry.de>
Date: Tue, 27 Jan 2026 16:29:21 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 12/56] dev-manual/layers.rst: remove obsolete
 poky repo references
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
 <20260127-remove-poky-references-v2-12-74bf80cc4e5a@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260127-remove-poky-references-v2-12-74bf80cc4e5a@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0232.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e9::13) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|VI2PR04MB11026:EE_
X-MS-Office365-Filtering-Correlation-Id: 7482de35-3414-4fb2-9811-08de5db8e170
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|10070799003|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?U1kwcDRrVkkzRFJOMjdHWkw2Rzh1UWp6QkZwdUZWY1gzTzlsNCtaaHMyeENP?=
 =?utf-8?B?ekVCV3dxTU5kVVNEdkN3TFhTVXFIa0R0WE14bkhlVGF2UzdjSy8wQXkxQ05H?=
 =?utf-8?B?WkZIdEhVUFJKSFdvODVDaUZBcTBJZ1lTWmZSY083cTRsTVVjM1I3RldLU0NI?=
 =?utf-8?B?TjhpMVpSK2ZSZExOejR0S2g3TU1nU1VRdzFsTGkwQWFYcGllNXUvU0tTV0E3?=
 =?utf-8?B?aThCMjFnTkxVdFY1cU8weGJvUXd6RjdRRUM5OUQzaWZCMkxyOFZNbWw3Vzlw?=
 =?utf-8?B?WmkwNStaVEN6VEtOTXdvRWx4UjM0L3Fwb2FDdExWcktmZHZ4UGxLUXRnQkVH?=
 =?utf-8?B?aElPdUlxSGY0eEdXZCtmZVRwNnFuNGZhY01mWmNKMURRK3dPa1VieFhsZmZS?=
 =?utf-8?B?ampTeU56am13L0ZzTnJOTnNVSDZnL1hnK0RKSEp0eldWaXlyZkxPZGtzTHZY?=
 =?utf-8?B?dmxIMFFIcmRvbyt1bHZ1a0h0c0FxL3A1Q05DWkhwRGY2MEFxNXdSVnM0MzNO?=
 =?utf-8?B?LzhMSVdOeWxSSXprbW1RTWQxUnNEK3dHU2k5OURRcEtRMnBvcHozL1hnZ2tq?=
 =?utf-8?B?VjJzN01DbEh4ZlYybTMva1dvZ0NuNjJtYkw3bk14dVpoN2w3QUVyNFE1cUtO?=
 =?utf-8?B?bWhpYW04Z0NhVEYzR2xrY3dvdFdOT1lUS2VlYlVHOUlmVlJ5cEJ3cEhKSGlo?=
 =?utf-8?B?ZnJiaGZTOHRLZDg2MmJyVTRMbC9zb3NOcXRQZGE4U2lCZ2JUVDRlWHlIYU9N?=
 =?utf-8?B?SzVjemZSSVdJQ1kxQVpySUhIMXc4VCtuQVQrbjJYc2lBMS9tbDY5ODZKYUxH?=
 =?utf-8?B?YnhXOFZBbDRENi9VTUNoUFdzZzJVVHEwZGE4enFaNm5rMWpMZUJ3L2Y5TGp4?=
 =?utf-8?B?VDRVS2Z1T3ZFbG16R2ZYOGg3UDQ0bTJPdWc4alJzVTR3RmN5VjlYdjg3L2Vt?=
 =?utf-8?B?MHJMQXNtRC9HOWdNSWVFMG1kQ2lkWGhnTmRSaldyaFd3dFF1M1FUTVVzOWxw?=
 =?utf-8?B?bnVLcGQ5T09aYkpyQUhwQWtXK2VQTDVyNitaYzlwOEIzb21kS3J0T1dVbUJ0?=
 =?utf-8?B?T0ZmR0p2V2RBSzNDSGNvQ3dkWkF3OVZxUENYdEFPbEIwbWQ4QUp0LzVNN0tW?=
 =?utf-8?B?L2M1SWhBWTE1TmtWRm1ZYS80aE9PNDdvaXZQUWNtbkVGaVlpRlZQWklYYjZH?=
 =?utf-8?B?TmtsSTdxKzI1YVZkWnJScVhENmw3OEl0NGhxWmFoOVg4WWd0aDVtS3MxSUx4?=
 =?utf-8?B?TFNuM0U1dHZma3lZS0VRRlJRQ1hCUGE2a3ZjS3I0WnhUbEkxbzZMOXJ1VURm?=
 =?utf-8?B?UGhWR0hRMUY3QlN2MzY4K0Vod0xKTFEyaitod1c2dTJPMDQzbUlzd05GWVZO?=
 =?utf-8?B?YitoSTdCWVh1ZEJrQ0NqUVBTYnpQK3lnRUVLTXgzS2tXR0lMR0F0SWFPajlr?=
 =?utf-8?B?ZStVL2FUcXJWeE82NEUzVldaT1hOUXRUUWFJN0owTGlJa3NTenl1ZTFNL1pZ?=
 =?utf-8?B?MmRDN2crR1l5cmlreE9ZZUxFV2xyQ2w1ZlNoSHZvZ0ZnODBpK1hBTkNndFB0?=
 =?utf-8?B?dWJKc3JiWFdxR2V0WmdhYkVFcWlaZTMyajRpVEpnSHFnMGFzOWVXSEpBMDR4?=
 =?utf-8?B?UWFWOFQ5YTZBUFJyTXV1WXM0blBVdWMrMUdraHcwRDZtRm5XNTBkTjNSdTYv?=
 =?utf-8?B?bDhlRjVCNjRQK0dGYXV2Mk02ZFp2VWd3VzNQWHlUd3lodng4bkxaS0xwdWtD?=
 =?utf-8?B?SGxVc0xJaUtxdTErMmxHeXFrbTVVamFiK1hpbXFiSm93RnowRVRUcXRsTEFt?=
 =?utf-8?B?V1Y5VkVTZmtGNVpjOEQ3cHkvaGlYcEhsRnJtajE0TzNObFRRT1FFV0hyVWZC?=
 =?utf-8?B?QTlXY09DdjNKbExTV0d3cUJrR2ZqbHZNSXNUWU1pcmJHNHNjaGEvTDhlUVBO?=
 =?utf-8?B?bDVKenhiZXVDaWd4THoySVpSTFJSS3lXNkdubGczTmlIQzEvd0xZdkpHZkxG?=
 =?utf-8?B?eVp6ZmZPVUIwSDB4UUZBUkxyMk85eXg5V1Z4N3MrNndUTlFBR01lZ0QweVE3?=
 =?utf-8?B?ejNmblFaYThoZ2xyQnlWWEl5YXp2cHA1VUJ5c1UzSjdtNDlObmJqaExvQzBY?=
 =?utf-8?Q?4Feg=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dk1Oa3JUWW0wajc3clZWakRrbTdqaWx0NTBMWHNpb3FJTHhBZmJoWExSakpR?=
 =?utf-8?B?aHI1UitEUlNtUWg0ZW9rZE11ZWZJQ01xc3N6L2Jla0RzNGxWNWFuMjlLNngv?=
 =?utf-8?B?VnRWY3ZNd0Z1Vi9RcUtMNkg5S3RSM0c0eUZsejBadkJNc3E2THhzU0pUQlRh?=
 =?utf-8?B?WmZqdDNpYnNrNHhHQU96NFBOSk4yMEhqajJydTZmUDJzWnFxc3hyaVdPNFNP?=
 =?utf-8?B?V3BuRGcxNENXZGFBZlRZeEMwdXRVMGhIUTU0Y2ptUGJsakIxYy9DVzBWbm1K?=
 =?utf-8?B?Nkd5cS9DL1d3R2IyM01LQnhvRDAyT2VnWXBUZWtPV2w2K1IyNmdrRmlQUE1v?=
 =?utf-8?B?eXd1a3NMRWRQQ00yNnRZcmkrc1FkYWl2RWhMYjhMNk1IZGM3RW9wNHNjbEk4?=
 =?utf-8?B?aTFzTXc3T3g1cEhKUnFUYVFKeWxub21MVmdSbjN0dUt6R09pK3pQWFZoZUww?=
 =?utf-8?B?K2xRbm1qd1J5Vk1PQnhkVldvYW9WYTNlZWtXZitXVFBucy9lU0ZrNEU0OUpk?=
 =?utf-8?B?ejlSL29WMFFiZUJyb1VlS2Q2UHYzRzBjbEg1L2lXWWYzMkJqTFRZQW5Wc1JY?=
 =?utf-8?B?d1NQNmNTeTZ4VUtKY0ZESjZ0Y0VGaVc0K1VOdXZnYnpoYml3KzVkeG5NbWY1?=
 =?utf-8?B?SjRtRXFpWWxjNWVkeFNrMkdrL1pXQVdDWWhOWFJHYXl0Mkh6MXhBL0dyMXJT?=
 =?utf-8?B?ektXcDVRUlFPTnNuOTBtYlJqVVV3WGwzdWNBeGJBUElYSzZrdDQxMW9QTE1Q?=
 =?utf-8?B?NUtieXIvZXVNWXlIUGVkcDFOZ0RObFVrWnZxZVlsWkNORVZPa1NOUHZ3Nm02?=
 =?utf-8?B?QzdYaVNCTTZMb2p5QUx4TGNLd1F6bzVJL2I2cE9HTlJoL0RLaEVlQjNDNjdU?=
 =?utf-8?B?ais1OEN6OCs1ZFRLdUhFNXZUSXVaMVN0Z0JwcmYxWEZGK0dhM2w0eDJLOHVk?=
 =?utf-8?B?SEJkbWY5emxlUHNjQWlMMmNMY3p1SWJ4UkdWUXJseEpRVEI5RnN6WjJmcGRn?=
 =?utf-8?B?SUFVSWtOWnVSZ3FhNmtId0VxcjFWeSs1S2d3RlVNczJPYVZMcjZGcnpJRnlu?=
 =?utf-8?B?bjNrS1JqY2ZqVEh5SkV3RkJUdVd5SFhSY3Q0RTBaaDJCNTNXS1h4eWNPMGdk?=
 =?utf-8?B?TmFQQlQybG5zWkFJRUgwTjBtTGpBd1VyNWc5V2EreGdIcUpCTDFzclM2bFNY?=
 =?utf-8?B?MDlXSFZaeVRmUG43SjcxUlRHQ3llTEdTdU9lUDFiNDlickpZTXdVanUxNlhq?=
 =?utf-8?B?UHNoVWJEQ2hXcmgyeWdaWmg2ZnBmMU9iSXJEaUdkM2gzZjhIdTN0MXhjZ1Ix?=
 =?utf-8?B?RzgxNXBmOEpPZjlraWh1YXUxalp3dWJXc2J3eW5FY3oxVDhtelM5TmxrZmZF?=
 =?utf-8?B?TWtOM2p2cGduaDB4TVIxTmFWOU5zZkNLQ1dPc3J6MDNJVEVWcERCUSs2U2dX?=
 =?utf-8?B?REh3cExNZlZsdFFKYjdZY3Z6cUVOV001ZG1mcW1idDNmaXd1NUI5dFc0MktN?=
 =?utf-8?B?bzBzZjRjYTR2YldhNFA0d1hGbzVUTnZuZ0luRDYvZlpjbElEK1dkb1d6Tk42?=
 =?utf-8?B?WEpkNGxJc1dMdVZKRmFJOWVJeHFaUlpMeXd6WGlLVHJ5WWlETnNjNnUrVTdH?=
 =?utf-8?B?VElIeVVBK0hrNUduNklvOERIYWxGTlcxRlNGOWRNaE9BZlMvVUdXek1NcWxn?=
 =?utf-8?B?WFdIT3hEcnl0TUNHdEVpMVE1OTBPOUxBUlFBSnRkbnFaanloUXZqd2luK1BF?=
 =?utf-8?B?QmpGYzFoU2tiRWV1dkxjMlRTbmE1L1FtUHlqZmRWbjk5akNPZG5WamZiOTc3?=
 =?utf-8?B?T2QxbFNTaktoOW5nMXpqb0VhRmZXNkUrV2tLTmYyMHdZaHhBbWcyd1g5Q0NM?=
 =?utf-8?B?N1NUOVVpWFFzV2MwTmxxQk5xSTBhcFNjclA0bHM5bUg2dU9LWXY1dWtLMXhp?=
 =?utf-8?B?RC8xWmEzVU15ZUpZNHNUcjA0bk9EQ3Rkbyt6NWljUjcwVjZhaGxNNXV6RXZM?=
 =?utf-8?B?MG5QSlc2SkFsTmFSK3hRU0dJZGhzcDZlUE15UTcyT3RhNCtuclFxNVV0Sm5t?=
 =?utf-8?B?cXhxNzI3N3dZdE5LQjlUQzR3S0FqRkR1TUwxRFNORWdaTHdJTEFrT3NMNWc1?=
 =?utf-8?B?eVNqNjdzVmhkWS8yaEU4bTc1WFhOVjJmS05GRVI3NTBQY2piQmRYMFVEdTdM?=
 =?utf-8?B?TnQ3SkZ2TU1aT2xrN25WZlhLMWI3ZHkvYzVTcUd4U1JRZWFHRVkrT2kzRzZO?=
 =?utf-8?B?eGVGZmkxaktRQ2pPY2Z4NVdxWFJjMkhJdzBQTlZFeHBaSkRKeHNaTEJldElZ?=
 =?utf-8?B?Wm1mdktlQ0pSaG5LNEYzdjk4TDY5ekZKNkJ2K2F4Sk56UEFwYWU0NXYzS21D?=
 =?utf-8?Q?NxGmKQxG9oyfjxmbTcrC1vIM9EVD9UhAXSjgh?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 7482de35-3414-4fb2-9811-08de5db8e170
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 15:29:37.2125
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: drHFQvqsULLfYVbqvB/kgGbgJ34vF71SkLVYl3wI3pK0+3sfBomF0xC4ywJHZBuZBGNOMElh9aGhCGzyW6BmNtch+E7C6+J7DJq/0LYMoO4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11026
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 15:29:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8741

Hi Antonin,

On 1/27/26 9:19 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Remove references to the Poky repository, replace by OpenEmbedded-Core.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

