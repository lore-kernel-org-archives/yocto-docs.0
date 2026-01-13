Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDB74D2D107
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 13:55:52 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.63])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.59275.1768312551426105001
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Jan 2026 05:55:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=V0YVDkVy;
 spf=pass (domain: cherry.de, ip: 52.101.66.63, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OKziartF52WjRrYVJLEaVNJsYII+V7aZ1RsnKFfBuSiXxDTbcSJ4nCHNzS29LdYececi/tfNC9cp1OtJOTRZH+SHyCcYxFM5HahEkkfPrvSKXsBZc19pg/nXs1O/CsZW++dTkzTto2E0DL8xu0E3sz3uJE3eqz+GQUSFApxKtNyxfU9kIr04z6qiNi4pCdTrpg3A4KjKU+4H+3woAf7DuGrvgjAcgZflhZrS0cqkpoVhIfdoXcidZgwjz66UBi9GeJSerWla5Yp60l7UszNFF7pBx0PHPrYr+wOVS7cSfshVa5U+UWxcXvUnDW3cry5ztiqdLTCOE3IWEq/gGVbQJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ElmisEQmmXTQIGY8RUafdWRM8Ai54/3x2giZudwkjqE=;
 b=ZuTKLoyUTvfrKg9T4RZW6Y3o596N/ukC4oof29wi1NF+xyps2NrKBoIF/8LlPecQIZ9EvYBAwlfJqAFq/Jsg3j8bOMZAuL5s2JYMDDNZi+XzxCglIJbqvERKcpGagNmzn+fK76nKZ3+zQHqnHwYvspDk222NGHtMQCydF6w7RvGUBglAqAjLQuc4PMeqoiU0i32KIpDNkyPsYbJs6T/rNNUl99nxb34Qjgxskrd+N9Eq9cxszVp/7zy0zRknmLZU56MUnzUUiTceIiDesrV44pSRUmcVv3JAc98HR0grUYdvCwvFPe6WIoxxr6DPtUum/EmtRyy6PfN7CSBuFiGKxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ElmisEQmmXTQIGY8RUafdWRM8Ai54/3x2giZudwkjqE=;
 b=V0YVDkVy5vYUD01JZpuD5uk5+8rcEn2FzI8u8oSAJg5IMyH/S0SqK7JZdxr0JGueQO6RDVEgsyigqnDokc5u+MMuvznHhvbYfHAB7hZ34y57OukHAwRSdHl9euoO7EHW5f5Ic2ijOpQ1d1Fn+2EC0Z/TxRx6qsDWk7Yf9WrHkQg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by DBBPR04MB7817.eurprd04.prod.outlook.com (2603:10a6:10:1ef::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Tue, 13 Jan
 2026 13:55:47 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 13:55:46 +0000
Message-ID: <4129bb3f-b802-4b8c-9464-71fed0c0b43d@cherry.de>
Date: Tue, 13 Jan 2026 14:55:44 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 23/53] overview-manual/yp-intro.rst: remove
 obsolete poky repo references
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
 <20251224-remove-poky-references-v1-23-658a5f4dbde2@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251224-remove-poky-references-v1-23-658a5f4dbde2@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0226.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::19) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|DBBPR04MB7817:EE_
X-MS-Office365-Filtering-Correlation-Id: cfe8b082-2e33-4784-a305-08de52ab73b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MjRhcENKRExZcjZ3RTZyZ0hteUNvUzYwYlhvck9XMVpIekNBT011d0dreS96?=
 =?utf-8?B?WHdabUs4QmhLZjI5bGViUjN5VllaTG1OQ0FrSGRoR0ordlVEaXpYNGs0aS9J?=
 =?utf-8?B?SGo2Q29tdWUyVU52aEpaMXdUYWY3UzZuczdsSXI5cEU2dlNmQ1VNbkRKTEZj?=
 =?utf-8?B?Zk9aMEg3cXN1M2MvcnFKQ1hUb0JHR2ovMTJyU0hreG9lRWxrRDQvQjVVclE0?=
 =?utf-8?B?UFZmKzdtajFCOEREY0hxeEpMcEVuYTNETFdRbFh0SlhRU2dhd3JpTXZkd0ZE?=
 =?utf-8?B?bG9raFl0cjdMdG9hUHhXWm1lL2hTZ0pLUzdxWlZvNkJzb2lKYnNLUGlQaUpq?=
 =?utf-8?B?clFrYVdYK3hEUlVxR2lhQitPR3RSbHVxWUxUUlowK1dVd2p6UWlUenlDdUdU?=
 =?utf-8?B?dWxuZHZiUXJmanRCdllIMGcza2lacWU3S01kam5BdmVvZlF3V2FteWQ0dk5m?=
 =?utf-8?B?SlVKbHZ5RnhLTGplTGpyZUdIZnZCZmU0R1AyUEk4RDdiZTBseU5IQ3p4OU1C?=
 =?utf-8?B?ZkZKSnppTXdGY2hxZmtrZUpocGR0dzh6VGJKVWE3Z05NWjd4dEJzMFlYZFZG?=
 =?utf-8?B?Mm1TN2xTTGtyK0J4NmdwOUNkSmpoMUVBNC9KN1p5SzNaNEFaV1NEZ2N4MmF0?=
 =?utf-8?B?OTNGZ0NTMGRWb0ZobUhpMVFQMWdjeS9udmZiTWswU0IzOXFZcVJoYUJOZnhO?=
 =?utf-8?B?WDVSWkxiSkt0bEpxb2FTa3pISUlnYkNvSDNwQ002cVF6S0g2VDRMaUsxL2Rz?=
 =?utf-8?B?SUZNV2h5d3NBVy9sQ242RVZGWFIybHVxczJ2YXJ3K3lWdzNYeUkwRUprWXRT?=
 =?utf-8?B?QUxWc2puUk5mU2tCSlVoeWhJVzZtekVFN2RTMkRnMXJOSnNJbDFPSFVtTGp2?=
 =?utf-8?B?M0FkL1BEaEFPWExYbDJCRE9IL0RrSkttNG05d3QrWTYzanEweU5aQWtyc3R6?=
 =?utf-8?B?VjJRT1lxZ1JuVTFNK1owcGc1TnUwRy82dTBlWnA2SjFzUndFRzBDTFNTV3FG?=
 =?utf-8?B?KzBSa0VXQ1lsVS9XakVqdmZ3K2kzUzkyY2Y5ZEUvbDJzeG80NGVqcVRiT2hr?=
 =?utf-8?B?d0FBMnpmL0ZUL0t4R3k4YnJ4b0V0azg3Q2hQQmRrSisyYjJDUGthVEhDcEJn?=
 =?utf-8?B?OVZkYmRkMDlvZjVSNGtlaWVMTGRibkQ5eW12QUd5NWFjVXNsRmIxbTZjc05V?=
 =?utf-8?B?Y0pXYUV5dzlXamdVZ1ZzLy9mc3AyN01OeUFUeTNjS2wxZXVqNUp6SHFCZE12?=
 =?utf-8?B?Q2pSa1RjSnVEVkpVVFpRRHVESzBvRjdRYnZ3Z0gyYU5ISjhKNFV5TXgzYUkv?=
 =?utf-8?B?Tm12eXBVYnlWOTYrK296NU0vTUVOK3lIUTdXQ0FQTENqYnRnUUFlM2V3TVlQ?=
 =?utf-8?B?Vk5IblB2Tk1tcFV2Rk1oRVh1UEl1SldGeGsvKzBPVDI2a0FqcGgzRjJwVDI3?=
 =?utf-8?B?bFgzd1B1aVJrLytFRFAwVC85R0VPY1U3a2dFSjRlRy85MDBqUDlKcGNOMUVo?=
 =?utf-8?B?OG1TTkFHQklsL1dlVldwaklvUy9SN1l4QnNxSE1vaFNqSldVeWJRcXJQOTJj?=
 =?utf-8?B?Y2FaTUZycGVaWVNYdlN2Yk9FWFg4WnlKMmNUcnFjYVl3ZVIzMERaREpjemJs?=
 =?utf-8?B?MDVmbkw4WHkxV0ZiK0VoM0hPMmJibEtJS3VQanVBRWZLS2JtTTJpcUd5SSty?=
 =?utf-8?B?ZmJZVVNUNUlvZU00a1NOd3hSWFNtck5oM1NvNURZS1pvdC81T0lOaHBleHc1?=
 =?utf-8?B?eWxMWjY3QzFDeHJBTmF3VGlkMGM5SWVzaytCQnd4emQwRzZsR21aZnliNnAr?=
 =?utf-8?B?R0psSE9MYUZ3QkhhSTlBU1hQQjlOSUMwbGtXeXVSNlJWNUcxWWxDZTd0d0lU?=
 =?utf-8?B?MDFKQzJRYUx2bFFHekVCZVdPV3REbS81b0paSFBJVWhYYkZVRmFMS2xhWkdw?=
 =?utf-8?Q?twfaCBiWx8HZJyKAz9LY+Vbo6DXna2pm?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VU1hWnZFQ3BKM21kVGs4M1p5VldwdG9QZkRDS05RdmJ2aUpNTE9ZZGtYNXds?=
 =?utf-8?B?UnV4TVFmRmtreldNTE5KTk5WU20wYjRYVWo2aDNpOC9MOHI0QUR4bVBrMzV3?=
 =?utf-8?B?SzliRnlOcWt2RW5YUnZSUElGZkJvTmk1UHNXMHA2TFlxNnIrQVd2QnZ1UlJi?=
 =?utf-8?B?VFV0dVlydldlbUVkVnhxOUhBMGw5NFdaZXZ3QzdCZTMzUG4rQjBPakV2OTNC?=
 =?utf-8?B?WitkREU5Q3pGTDdjaWRVZmtqUE93S21nNi9GWWt4ck5mdXBTWHdKUW02c083?=
 =?utf-8?B?VDZvbXU4T04vNEErRTNXSG1Gbmh3elFoVmFiNHdyZzRmYkpoWXFNbHBGYnFH?=
 =?utf-8?B?T1NocFNZUmEyY1J5MDhxendwTFpZWDU3Z1ZzeExjVE12RE9hdGdGcE9VU3VJ?=
 =?utf-8?B?R1piMndzdVdxRWZkMGd6OHkwZStzbU5oeStONEM3c3NGZ2NTSXJrdHB2OWVo?=
 =?utf-8?B?T2hCd0tnbWpwTzU3UWlZekMrb2JLOXRzV0RiUm95bkpMNG12MUUwR1FsQmxk?=
 =?utf-8?B?RGEzelBaRk5ldGFhelNNUTBXM2VGZUsxZjZYMDJoeVczRVpoUFNqOFRIV0lZ?=
 =?utf-8?B?WVVsUytNNlJhQzJrTzR3OWg1eE8zQXdIWmp1WFk3VHZaVm1WcW5QQ1N1RUt0?=
 =?utf-8?B?QWpiQkNPSGFaMmlqdzdZVmxxSHYxVUs3bTZLTWo3MXc1UXBudjVSZUdXYWpF?=
 =?utf-8?B?cDZTWUtsL01HZDloRjFmZUFURjdHR2xRTUhMME51OEZpWXJJY1hhVWExUlgy?=
 =?utf-8?B?cWM4UGhHV1hzcTNiMFJkOFlyVmJEbXNCMG9CblhjK1hMUVgzblRvcFZwRDUw?=
 =?utf-8?B?dGhoK3dhOHJ4LzlUUkJKaDVjUCs5WmFkVjJhMGdqMWJsbGFhMVlFcXpLWHh1?=
 =?utf-8?B?MzVReTRzeDVYQWlBSURHMHNGWXVIQ1JSdGRuUjJQYldHVmNONGJEL2toWXls?=
 =?utf-8?B?cm4yRTJWeWVyby9mUXVhSVo2aHFKYjRMeVZ3ZHhjcExsYmszMm9OdFZ1NUU5?=
 =?utf-8?B?SkZROCtTTUxUNDVuUVlQSXBsYy9DdkZzektFdzQ4dm0zVHR4QUNTYmplSkdU?=
 =?utf-8?B?M2RpMWgvMUszTVA5N05EZ255RmY1cDlNY3k2enYzclVIMUpxcHBrWGt1WFVL?=
 =?utf-8?B?Ti9aNnVjWFhDZ2JpajFxVkdScUxaZWJVTW0yQ1FnTS9oRytub3ZkbTB1aGhS?=
 =?utf-8?B?bnVaNE1vQnZhMVJURFNmenQrVmo0a2JJNXZpZVg5TC9PTGFpdXVtUGJnSnJQ?=
 =?utf-8?B?Ni9aWS9EZEc3Zm9QeldFYndueHFrUFgwTXY5bUNmN0Y2a0hpZnUwRjlBUHRP?=
 =?utf-8?B?V09wdTVydHVETEw0TTRrL3FuNHM4ZEtmSWZBcmova3M5Y1lCaVZXdC9OWUNl?=
 =?utf-8?B?OHNub1pJd1hJVnNHZURCMWhaUlhNTkFKcVZmS2FWd0ZMcTVBRGIvRXJLMHRz?=
 =?utf-8?B?UHkyRXhadS9DbVptcDBHNW8wRGhISTZnZjRGWFdjbE51b3VZMHMySm84V2Zn?=
 =?utf-8?B?dmNQakFiTXd3b2JYQWw5WC9GbG9VUEJ0QXV5cEZOd3ZWbWhoRHQ5aHRVQ1Yw?=
 =?utf-8?B?R2dRTFp4cTd5d3VuVWRmRFVxS09KanRsYXNhckdvVC9Sbi92V0xOUzlNR2hi?=
 =?utf-8?B?dUFMakdsbnBIM1RaQTN6a2xaUmE3QTRxT2NUYWFIaXBLSk5kbWx1dHFDNWRP?=
 =?utf-8?B?OVEzUEVVRDBVY3VRK0RjN1hTWjZUZ2R0bVBqeW9LNWQvaDRMbUpaYmVkbG00?=
 =?utf-8?B?cWVIZktIMjdPby83TytGUHZOblUzdnFuZjlsaWd1MTNKOVloajV3YTQxeS9U?=
 =?utf-8?B?VVh6MDRQVW04U08zQXVFdVJEaFlJaXExUnM0TE5VODA2RWt4RXU5Tm5yODdv?=
 =?utf-8?B?UjFKYitSNldWelczVUFONWxkbnBnaGdINzMzczhGcVVpSDgySUxtTU9oUzFU?=
 =?utf-8?B?VENCOG1tTW9Ga3FidStDblVzelNTMDlsUVYyZGltc3VkMzhsdFdZbDBiTmhJ?=
 =?utf-8?B?UlBJNnN2OTEyNUR1eml0S3YxakpKemE5bjgwOExaMk92aEc2MmhZR3lvYU9M?=
 =?utf-8?B?V29wY1U5bjF4blJxRldLSFV2bGRuRm82aG55QS85RGpTOGtUS01zdHVwSWJS?=
 =?utf-8?B?aTgrQStpSDhHVDZpekJ6Umo2UzFUVTBGbE9paS9TSTY2cGxzN1BKVWQ1OEVJ?=
 =?utf-8?B?UXl2TmZlSHNMQ24xMWlsYWhvNmpyOUxKVWl3Ukx5NVZpOWVyRlAwRlFhTS9S?=
 =?utf-8?B?L0JQd0JtN3g1ZjE2K2h4Q3VuUkt5TWs0QlBWTEhqVDNTMllaMnJ6bDE2ZFhk?=
 =?utf-8?B?cHJlQ1IwYy9NdlFXVDJsSGhxMnJNSU9pckR3cVRvWEptQzVFSWM5Zz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: cfe8b082-2e33-4784-a305-08de52ab73b4
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 13:55:46.8240
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TzIsqXMiqMmhUqsfl4IZeaAE14ez3hfgqTGd8kawUqlMvGFdz/hZCSRh1k/+cPPniOuiN1CxAM0YsBWAYd3NnFuSw/br8su5ak9aUGs69/g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7817
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 13:55:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8512

Hi Antonin,

On 12/24/25 5:31 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Remove references to the Poky repository. This document had a lot of
> reference to it, so a lot was removed. The "Reference Distribution
> (Poky)" section was removed as there already was a "Reference Embedded
> Distribution (Poky)" below. This section was simplified as now Poky is
> just a distro, not a repo. The historical section was also updated to
> mention the obsolete Poky repo.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/overview-manual/concepts.rst         |   2 +-
>   .../figures/poky-reference-distribution.png        | Bin 23784 -> 0 bytes
>   documentation/overview-manual/yp-intro.rst         | 155 +++------------------
>   3 files changed, 21 insertions(+), 136 deletions(-)
[...]
> -   -  A vehicle through which you can download the Yocto Project.
> -
>      Poky is not a product level distro. Rather, it is a good starting
>      point for customization.
>   

It shouldn't be modified or extended though but taken as inspiration for 
your own distro, no?

Unrelated, so

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

