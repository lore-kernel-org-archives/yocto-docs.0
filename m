Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1379D34093
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 15:46:00 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.61])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14332.1769528750071282167
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 07:45:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Ay7gfzr+;
 spf=pass (domain: cherry.de, ip: 52.101.72.61, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aS7wsohJLbaK2TykTu/A/80sQJ80FHawkzPOfxo2OyQ/LA0yzt/GYQJktCfzkbYTFemvorC6/YVUqkGS+YplgYoPYvZpsdKPQ88hBV3OqnVn6vEWZzqML8G+fZNodM22vkjruolbnixQdV0fIiyadJiB7SSO0usRrfK8cfVmWAApQ7YA3KjRctR33ivUlzy0CEucq8vP1WM/lfSBOui0RRWzQGBmn1F5QUOISi7lv1SLKGl2YQXwK53m1C2d4prk8D2wZCCVxpSgHvKk+pY2J9jmF9Ir5zvMlbDxIpfZxF2L/jLt6UaAy0mmr3jPHjj5XRvnxcwW8ZJ2yLoPDMZwvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lsjvm86t9d2FDmnkwSphWG19QMb5Et4o9jH37Q7yAlo=;
 b=G0vQ3LAx9nwngdGxlu+wna+DpRpz2UXuHNcUXjWAss70IN/sTJkgL7PiqAvKUB1oz8MDmgesvzD7WseZg6sBcbFIJOvdtpMRgY2/0Ylyk3ADiaJrfKkXcuNythm7TrujrTD44qcF1G9/42PTLHMFJtXUzBTk2szqg0jR4dWqA6SMA2dDV/+YHEDni+MgS6XjgfBl7Nt8LjXDKF11kuLqicetwx9T3Z2q2VWUelIKms08R5Z410dBomBI5PRlUoWfG7riwul3e9RyorhEELJAtP3yn/b/BMf7vlautX+Toyfj+k/9o7AYTTBN8KSU64Dpk4YFosa5nAu7ynV5goDPXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lsjvm86t9d2FDmnkwSphWG19QMb5Et4o9jH37Q7yAlo=;
 b=Ay7gfzr+XyE3GASnrxb0pMdOyiEbqF16426G/xyBhA7vt+KZrkxViQZxAITsMNQRf2K5Lp7+m4uqgU8b7rnSNIRvjVoKzZXF/MDrLKgbQykCpFUuHi/OtoHhVqTqqBDqn1usLvpLeED0K+KX/QCJRE/GBxkouANs27rfr34EVv4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by AS1PR04MB9582.eurprd04.prod.outlook.com (2603:10a6:20b:471::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Tue, 27 Jan
 2026 15:45:45 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9542.015; Tue, 27 Jan 2026
 15:45:45 +0000
Message-ID: <75b9acaa-bd2a-42f3-a12b-411b21e455d0@cherry.de>
Date: Tue, 27 Jan 2026 16:44:51 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 15/56] dev-manual/securing-images.rst: remove
 obsolete poky repo references
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
 <20260127-remove-poky-references-v2-15-74bf80cc4e5a@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260127-remove-poky-references-v2-15-74bf80cc4e5a@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0176.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::7) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|AS1PR04MB9582:EE_
X-MS-Office365-Filtering-Correlation-Id: ae672570-6dd6-4887-8e0a-08de5dbb22cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|10070799003|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?elpCckY5eEhEQU9qRUxLZDBjWEFXQTVoOFZSNXlSbzgxWWhHMEpuRmRvSUFk?=
 =?utf-8?B?SkQ3VDB1YmtiRjBHM3lmc3JkeG1xRXRJTjR5WmRYOUp3Q0VTeGUvODFYbmxV?=
 =?utf-8?B?MHVCeVEwSVpVamZoNnNNaVNuN1FHTXJOYVE1ZEQ5SkdpVncwNWM0SFdXbndY?=
 =?utf-8?B?OGtNOFZoMFl3WGgzS01OZGUxSmU2aVlrS1Y3dUFhWkt0WjBSYjJtbVhid1Z0?=
 =?utf-8?B?VkVuenV2UHUyeldrMGJTSTRacTdBdzFaUXNpa1hON2dGb1VXdXpOa0x4Slh0?=
 =?utf-8?B?akJvdjJndUxKek5VR09iT3ZJMkw2Y3Vwc2I2RE8ya2cydDVJUFo3bXprNnJD?=
 =?utf-8?B?Sy81TWFPaVhaR2VMcGhjNHdEY2VqSTNlam0wdVVpOWhQQlRxZi9KN2w2NnlZ?=
 =?utf-8?B?M2V5ZWtYSW9qZ3BVbVZjaXhOM3ladFlNcS8ySWlrSllWUVBjQkVGeUxjTVpM?=
 =?utf-8?B?T0c4eVluNFJPd0pPWE9Gc1RxdjNmZ1Zib3YzYXZyU0VDMU1ocDdjQU1iNHh3?=
 =?utf-8?B?cmZYdUxyYi84TTlvaHhYUE5kclFjK1lSLzZJM2IxRUxvcDd3OXR0MGJ1eUFT?=
 =?utf-8?B?WFRSRWZWQVZ4NmNKOHNCaFdjeXI0T2k1T2Vzb1R0dkJaZ0pSTm1rMjVwejlC?=
 =?utf-8?B?UnpodWZWOG12bVZZblVxemNld0o5MFZTT2J0WUsxZGo4SktqdElKYmVYQTMy?=
 =?utf-8?B?OGNKZEJMN1QwK3NZcDFiL1QrVXpjZWN2cVFGNVZvMjJRVDlGSUJYaWZxVmpx?=
 =?utf-8?B?TU5zajhPZ2VSNnI0SmZoQm9HMVhZRkczTnVSZ0d3VVdpUlFaSzJyREU3U2pW?=
 =?utf-8?B?S0dEZWwwOUVFQW43Uzh4OG5kaWE3UUFsQ296WXB0RHZWd09NUzdNYTNoMk5t?=
 =?utf-8?B?NUtrK3RROWl4U0pSNU5pdzFRR1RmeTJCcFlCaFFWWTBPZXhqaFdhd3dvSkov?=
 =?utf-8?B?ZUpWM3NqNVY3eitCZldMNnlPLy9YSGhLY3UrYmdzRkFIVXQ4VU1WeWE3ZVJQ?=
 =?utf-8?B?dkhlWkY4NFB2MkNHKzE2QjdISmtSejBVeTcxMkQyWDhqVlhKSE9ETnBtallP?=
 =?utf-8?B?TVpacmhXcmN2ZXVSMGQ0aEhzNXFMeC9kMmJEUjk3WkxpM3FhZDJvRVJSYWlC?=
 =?utf-8?B?WnIyZnVGRTltajF3TjZnT1F6ekkyWXRydVgrL2xlSmpUTmFoYk5YMGFjUUxM?=
 =?utf-8?B?dExsMGZybis5cTFnV3dML2RPc1lvTmMrUTdteUFGU2MvbzR2NFA5YVQxMUdJ?=
 =?utf-8?B?Mi9sbmRXRXBNcnpHQ252WTZYM0xpNnYzdGdHU0xGNlYyNmtxZGJqQk4vajZZ?=
 =?utf-8?B?ejZFRytMakpPU3BGOVRmazhLYjFTYmQxTDE2Skw3K003VFl4OUJQWWtTYS9H?=
 =?utf-8?B?N0pIQ1lxZG02ZHRZZUc2NXRRQ3BHcXRMV2NIYngzK1JET0pMekNRNk1FazlY?=
 =?utf-8?B?OFJ5THpRUGFOQ2pTbUhUZFBlUU9uVW9RV3N2ODc1WUYwLzFsejJNWm5EZnFI?=
 =?utf-8?B?SGtxYlJQRW10aG10NnFpSUhTa1FDazY0QTE1UzBoUTUwdmpNMVlDWUU2RkU3?=
 =?utf-8?B?ZDBqMlJ6ZXhHVDhINWgwRlRqa0NWU1NoVzEwRzJQM1paMmVKQjlwSjBKSTdl?=
 =?utf-8?B?akNyUDdHT1BoN2d0b2VQajNXSHNOUWEzQTVNUCtsais3WWcxTTYzWTVEcnFK?=
 =?utf-8?B?WjlUSnNidVhROGdsS1hxMkVpbklEeERSQzRndlZoamdxVURaZkF0OUJsRUZN?=
 =?utf-8?B?QmxWUjNBMXRXN3dHOWoyYzJDUnVEdjlGVG0wQ0tCMUxQblRmaXFlYmdVMlhC?=
 =?utf-8?B?OUdIOEFsN212b2QxS0ZTZWdPRk1lc2NCOFcvUFU2blpRWDFhdTBoWVpGcWtL?=
 =?utf-8?B?WmlIVkxrU1NoemFaVXJzc04ya281YmtLSTBIK2paa3NpYkVFN2Jib1VHWnZz?=
 =?utf-8?B?Q09OZUJRMEcxWjNMMGlmOVdCazNYWEdXZmRSVkVUdUFZQjRrb1VINFNLL0VP?=
 =?utf-8?B?YTRuNWFtM0RCcTRmb3BpcStpZU9DS3Q1WVpFYmFpVWtLV2dVTy93bk9Edyt5?=
 =?utf-8?B?WlVyQ3JxcW1RdElCUDB1UDVKbW95ZkdzOVhPUjhGY3g2c09MbnJ0blY3aU9Q?=
 =?utf-8?Q?geoQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dzFueGtlNlZYMjF1OTRqNzFYWTU1REZPOVJRd0ZFVU1kMmdkUWMwUFVNeWdS?=
 =?utf-8?B?RmVkaFY5VFMxSXNnbE9oSnlKQ0JudzN2Y2tSMFlqYTRTWXdjUnd3RWZHMldh?=
 =?utf-8?B?VEY1T3ExRE1ZVmdJdVREVzJZVzlMVGZ0TExDNWZXa1A1RUJkVVBKWDlXREhi?=
 =?utf-8?B?RnRBS0Q5TlNVOEhXQ3pSMlZFa2Z1T0ZKRklXYTNmYkVPaExuKzIwYUVqaGlr?=
 =?utf-8?B?bnFUUDdtZGgxaThub2VXRk1DZ0tRUGxGK3hBUWcreDlyMEdjSWZ0MXZvRys1?=
 =?utf-8?B?VTNiVkp6YVhBeWVqaWo3RkJGeUhRd2piSmNHelI3UmEzWldWRzhrTGdJc3BD?=
 =?utf-8?B?a3hZMXo1azFWdmNPTmE5UXdKMmRic3B6b09DdUQ3YzVObDhubi9UYlppcWNE?=
 =?utf-8?B?aEdPMGdESGc5aHNJY2ZBakZxb1JjaGFJN1NTRlhkQXF2R1ZWUzFhTUZRZ1lB?=
 =?utf-8?B?eHdJdnlCeG02Tis0eGI0aitKVFZnSzlsbzg2VFVLd2JEUDRKa05xU3YvZDNP?=
 =?utf-8?B?VGlacDI3UFNZRHA0Y3pjL0FjSjhNSW1sa2Zob2RKRndqUlpYTXp6YUI2ZjJy?=
 =?utf-8?B?NkdBbkV3RGNkVzdpYkFOTHdpNTBrWWNuVGh6eVQ5OHduUFVPNGtzRU5VcnVv?=
 =?utf-8?B?b25zMW1RRDhPbm81Z0trMUlYK3dwUGZGRmNQanp5eVNIaXk1WGl5RWpMWHBP?=
 =?utf-8?B?RTluMWFWVmJ0QVRYQWpoM0ljK1A5bXZQVVNlUWpZT2VVdkVzZTh6bE9Iamx6?=
 =?utf-8?B?endRckJMT3BTWlhxNkxUaFB1ai9RemM5NGRQdkR0SjNteU5FbHJaYlR4em14?=
 =?utf-8?B?TXlzdjFWNEttcGVtSXdBdTNWT3ljNHp2bEZJUzd4VWx3Y1ptcFVMOWlPaGQ4?=
 =?utf-8?B?MGFWdUV1K3hrbnIreFFSZzNBMW1YQTRKdnA4VG00VnpBSHhxbER4eXh5dlNx?=
 =?utf-8?B?bS9wcFYvdEU3OXgvTVlleUYzVjEyb1pyeDZyelFZOXVWdnhYMVdDZ2hUYmor?=
 =?utf-8?B?MUlSUHdhS0lxSGQ0T2xMblk0dFYraitZd3NmZVVQbXJiUkp0Q3hQbFZDaEo1?=
 =?utf-8?B?NGp0RnJpQnc4SkpXU1hzT0EwRDFwZndNQ2dxUUdGMEh5c2Z2MXhmbTN1b2FF?=
 =?utf-8?B?aEpuQWV5SlZSajdPVU5ORGszUm9pZ3ZPcnZVcU4zVWZ5cnlJZ2xQbEk1ZUho?=
 =?utf-8?B?emNPUm5qcjdaaWRhSUphSWhad3BTMnhoZzRwYnVHeHNJeXFXeVNZM3QrcVBS?=
 =?utf-8?B?dkJTQUN6alYrdEhISFFCTGZKaGlwTnZzM3ZtcmZzRTExaFg1OTJSZk0xSFZ2?=
 =?utf-8?B?SmNJYW9pR1JLMUNPSjZQNm42dStrclg5YjR2dXAxZHh5UlRDTy92bzlyQkNY?=
 =?utf-8?B?NHdFUnEzMW1kTk5XK2I1Zm50SGFUTXc5d0V5ZGM5TUhGRmpVZUVnRFdNeW14?=
 =?utf-8?B?ZFl2bG1YMTdhRHVCUDB5Z1gyTGJ3bnhsTnNObm0wcU85TlhVcStDYXUvY0d5?=
 =?utf-8?B?ZmFCZ1d4dFBjK2lqc0xyY1cvSzk3UkR0Z3FlSy94NWpaQ01LOXZBQko2YkVv?=
 =?utf-8?B?UjNIelNEd2FSbmxCTlllK0ZEWWJVdjY0WlJKa0owWG9kamdNbGd6b3Y4b09Y?=
 =?utf-8?B?VlhPZE5nYlpZc3lVdWtOWWdmdU1FekQ5QTBjYWxmdWlGSTVrVUJGMS9SbU9h?=
 =?utf-8?B?UTYzc1Z4UnBOekR2YWVBeGQ0UmRka2FIN3VINUlvamZiYW9MeE91RE5SbThZ?=
 =?utf-8?B?U1RHOGNKZHlORVludEF6OXkyWldhMkp3MVVZOC9NYi9NL01rKzEzdVFBM2cv?=
 =?utf-8?B?RDB0cUVvaTAxZFZ6Vll4SjZvZWMxWVBUcnphSG0rSks5STBHbjZvMHBFaXlx?=
 =?utf-8?B?RHNZYnE0TEYzWUVKVlBFZ05Oa1ZNNnRPRmlLUk4rb200TDlqQXlkR01kOTAx?=
 =?utf-8?B?OGlCWFAwRXJod0sxZ281MHZ4QlNsejFlODdDYnB4U3gxSkFUS2RnaVRoaUJT?=
 =?utf-8?B?V0tTdXg5N2c5SlVMTkh1dEVGakJ4VG1rdmpiY09WMHgzYUJkTVFISTB4WGZj?=
 =?utf-8?B?NnhlcVBMOFlzV1EySks4QVA1UjFCaHhSZ3hmMTVZWXk5b05ZdkUxQmc4K2FI?=
 =?utf-8?B?aXZqZkVWQ09iZ1BIZWNZWkpVaXEycFl5d1ZQU2pDT1AyVVRjNkw0ZjR5bSsz?=
 =?utf-8?B?dHVKMDhMb0g1N3liZG45SmZCVUM5S1pjamE4L2QzZTRPRXJrU2VHOGdna043?=
 =?utf-8?B?Wm5UUHJTS1g1ODFnVXJrUXRmcXZHWE9HR0gvWGVETm5qcHZ0alM1dlI3UXhN?=
 =?utf-8?B?UkpHMzd3WW9xbXBzLzcwaElDanJFOE1KVHhwcTlYNitDaC85NGp6VlJtTkl2?=
 =?utf-8?Q?rgVmFh6hEe3zOMtUCi26ViCnDu4QUIXXNxTPp?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: ae672570-6dd6-4887-8e0a-08de5dbb22cb
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 15:45:45.8115
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wttUe2rXEeaRDsI2/W2Cxp40StI/gcqbyr2YtldLyQknZtgcfpqEgWB9a/8SicdatD7vYa1NGb8+EyNudYwbjTxIIy8aueumIom0D17PxOA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9582
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 15:46:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8743

Hi Antonin,

On 1/27/26 9:19 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Remove references to the Poky repository, replace by OpenEmbedded-Core.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Minor comment below.

> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/security-manual/securing-images.rst | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/documentation/security-manual/securing-images.rst b/documentation/security-manual/securing-images.rst
> index cc6f95003..e502f83e3 100644
> --- a/documentation/security-manual/securing-images.rst
> +++ b/documentation/security-manual/securing-images.rst
> @@ -50,9 +50,10 @@ more secure:
>   -  Regularly scan and apply fixes for CVE security issues affecting
>      all software components in the product, see ":ref:`security-manual/vulnerabilities:checking for vulnerabilities`".
>   
> --  Regularly update your version of Poky and OE-Core from their upstream
> -   developers, e.g. to apply updates and security fixes from stable
> -   and :term:`LTS` branches.
> +-  Regularly update your version of :term:`BitBake` and your layers (e.g.
> +   :term:`OpenEmbedded-Core (OE-Core)`, :yocto_git:`meta-yocto </meta-yocto/>`,
> +   ...) from their upstream developers, e.g. to apply updates and security fixes

I find the wording a bit odd "update your version [...] from their 
upstream developers".

Maybe we can simply remove the "from their upstream developers" part?

Thanks!
Quentin

