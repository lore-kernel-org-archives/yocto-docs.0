Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A61ACDB479
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 11:05:05 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4382.1782299100588109113
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Jun 2026 04:05:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=OEVyCwHf;
 spf=pass (domain: cherry.de, ip: 52.101.83.23, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nZjAazXiSvDzIZx8lyqHwYyu5W5iL98V8ka2Hc5KkeHGsQB4NroLrFj+dESB0vYSPn5Zgxa0WiwN2G6yxB9J1Sx+7pMChK1oWGAP3tqFaq8w/9rkX4R7wl55C7q5O/ihdIWEt9PD+VFI/SD2UD2LTdvAty/pC9Ta2a4vALyaHQaHax/aQMmUT8i+uhizbDbvFmr2zhi1ffQ//2qIrFigEE0v7U3lMJaBF5SGEH8X1GSaTitGtjsajQw4cT5uSLsekjYk/2b6XXg2sLj9B8eaGbopSQQpXv17gFtPa46ek1qcGMS/z37x5LXXVsB27odPfBDASi/L59sY/tvHxffwxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TS9WE8p5TmnroEcZgRHihf7KrCgEGJx94QgRLSX/z9U=;
 b=dfQaylZyKrQki2G/DKoUDkioVrSOdBfVgXXPfFUC1i7jHDOrS9fwLBqF91q7mlXBPzXn8i5in9ST0+/EIs7IqzAHHd5bO4dc4PBpcYWA2nf91N1l3tqMClAa3QtJGC2UIfLD3yV8MmfcigqsvNPw5GIE5q6Z7GZbaxfUQHtTKXuB71o+eZoNVvFcgQWgzYUloN9AJCUtJVlzfjTXGw83qeC+ABfqAO2AP5L8T2aTGd0MB6wY4AbIlNnUa2NU8+Zk7raKKS9VzxCrxwFTDH6YhbrimojlNxlK4bHD+nTYfU9YDUDQ7pxcFd+bqkE+roVmkCZOGk7WXv6ZZXeM/7OuFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TS9WE8p5TmnroEcZgRHihf7KrCgEGJx94QgRLSX/z9U=;
 b=OEVyCwHfuWYf2oJNhj8GJuy3jJfGyFjlD3umahde3CqTI9M7k25dIuBq39coK/joUNH75pqxj89eaUQMMyaLo2+jH/CsG75gVzTzzOOBvYMjMUUK8AbKNWfPgxOO7SB/SfY4RDfmx0bgbhEauES/ARS/bUJtq/QXxsS2McVSgFA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by VI2PR04MB10641.eurprd04.prod.outlook.com (2603:10a6:800:272::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Wed, 24 Jun
 2026 11:04:55 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%5]) with mapi id 15.21.0139.018; Wed, 24 Jun 2026
 11:04:53 +0000
Message-ID: <29ab4811-bc55-41ae-8e36-d739cd4854cf@cherry.de>
Date: Wed, 24 Jun 2026 13:04:52 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] test-manual: grammatical and URL tweaks/additions
 in "Welcome" section
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <fba6cfe7-72f7-a120-7861-1ec02c4cb3c0@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <fba6cfe7-72f7-a120-7861-1ec02c4cb3c0@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0230.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e9::20) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|VI2PR04MB10641:EE_
X-MS-Office365-Filtering-Correlation-Id: 59d0514e-8214-4e68-c5cd-08ded1e06b41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	UYH9/nzY7EWdGkabq06wMybN4kCz0IiVYJZucdTqF79+tNAhCIvZUZPK1B0hr7FGf2eiGDxdtEI2vEhUgSXsw7U7tY/YHQWw2GCyX+WhA1XSVnwHAT78xLQR/lJTBj7RMRiZvp8MRRKtICdJC5J46mG6f001au3uQdGAC+d4KXcUlr4sBCSJdic2yZCdDyF6wfaTzPw7WhS1xqKKkYzLtBgI1Qy0tCSM+sv5d6dF+mTkA75eq2Fu2rCAVBP3yP09ZiBUtKuprPe4pzPG2YFdwV6VH/FwaWfGs4RKJhZqNq20s7meYU05M8j2NIJ9AWN0WDvWrk0xXFwU+QcW5tkxcp9+5Gv9ijwRWqvJ7QEgo+4EAKtmBGfIe5ub+Y8eM7y27Rya6TwRllWIDIqgWofu4G6JUo679H2nH8au0TdE70vI7gP0VRoky043ALJDJ4lRU36hUs1a3/WkFexg2g7yRTvyyrmuqVMFO+EPkeHJOzt517z45sYP2OZyzXGFsxbCdOGy0yypzd50LBsyAYyuq77eHayTDy2B/bDaeD9uGZut3XY4FZZmKRLDy5JNj7Y24f5qKneRy1Kyqe3DONTkQ1GzgyMK/TeEQXH8xi2JhsXMqFCmSHdgKGe3lOkYm0awHhBwl8f4pFJtQk25zwdyHLLIPJilirYSrrfPMmTTOhw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?N0U3ckZEK080SWlZbG5CdHhOSHpmUzQ2aXFHeG5KbFZjZDhFb21QU2x5Yjlz?=
 =?utf-8?B?Y01nUTN5RU96UzRxQWQvbWVBR2o4dW1sRnhWUFZmV2FTMSt1azFMNFp6QlhC?=
 =?utf-8?B?Skdqd0Y0aUVqc3AvNnU1SGlWQy9QZWlTRmFPamdqSjV4WHlqd25LTCtTQjlX?=
 =?utf-8?B?RmlJVU44RWQyUW1RQ1NrMnBieUxEcDBFMUFWLzBiTVlTSkcyU0lLOEZMYjJq?=
 =?utf-8?B?QnQveTF4bUVickxudklCS2V6U0UxYnlkaUxrZFNHMjdVcmZLaXdRMFlWSjJU?=
 =?utf-8?B?SUx1REJEU25xMUJ0YThudEtiVFpvZXVlWlAxWHBBWVdxYzFsWUZpZU9YSTRU?=
 =?utf-8?B?aFlWdUVGYmd3UGJMek1vQWswcWFST0ZkVUFUdUV6QUEwTFNMdEtadllDcXVj?=
 =?utf-8?B?b3lNOTQyTG04U0tibFRNdUovZlNNMGMzOXdLZlJQMVZ2OGkvRnZ4eitFZWNY?=
 =?utf-8?B?VC9EWkswK3NiLzVobnpzc2xvQjN3bXgwaWUvNEQwSVBOankvVm8xVXRIb2NM?=
 =?utf-8?B?S2o2RDk4UWtENGJucnBoV2ttTUJxWTdvUGIyTmNlUmQ5cmhnWlZrZHRSUkFQ?=
 =?utf-8?B?K211QlJRaWR3QytqSC9wMWxqd1BGWFN1N3U1cTBkc3Jndzhza241bHRMWU9N?=
 =?utf-8?B?V216QkpKN1p3YjQ2cXJDQU45NkNkdWJseTVielRET0JhRjJkeU5BdjllMGMv?=
 =?utf-8?B?bXVCWk9NSlJxTTB3bm9Rc1FnVFExeERjM2x6dXJLY3VDNFNGSGtSUVdWaFVq?=
 =?utf-8?B?bW1QMFNWVVJPR2FNWjlDUjlPNnN1NS9SamdzM0QzV0JKWHpKYi9DV0JiNUgv?=
 =?utf-8?B?aUJDSmh0QmtUd0FwZ3A0MDdqSWFYdnR1eFhhM3BJQ3EwTmk5bkVpdzIxcWFv?=
 =?utf-8?B?V3VIUHJTczlhMm85ZVl6KzRtNWpBOFo0bzlmOThsY3NtM1RNV3BnTTAwVFhK?=
 =?utf-8?B?RCtlMjZIb0p2MjM2djlmNGtrUEJiM1dEdWlHRzBNOGRaY0pSZ2xUNmVnU1Rh?=
 =?utf-8?B?YlNtWFo3R1dxbDRodmJSc3pvMWtSVEVSUlhzWEpTL3JQTUVnSGlBb200aXFi?=
 =?utf-8?B?Rk11aUNzOHFIRTJYemNVeU5WaE9RNSt2SlBzRlk5QjUvL3JGa1FHZjMxd2ZH?=
 =?utf-8?B?cGFiZVUvcUFRYml4S0Y2T3E5enpuSC9LNFlyOTZqSTNaYndybHVXWmVWSnhp?=
 =?utf-8?B?STZYSHZWY0dYcGpkZHcxcFJhbXNremxkRUdRS0p0d3pwZ3hRNUUxaGNMMW0r?=
 =?utf-8?B?OG1BZ3JtWGd4aTUyTVcyNnFERmEvUDJHWm9UZHprNDA4M0VudG5WejhySElC?=
 =?utf-8?B?ZzlaamFRQWJPMFVxdzlEQ1dyc3JEa3RXTGE4UDh3bXlrc0J2NUVsUGdLSWs1?=
 =?utf-8?B?NWQrWHI3b1ZwdnRWaFRDTTJOMkVLakkvYmJLUFJEdmswVnA3OGpXaHlSQ1NU?=
 =?utf-8?B?NGEycnMxZkZJYlFYc1VLSEFmRjZpcHlwM293NTB6NUdseE9mTVZHYzFWb1Nr?=
 =?utf-8?B?VmNlTXJ4VnZEVVdLUWdkZE4zTVZReFRIdko0R3RNaUxyTWw3WnNUUzY3d0Q2?=
 =?utf-8?B?SDlOM1pxMzdrZ0EydVY4eTRaSU5KUU9lZXl2SmFqVEYyKzRsUFNDcXNTeGFX?=
 =?utf-8?B?cTdyZHJzNjY0dmdpcVFBM28vVVBqZnh1RTZwOXJhS09HODRmeWZoYzlyenpC?=
 =?utf-8?B?Y1o3WHJYSjJkUVFTTThleEYrMGtBVnVhdzNhaFQxTGhtd2RZUkhpMU81WHNQ?=
 =?utf-8?B?TG1icUxzd1d6aVEwaHNZRFEwT09IK1YxV0hZczlSOHNxSWF6bVRoRjh0Rkdj?=
 =?utf-8?B?elc4a0svT3dqUDRvYWZEY3JObzgvaE51ZTJFLy9yMVpKeFZGdWxwSGlIMXpT?=
 =?utf-8?B?R2RxcHpyRTZVTWpocUg3TnZqNlhzZ0IwSExjUm41VGhDbkJkRGRxWXVtSmt3?=
 =?utf-8?B?LzJiQk42cnpFVEZtNVo2WW9XMlQ3emhaMkoxU1U3OVcwYnVsNzVJWGxCazds?=
 =?utf-8?B?WmpqdzUrelVjK3V1Yld6M0I1Q1loRGFWcTM1aSszTmxiOG9pWDNhdTdwczFz?=
 =?utf-8?B?bWlRcEhZLzVmcFhaNFJDOHJaM2RncjY2b1poVytGMjJ3S3JFZW9pbElMREg3?=
 =?utf-8?B?c0E3bU9XdEdJRzBuRjRDaDJjNXBaWlZENUJvYlc4alpNU2g0dVpKT1FCUWN0?=
 =?utf-8?B?d1ZsbXRDckdOVUFLTDZ6dTg3MmVUaUZMSHBGaUVjeUUzWndmbVljc3VmbVQv?=
 =?utf-8?B?bUw2SnIwenpZOGkrY2NXL0k2MEgrNFAzRnlmbStDdytTSjdPb2tVb1FDM3oy?=
 =?utf-8?B?aHFkTFNrSE9CMUNpR05TSnhrN0ZVZk1xalFSdzNnT3NaZ1FZUkQ3UT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 59d0514e-8214-4e68-c5cd-08ded1e06b41
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 11:04:53.7044
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4mIoK4fl2KiLq2ev/r4XE3jAWWYWFOoyjrV9YUpyE552ZK1gdQEtchdrBoBHSFbbYVfNULuvuy1HG/rgkq+F6NEFYLPHT5dSSAINEfFTUII=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10641
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Jun 2026 11:05:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9863

Hi Robert,

On 6/24/26 11:59 AM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
> Changes to "Welcome" section of Yocto Project Test Environment Manual:
> 
>    - add missing word "with"
>    - shorten to not mention this is a "work in progress" twice
>    - add links to Autobuilder repositories
>    - add reference to Wikipedia "Jenkins" article, as is done
>      elsewhere in the docs
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

