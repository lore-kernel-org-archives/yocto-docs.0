Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB8A4D29C49
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 15:55:57 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9690.1768924547320458198
 for <docs@lists.yoctoproject.org>;
 Tue, 20 Jan 2026 07:55:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=ZhB99WjC;
 spf=pass (domain: cherry.de, ip: 52.101.84.46, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wgUYJLgJxLg2m5Q+wjHeifzNhs6839hXzXF8H/d4x7jgwqcJAr/6WqpEsm8nBfYEqBaPRDZGSUVNNqyczc5JrJ5+CEYNplsDxFHa3OhPsTnqefwfjYK3ZhtDv3kEbHSdXxGq5EpNmyY3UyWkowzhTf6wnWqZpdm0B43roXk4s4Vgr3orZSZ3NgAxTwip3FPciDLwJdUC/VoCJIe7JN5Yo2zuSk34ZhExeLRYFKz5JFgHXl8ldR5354TTMi0vyx3TQhRAwQ5p85Xe0dNisrVOFIXOChDFR9KeEOXLWpC/eVBQLAShqg8ua4/tF0rG9H9wFxQBRwlod0xZnEV+oZvZ3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=83XRfEBygKCx5RM0cQDP+ECcaM1QuLGNJnAA+gg/kvU=;
 b=lWwcvJ2LGSjSGebxf5ml9WHIWo0x8mMMDFZR68bC3OVzxay28LXVKSf5r5iICgEA98zHhXTaf63nlvIUQCrcqohkU1oubCj9pqMyQXDMwQovhW4KfevEc4i7r6qeJfivGajQM2IhGEcMVW4guTUjMgpzBs++F2K95dPw0YeQZqRa3weBznOgvPm1RkZbzp9LrjZJgz7jDIuB49vTXOb8y8X44XTQi+NNo4Afqv7F1cc3ldQVUtiPDqZK7/pPxfWu2nfypyD9PrVwCu3MvDJk3S5hlaBgSbtSU1I65AybbVrjQcKTTMGk1ZhAac1W+7NtE2Q9IPBm6W4NqDD46J1C9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=83XRfEBygKCx5RM0cQDP+ECcaM1QuLGNJnAA+gg/kvU=;
 b=ZhB99WjCGrlnQ85TtE5EnPI1EHhek0UwSGzIoS5HzL3lW1hvyV1U+/82PZ08ugA8PMF1wQcESCt2dRaaopCo2PiyBWle4YCwNk72+7/NF6vhEEYotg2+R+iyY6nWiJMGz6PnSvkpKamYMzLJ3UdCfV4SyWHcs/vwGEByxnT8CyM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by DU4PR04MB10765.eurprd04.prod.outlook.com (2603:10a6:10:593::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 15:55:44 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 15:55:44 +0000
Message-ID: <0fdf95e9-3f6b-4293-80ed-69872a0798cc@cherry.de>
Date: Tue, 20 Jan 2026 16:55:38 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 6/9] sdk-manual: appendix-obtain: replace directory
 structure PNG with a code-block
To: Antonin Godard <antonin.godard@bootlin.com>,
 Quentin Schulz <foss@0leil.net>, docs@lists.yoctoproject.org
References: <20260114-code-block-misc-20260114-v1-0-174a6e5dba69@cherry.de>
 <20260114-code-block-misc-20260114-v1-6-174a6e5dba69@cherry.de>
 <DFTJ0YCI8UK2.PFT9J6BRS18Z@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <DFTJ0YCI8UK2.PFT9J6BRS18Z@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0241.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::19) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|DU4PR04MB10765:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fbc53b4-2a97-44e5-c0f9-08de583c5e68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VUdDcGlYZ2ZYUExQZmFsZmR6RGlxYmo5b2UzdXBhRzJybGpoZDh2TkpGSU5I?=
 =?utf-8?B?bi9CMllqNFRhekNkMmlvTEpBQnlrVXVvaHE1ay81d3BSRlM0azB2Mm5KUFNI?=
 =?utf-8?B?aytoMHBpOTduRGFhWTBJU251TzQ1aUp2Vzd3bitiNmtocHllMHU1TEQ0OHF5?=
 =?utf-8?B?eVp4c0tNUEFtZnRLRVlGSHRmdkJLaXQ2UUJKUWFHOEpVRzlJeDY4NHZLUnA4?=
 =?utf-8?B?aDZUZjZ0b2RaOUZIV1ZnZm8zWjhGc2ZVblhtZVVuajJmQUJVSitaTHFOT3pU?=
 =?utf-8?B?WERsMDY2bnNBOG9aMEJKKzZ5bmVBSzJXaHJXQXJZMmswanNhNlp4RHQwclhR?=
 =?utf-8?B?ajg3aUJxUjk1Lyt6bGZYTWo5VzE3VXZSeS9aajNpM1RFRlVSRFc2dTFCTXBs?=
 =?utf-8?B?K1pLbWFlYXlKUjdrUm51NzFWR2FLWjRkdWlJR0VYU01UZjBrL084U012T1Fw?=
 =?utf-8?B?SUxwZXp6aEkvRWhNeFREb2JGZGtzcWRUdUxaR3lUNXZUUVFCdlMrL1Z4cGho?=
 =?utf-8?B?TnM5QjZtWkR4SS9pL0hyNm5QM0NpK3VBREplUUIvTXRrWTFwZ0NQOXprOW1K?=
 =?utf-8?B?N3lzditHTVRSUTVlZXR3TmRzcjFLakQ0NysrdmlzSHZoeDc1aGFHVHRDKzYw?=
 =?utf-8?B?MS9UMnRmei9QdTdUMmRDV2ZrWmUrb1hXTnBtODF4QVV6U012SkFYMTkxQ005?=
 =?utf-8?B?QmxneC9pa3N3eUFBbEJqWmlkUlZ4ejJGRXVBNTNNQlA1YnU1Y2VMakpJRmVy?=
 =?utf-8?B?cStFd2JDRHFnNEdqQ1NZNTRmTXdzdm1sVDhWOXUyYU4vZWd6dEI5NGYyNDVR?=
 =?utf-8?B?RFdKblFPYzlwZnQ4V1BnZTRJN1ROQmRxd3RuUkgxV3dZM1J6OHlDU3l1UVkz?=
 =?utf-8?B?c2IrN2dWOWhJS2pudGhSNDJvaGt2VmY4NzV3RnFpTFNYTnM2bStaUWY1dDRi?=
 =?utf-8?B?RkFVVGE2M3dZZmNvelhrUDJuV01EUm9ZY0tNanc4MU9ibXJNb1U0MktWOExQ?=
 =?utf-8?B?cVMvV2ZtNFB3ZjRhd0tDT2dUNUFQRlRWTWRCSkc2TU02TFYyRm1jaG9DOTBq?=
 =?utf-8?B?MTAzaDRLMDJZQmxnUWhhTHV1SWxpeFY4d2ZiMkNFNkhQbHBFc0hQY3o3NnBE?=
 =?utf-8?B?RGEwODMxM1paaGw3UnA0M0QrTkxDbUxrMXdxOENsWW1XRmc3Zmk4WUxCNEFo?=
 =?utf-8?B?V0MyTGdtWVpIMk5FbGxLdFFLWjQwYVdOSzhzckkyR0Y4dFJtSEFCN0tOSVla?=
 =?utf-8?B?NjdVNjE0QXhIV29UNGIwL3FtbkppckpkQk1aTzhCVExaalg2dDVnVVVFdHo1?=
 =?utf-8?B?blV6WnUybHFiQTZScE1oT3ZxOHpPKzc3b3YvZS9ZMzJsOWhtK2MxM1hqWE1F?=
 =?utf-8?B?UTJzeVB3N3R3Q0k1L0tBcG9BamJkYzUyYXoxa2ZVdXkrbEs0WllkWFJReDVn?=
 =?utf-8?B?Vy9oWnFmNmhIUTRnVEN6cTBXa01mSi9SZy81SU1OUlVxSFVMUDFaYlNTSHVy?=
 =?utf-8?B?cmNXeElNcXl0WW5KaDNrZEZDOVl1RGQ4ZTBDNUFoTWk0VEJtdTZaQ3FVanVE?=
 =?utf-8?B?dVJVU0kweEFqeXJsRXFhOXdUYTZWQ1M1YmczY1JvSVVoRHFiKzNDYzk5M1RO?=
 =?utf-8?B?QmgzVDNoUnc1bzVSdzN0UUN6blludlVtRGJZTWlUMDAyZFVoL2QyOWp3cml3?=
 =?utf-8?B?RUpFU1FVanExRUlaYU9nWUF2d21pL0lGa0JKeHJMNXA4cGtjRjhkVmJwZE9R?=
 =?utf-8?B?TXVUblRqMXYrNzkwYktScmJOK29UMU13NlMxS240V2tKUzE4TUFvN2VRZE9l?=
 =?utf-8?B?TjdJaXh4KzJLaUlCWnJoSDBFSExMdHdCVVIzUVlKUG5oa25OVzNNMXYzdE5N?=
 =?utf-8?B?SFliRVIycmhkNUFyZDIrSDNhMUtIYkdBUGNRTHAvbjBITDB5Zk9rcVJjU1Zp?=
 =?utf-8?B?TTRidTRTUHlTelNteGV2WDk5WVk1a09LalhCSkM3VkdUTTRGa1dqQmxTZkUx?=
 =?utf-8?B?NWloYmlsb1Nsb1ZpT3JiL3E0K3VYWXNsUTZNY2JkVTdrOFZiYXAyRGY4a1Vw?=
 =?utf-8?B?NjA2Qm5BQTltQWhHTXp4a0RaSWNxeW1RKzBjRnpGZG1ObmwxMXpYZ3lRemZE?=
 =?utf-8?Q?S2iU=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?S3hUNFhRZE85NFJ5TGNNVktwd2RnLzB0M2dSSEt0MlJnbVY1UjNIU00xZFdS?=
 =?utf-8?B?VjhRbUppK1VSdG1SVmJXSmx2VEg5TkQ2SUxHNWE3TVk3dGV6QmJhelJWU2dZ?=
 =?utf-8?B?R1gzcWNzRjlZd09ZS0x2TSsrakZla1BSbE1ueUM0Zk13Y2FsYkJMcWpZdjNG?=
 =?utf-8?B?WTMwRjZqaWJ4WTRmVVJsNGxselduUGszK2pKU2c1cmtQYWR3bDlYZW93d2VP?=
 =?utf-8?B?K2pYenNiY1h3L2VuU0gwYUIvY2NsUlFxc0FvZEk3Z0RNb3cvblc5WktjMHpG?=
 =?utf-8?B?WnJ2ckk4eWFqSWVETzlpb3RHS0pxSkZWZVhKblphYitXSENsUm5ZOTNFeFov?=
 =?utf-8?B?dkFiQ0Y5VG54Y3AxMzNZaUlUZHpDanN3NUFuVlBwK251UlhjcnZxbTZxZjVN?=
 =?utf-8?B?SGxnRmVORlVkR3pRZlJFOHJMcldCbmFPY3VRamwwZVVoeFB3VXl6WTU4VVlr?=
 =?utf-8?B?aTh2THJwUVI3VFZ6RllBZElqWkMzdWlpU3dHNHJkWU9YRmZNSnp6QXZSa2RD?=
 =?utf-8?B?Wlhmb0ZvQmNlaHhEbWRjN1RHMVdpem9GMURjOE8rQ3dQUEUrVDFBcnR2anR6?=
 =?utf-8?B?TkZTUVE5RjBCL1lCc3BQTHdmQWw3bTlYWkViNi8xYmt3MVVEK3hLdE9lcWM4?=
 =?utf-8?B?c1pZUksrc0x6eWk2L1FXbk1qbjd5d3p3OU91bXpIREE0aEFrQnVFNDhhOTRS?=
 =?utf-8?B?dERyb0VGV1pQT2pMU2VoZjNtTlV2Yjlsdm5CRUFXL25XdWJrVCtaSUJZbVBl?=
 =?utf-8?B?S0p2Q1l5VGV2ZGQyZ3NTZDg3SzQ0aUhJUE5rVlRzaDJCUUNFSkpJYkw0cDVY?=
 =?utf-8?B?WDJHUVpwcmtuYkJaU2xkNmZsZTNtWUVCU3ZzbFdqdHZScFEyQndkWkJwM2NP?=
 =?utf-8?B?UkF4dmgzdk1yWlMrOUJ5K2gwU3BTRTFiSDlrNGk5NThvYnVxcktMeFlLSWc5?=
 =?utf-8?B?OG1aZmNjcXpSL0NuYk5kVmk2d3pIcXowOUtwd3hHb3RMdm1IOVNqTFpjWThp?=
 =?utf-8?B?a2lraHBZYnJqNE4wVmpJZUxrTFBGY2Fsa0lqV2NHUGwwWjNxaEtuVkNVcUp5?=
 =?utf-8?B?QzBrejVaMERSM05NNGtaUlpGRFpXQUZsRkZyd2tiNExmbVpwcDdNWE9qQWNU?=
 =?utf-8?B?ZW9HU05BUzFPN1ZQbmkyOEdCVWtwWVllalM2WWw5NHZuN2orVVlMOXdpWmM2?=
 =?utf-8?B?R3hxUnpMWlVqR0FkdkRpbHNQNTAvWjVPYVlaV3J0RXZQWEFOZEVmdGZRclJp?=
 =?utf-8?B?SEVpR1pIZUdMeU1GYTdURlNnY0l6ODhRN3VkZG1KM0ZEMjdXTHJ5MjBBSnJK?=
 =?utf-8?B?My9WM2pnTE0ra1EyYWdzU2UxTG03RFVUUnpIOWVwUWFmcWVTQnpRbHErcWtI?=
 =?utf-8?B?TnZrY1ptSzBjYnZPdFpSTjZ0Zko4K1E2L1RzV0p6d1doaVc3cjFLRXdrQnBz?=
 =?utf-8?B?WS92NWtoRnNGbEdIbDc3dVdZbHdNWjJ1RlRsSTRDcXZyWTFxRytDTVh0OFNF?=
 =?utf-8?B?dURIaUlNdnU5am5kTTRaTzRYM29RK3RaVXMyRWFtZEx4Y2ZkMjI5WlNwb04x?=
 =?utf-8?B?ekpENGFta0IyZXYweUk4L042TU9IbHNjOTZDdUl6alF4SlJaRmZxaEFQc2NM?=
 =?utf-8?B?c2pTQlRWcU84STZzSzQzR3JqUGs5dXk4Z3hCL2lTWGt2allFUDR6UURzODB4?=
 =?utf-8?B?aUMxYS8ySllsQnZ6MUVDRWFubklwUU1wa0JyUXNxNDFVaFFtRUNHZE5xNXk2?=
 =?utf-8?B?c1o0S0lINnZoTXhUS1hhbHRFQk9hblkyUTdMT29LYXBZdVRTU2ZGeEJIZGt1?=
 =?utf-8?B?d1cvUm9tQldjR0w0U0dhcEdYb3Y1TkxxTzNHaGpRNWF6Z1ZXZ01QT09TYTdK?=
 =?utf-8?B?VVNhQjdEYS9MUUV6cHFoUUduWXpMSlUzRys2dmxGdnlZUWRyVXh5eSs5TXR3?=
 =?utf-8?B?RGFoRi9jSWphbjllckY5TndjU3FMS0VXS2Vkci9SWmEwK1R4aEIweXk3Rkd0?=
 =?utf-8?B?OWFmaTZsTmJ2TndTVHRYT3c1cEdxU0VHY1JtaGlKZ3hDZDRzaVoxY1pyY3l6?=
 =?utf-8?B?TE9MNU5IK3BCM2dpOW1RdVlXNzBpMFgyOHk4TjI3cDJLYnN5cW9hNTlNY2tV?=
 =?utf-8?B?NmhDeld3UnRGdlQxSWtBMXo5czh2dWVCWEllcUtWYVBPUVdKSGppZVMvaWRH?=
 =?utf-8?B?cThXcjFwVmtsU2Nhb0NrQzVndjNiYVpoNTdMWFo5TVRnZ0ZHRU5YTWJQNDFw?=
 =?utf-8?B?MXdhZlIvcGQzaUpuMDVydU9wdXBROEZjZWhveWlwdENYQjNFSmJrU3B6VUZD?=
 =?utf-8?B?N0p6QUZ2cWM2OUw3VEMxQldUWVZpL1k0MjlWT1hnVUtMYWswdDNnT2VkUU5Y?=
 =?utf-8?Q?I3IIMZmWOYkqo1bX/kuAspa1xEKX1A9DGYXRz?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fbc53b4-2a97-44e5-c0f9-08de583c5e68
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 15:55:43.9360
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +osUm62ks+7ghKgey2RFFcdZFE9uruJd16e0X2w1WrLvZVXCtYVtaAtzMxdvkduBVigzocb9Hwepsv2XfSdEFfkNLuhptUbCjdLff7mfOZs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10765
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 20 Jan 2026 15:55:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8601

Hi Antonin,

On 1/20/26 4:37 PM, Antonin Godard wrote:
> Hi,
> 
> On Wed Jan 14, 2026 at 1:56 PM CET, Quentin Schulz wrote:
>> From: Quentin Schulz <quentin.schulz@cherry.de>
>>
>> This PNG is totally unnecessary and makes accessibility much worse, so
>> let's simply replace the PNG with a text code-block showing the same
>> directory layout.
> 
> Thanks, I agree completely. There are more across the documentation IIRC, this
> is easy to replace, I should get it to it when I have some time.
> 

I think this may be a good place to use the parsed-literal block that 
Robert suggested, so that we can highlight "placeholders".

What do you think?

Cheers,
Quentin

