Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63060D12D74
	for <webhook@archiver.kernel.org>; Wed,  3 Dec 2025 14:54:57 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.15])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17132.1764773688843576807
 for <docs@lists.yoctoproject.org>;
 Wed, 03 Dec 2025 06:54:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=bz5oDFo6;
 spf=pass (domain: cherry.de, ip: 52.101.84.15, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VQshahFTjoa2ISDEH6Ffjho1nncskMa6ChM0QMrEnuJ0WNdZ9LElvqsXicciqr2/ZO+6BWTJPwqaaSwCY1MBwfqA67bsBm+bAnIVcDvHWEhuBwiO1TIpFewgBeAQTHLo/289/HT5/ipSiSaNfiT/XYkFwX4BIq7p3H8yRz9C092/ywOX7vAjyqcvAWVKd5xBWqSsDSW/IDZMDQdxDT+x7yRx6iv4yf5zSB+TX/yD1nNyLruZMHmSeLJJvUmR8YcqctSzE6q7+fsdzRe9Wzg0dHh6y98G7yF6/PZJvahSvbGZAEEGby28zGKgh9pMtcu/1u/SEUf22HIPdMOn59TRnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0HqFgA6et7El9hB42YJUUkn3PQNJT+2HN7LrA/V7Ax8=;
 b=SJPGYHFzy1kLdXPTmzWV1BFU4Jc77b21ke3Eie/DvzDnTLITWdvOeD8FNPYZMEXgL2u8VLb3nA1Xn3bH9y6BQfqobiIFFnJOfZqyQwqtUyWeB4yO2IJPf6hFwbp+zJ2oXAoF3so+kg4yW4pJk8rYXfMV0f7vikHHFx8MsaNBTejxPG57lJHhU7kRotRh2+/o7MSkdYFQepbk5uBNJ4AyIlxB+5HniRA6NVJAQoFtQ+O3mYqXcHE+9hk1yxjKxVl20e6wWzFI4y1U+f3hm5k5TOLvk0Eu4nIm4IyQNoqPBtoATlg+0t5oLuvuppGFCwyYAwWGkgITkj7+cjhQCnd3TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0HqFgA6et7El9hB42YJUUkn3PQNJT+2HN7LrA/V7Ax8=;
 b=bz5oDFo6cs8Wbt9WD2yW22yJ8dEJWJakUREnI1N+WXx89WwHyfGVsSLP4xecqtG1mPlye+obNxsGVeg/y5jUACAwOrZW17q6gUB0vkrQzSgO3jWc9An15MGSOrRvMwwhWUSQ1nf9Mtx6FEG3CC5JtG0oCaFhOvzvI6zdbdAXywg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DU4PR04MB12026.eurprd04.prod.outlook.com (2603:10a6:10:643::14)
 by DU4PR04MB10339.eurprd04.prod.outlook.com (2603:10a6:10:565::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 14:54:46 +0000
Received: from DU4PR04MB12026.eurprd04.prod.outlook.com
 ([fe80::2c21:dc0b:a3c5:531b]) by DU4PR04MB12026.eurprd04.prod.outlook.com
 ([fe80::2c21:dc0b:a3c5:531b%5]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 14:54:46 +0000
Message-ID: <2623139c-4604-4cff-8420-5de671d564d7@cherry.de>
Date: Wed, 3 Dec 2025 15:54:43 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 1/4] ref-manual/svg/releases.svg: mark styhead and
 walnascar EOL
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251202-release-updates-v1-0-889513ccc384@bootlin.com>
 <20251202-release-updates-v1-1-889513ccc384@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251202-release-updates-v1-1-889513ccc384@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0166.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::18) To DU4PR04MB12026.eurprd04.prod.outlook.com
 (2603:10a6:10:643::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU4PR04MB12026:EE_|DU4PR04MB10339:EE_
X-MS-Office365-Filtering-Correlation-Id: 45059f6b-7502-4f6f-06a0-08de327be56e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|10070799003|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SzZrRDlZZE81c2FqRForQjFBYUhuN1RmYW5US1k0Ni9XOWhDcXB3bzRoRFZJ?=
 =?utf-8?B?VDFvWVdQeFJ2MHZMUFZjZjlkT05waUZCUUJFMlVhRERwd29QWDdCamlFelh3?=
 =?utf-8?B?M3NXK1pSRyszSFh1L3hYeFpoZ3ZtdEZIeGRzSGhOZDZXK0pVUGdaZEx0ZzZE?=
 =?utf-8?B?b3lJODd3eDVCZEJMZHlWc0E5bVBkbzJoKy85YzRiWDJVUmltRE9nM3orUzkx?=
 =?utf-8?B?dHp3RzlaVnEvNUE3QU9HY1dRVzR0RzRtajhTOHNaV1UxNlM1NnAvVDRuaG1I?=
 =?utf-8?B?N1RPNm9jOVI3R3R3T3FzZVowblJFa25WcDMyRWwzeGVVYXhUbDh6bnZWdUxW?=
 =?utf-8?B?eHFid3FSQWxqVmxXVW9MOFMvMkFlbFp5QjIrc1daWE9KUXpZdFVtUWN4QnlC?=
 =?utf-8?B?OHlZYzVCenQ2NGNvalRydHRnUVl4aXBmSDNKam9xZjdua1Fza2ZOMGpNR296?=
 =?utf-8?B?QkgxUmd3N0N3T0JQSldkejVHN2xZdStuci9yaUo5K3dUVFpCRkJ1Mm81ZUlG?=
 =?utf-8?B?bnpDc3gvMDcwMDlCWUVhem9DWElPN0twdWlNcDdtK0lxS2hVVXFEam85VWJy?=
 =?utf-8?B?WXNsSHhQUXJpREJoSzViVURpOFkrYVg5OG8yNVk3Y1dNM0pJOHh1R0Vkc01H?=
 =?utf-8?B?M2pnYlRPZDE2eUlUQS9PZDJqN2FzTStMMzZxaHBta1pwbWNRM1ptM3o1MEhj?=
 =?utf-8?B?Wm8rVjFSS1ZTdDBJK0tIUW9wRjlDTTFRaVJQODROaHZzU0QwZkxqSWZSQ2Rt?=
 =?utf-8?B?OGlCSEphN0tNWnM2azNMa3RIc056b3JhRGVQR0h5L3BCN1UvQ1E3M2IvMzc5?=
 =?utf-8?B?YjhXZTM1b0N0R2hKRVBBTXJFS1BhdEQ2bkpGdllqN1MyUkZIWTdQb01vL2xp?=
 =?utf-8?B?TkZ3YkRQTkhJblhiamhBZFZoazh2Ty82b3o0MjJ4QTRhQ1dKOFd6eDEvaWZa?=
 =?utf-8?B?dDBtMjZIc1VyL2JzM1J5Nk82WTM2Sm1DeHYzcVFIelBNb0I3QWc4ZTBzTmpU?=
 =?utf-8?B?aE9oOGY5Z09RWEwyMzUwT3RWR04vcHVOb291ckswS2huU3FwbjE4TVBlUExX?=
 =?utf-8?B?azd2bW5wd2FLN3pEYkNsWGVKNVVPWDl0ejBqTlE3djBmYXpKQ1RyWHB0TkYy?=
 =?utf-8?B?UGpXb1FCK1hFUWFxWDZSRmM5SFRhdUg5TkFyQzF3Z2Mzd3pGN0NiVURUWm5q?=
 =?utf-8?B?MnFTZnl6MkliTFMrL0NobkJjSGFqUlZKVkRVMFMraU9neXdpSUpsWTVoVlZM?=
 =?utf-8?B?SzhqVlZNWUMyWXo2Nk1lTEFTQTlxVmQ3UzZCQUtHOU1ZN2c2MElhWmovMHJX?=
 =?utf-8?B?N1Noek9mWnRFbnlPZHF4TG1IcjRlNmJEZk1NYmo0Ti9QWkZyaHJlTkVPRE9v?=
 =?utf-8?B?NGtab2xsbkNvZ1NKdkdXaXo4WDlPY282NVJlWTFjaWF5Zmc0MTUxNUQ3cmUw?=
 =?utf-8?B?bGVITFREU2dzS0NaUVE5TTYraUYxeVdsbEMyaUJ5TTQrZW1sUWg5ZWl6WGdQ?=
 =?utf-8?B?bElCSHZmazk2YmpsZ1c0ajJWRzlqUzk4VjJ6OGZGckMreWJtTVNrRHBpdW8y?=
 =?utf-8?B?bklKQzgyQ3AzODJ6bE1haXltZ1R1VU8vSjFJMDJZMjhrMnZ2ejAyNSt6R3A5?=
 =?utf-8?B?QldnTG1QdlFiSXVjb25pNEx4L0hOU1JYaGZqY1hieWZkSUE0NVF3b0R0RWRn?=
 =?utf-8?B?b2VvZkJyNDlxbmUxdXlwYmVZVWZRQXdRMlp2eUN6Z1lxY0VUYjJXYjZVa09R?=
 =?utf-8?B?ZmU1djdDOG1ldTZzUUdBZS95UUNBclRYY2I1OTdsWnNlK0R1cWMrSlNTUW9L?=
 =?utf-8?B?SHJiVER2Qi82NWNlSFFrZlVXaHZrMHk0TWNNalVDWHl1SEtTRjRFTGtVQTA5?=
 =?utf-8?B?aUxEQVJEa05HM21zaW9CdC9vdUl0bDg2QklEOWlMWWVhQlRnWlNkcnY4UDha?=
 =?utf-8?Q?vdnc/0cditFTUhmTnthzDhpEz308VAQZ?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR04MB12026.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(10070799003)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VXl0cTEySytNOFY4Sk1UR1NvVytUcWVkcFhGM3R3dGJKT0U2b0tpK2MvcGNT?=
 =?utf-8?B?czdtMkNEdjZzcjZxdHRJSXpFcS9pSVgxNmdKelVwQ2lIN1RGVjZ5Uk1VNmZz?=
 =?utf-8?B?eUQwUk1RNGNaOHdrTFlXUVlKL01HRWVCUlR2SWhQc2N5c3JyQXl5YXpuL3Nj?=
 =?utf-8?B?b1FYSHZnelFPeU5NRy8zSStJQXBQUXA2QnZYVkVXWFdXbnV0L2VKQ2licUR0?=
 =?utf-8?B?akpQNzY3K2tkSjNOMUU3M0swanZteDA1dGo2Q1FSaDJ1ZWxEUXBEdTIzK1FD?=
 =?utf-8?B?Vk1kNWFoVmJ4dzlJOUNadWdiWXhOU29qdU1sK3ZpMWtTeVBxVzdQc2doa2c5?=
 =?utf-8?B?S2lwajBSQ2dha1hhOXY5TWYxaE94TFhPWVRobEg1a0p4aytNaHZ5b1p0bnhn?=
 =?utf-8?B?SytRcHRETHBiNm5kMXZ3T05WTHFlZTZEaklJcnAzTjAvQlVRbWNUZkxWc3ZT?=
 =?utf-8?B?a3ZMbmpsaUl4VGtxZmlKV1FJcGdnMVdmWlh3bW4zUUNBTVNsMG9GOGR5NjdP?=
 =?utf-8?B?OFdqNllxRjhzZFVRV2QyTUtqR1puRC85U3hWOXNPejllRkpUU3h6aDZJUnMz?=
 =?utf-8?B?dVZaY0w5VEtLQ0ZFMWhMUWpGSkJiV2RucEcxa3RtT01RK2xZdnZScmNlYVlB?=
 =?utf-8?B?aCtDbGNOaWtud0htb3dPWll0b2dKd0tjN2JicjIzSzV4NkxmeFAzNmlzVDk3?=
 =?utf-8?B?Q0hFeDdjTVRYRmVBQ3ZycUN5eHJEVnd2T29qQjIyMGF4THVrbVk5R0NJTGRk?=
 =?utf-8?B?bXlTeGlZMVVLUVRpeUc1SlMrNUVOSi9zOWRMcEZONDJESXVZeFpabU5DbWdC?=
 =?utf-8?B?R3hHZ1Q3SVZIbkRhemxkK3lYRFpHUjZhUit2UEZSUjR2MmwvTmgxT2FTOS95?=
 =?utf-8?B?ZTQwNzVCMlJuUHdJY0FJUTgvOW03Q0pyaWZKNnZENDRpU1RoT0lpK3pWWjEz?=
 =?utf-8?B?SnJSOHNQaVhTeHVrdWlCUVBCOVJnd25aNW1zVC9ITWJkSTgwdFBxcWpCRTJI?=
 =?utf-8?B?NzRBamFmTld4czJUSnRKdkdpOC84OFJ6T1dqOFJJV3Q2cDN0d3puWWRjdWxk?=
 =?utf-8?B?ejByc2RnUFFROWdLUW5CM0JjaERpYXUzejlYWGNvbXJsR1RlMFp4eFVKTHdV?=
 =?utf-8?B?VzFpWHA2OEtabXByM2RDakN2Yi85SFhSSjl2KzI1U29VUFpkazN1eE9Mc2hE?=
 =?utf-8?B?UmNkQWdwMWhPWGlRYjlHUkFlUjU3M1RjcTMvKzFqcFdMeDU0TUNqVjg3WFJL?=
 =?utf-8?B?aW9aZHpWcTJjblpyWnEvWW1FUmNaSzZPMzRzZStTODEySTBvSDZkNWNwYThF?=
 =?utf-8?B?Qm1nRXoxMzcxSHBudzVwcXZlVUc4b29QUDdCMnovdmJYWU5qSFcwWjJqMUFa?=
 =?utf-8?B?TnNXOGFadkpZZjNWR0FSR05WNjFtOWxlZklFV05kVFA3M1ArZFR6SmVyaElK?=
 =?utf-8?B?c0tpWnkyd2lkWEd0ek1vaHNET2hFdkx0VTVBbTFtSVhwa1VzV3lwSExVR1dH?=
 =?utf-8?B?NG5wd0FaTy9hdEpKNmhJdDZmR1hDYVJ4RytPd1RaeTVwT3RpVTdkZWtlckl2?=
 =?utf-8?B?Zlp5RytGdzczQVhla2lBdW1JNWdRUDl6SWtjVi94Q29aUXUrUnJqNG01Skh1?=
 =?utf-8?B?Y0xNVXRZQ3BFS25JV1R0U0hRcjJzOEIxdnhBbWY3S0FTcjVxOGZTWGVPWTNk?=
 =?utf-8?B?RjhNdGMyMnJsQU5KN0lDNWJ4NzhGd052b1IrUkw2eDdnUm41b1MrbEZoQUUv?=
 =?utf-8?B?WG9SQXlWNHNjZ1FuaTFhRjh5OExZL0VTQVdlRHZFbUt5SThhdjRCa3BrVmw5?=
 =?utf-8?B?RVU5QWdyQVd1UDRaQzViVDlsNWNLL0puYzFtSGFyRk5SWkV1YWFXS0VWK01r?=
 =?utf-8?B?aXpFYndzYVVHT016ekhNRlgrWmNuZWdYaldkM20zczZTQkR4WDhraW1tK3cz?=
 =?utf-8?B?L2JNQ1FsOFRKdTBwbFlWTlk0S1pjZmt0aXovV053YlAwYkphZEdMUTNCcCtQ?=
 =?utf-8?B?TEJHbUZlZWtEbjJNRFhCb1lqaXl3clR3SFZiWHplZXJGV2JTZXMvNWNvZXNF?=
 =?utf-8?B?M2dDQ1ZMOFVJR05idnFHejI2NHdEM0F1WUJlQlprY1hHWldUNmpWTGpFUGNM?=
 =?utf-8?B?dkhVbmpmSWtiemd6T3E4QU9BeUo4TzVMTndkcmdhblVRaTZIUXlzK1czWmxp?=
 =?utf-8?Q?xOPozCUKQHdJjvcEL/kDCMQ=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 45059f6b-7502-4f6f-06a0-08de327be56e
X-MS-Exchange-CrossTenant-AuthSource: DU4PR04MB12026.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 14:54:44.5976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b1OKS0Pp9Mc4lBETBReWV4SL0UOkx1Cq8kmBgTDVk7ZOfU5eS5hih62nZURp04EEhK02Wu62m/LWYMFoHOi8ii7DJFK0JLcQGLvS5Cbvr3Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10339
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 03 Dec 2025 14:54:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8195

Hi Antonin,

On 12/2/25 5:14 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Walnascar has stopped being updated a while ago, and Styhead is EOL
> since May 2025.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

