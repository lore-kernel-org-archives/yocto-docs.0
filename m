Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 201A2D62058
	for <webhook@archiver.kernel.org>; Tue, 19 Nov 2024 09:38:39 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.43])
 by mx.groups.io with SMTP id smtpd.web10.16988.1732009117698833765
 for <docs@lists.yoctoproject.org>;
 Tue, 19 Nov 2024 01:38:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=hcGGyvtV;
 spf=pass (domain: cherry.de, ip: 40.107.20.43, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IzhZmneHfxlkV5NM99eNmtOex8QdM+HDb5sxFL+zf1vafDkS1aV8zDldnDbape7BRomsOfGTn/U7zuyFRpgsQN0zIr9pWsdak+/91g4wtFLMcFYVne/1y/gPZsgF5gFRrdAt/BYC+tRq8I1fG7Wr8Ho4MQm4XHEu7ophu3ELCtMOoDum+n7b7I3l+PRPg4TjG3XoyQZ1xFiZBqEiWvBvDQyuLcZ4ssZ1Ov9+oG2wQ+m0IjkEMsrl+tmv5fWnkBJLvNg7Ls+RGAM+KmTZXiUNaPb1tZKMlXA7u/tBpckDpVL4euNLABrQBqD0k2YG3C05s8mXJey1OPOqE34WBTr5RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1nTPaWo/SvqrRNoZaenWQ24eVcdkdZ97v+3tY1amJAc=;
 b=WTNsmsPeuPfWLJe+s/YJmi2xR8uVsZKE/ZUm61J196T1tzmrHl2nZ+rd2KHViifPU1FKo2LYzw0MZZc8h91YsWy0jRc1UEQMpUIxEDHWkXtNnyOflRKfBr3PWfotDOw/n+2Jv4XXmf5GMtg5D5hVNOo3uRhdUar+NWcItaC4NnplysnSDDEMW1t8TTW4rA+fOZEv+9bOcxAlLuhCfgpD2uBgQQHrFm1E5rqVdRVHHi/x0so2mBtiktuRdT/Sstij1Z2ek5li0PVhjnDHTVctk23XtsknQsgvtmkDOKZJcGiC+AkX7b2DnbEpaBM1TQTKlfggq/UBbMrYAptWz3TWSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1nTPaWo/SvqrRNoZaenWQ24eVcdkdZ97v+3tY1amJAc=;
 b=hcGGyvtV2p/iytzz57W5c4OE+wLwTjO+oPrzGjNAy7VWfARogdv/CcJvz9MDoBudDzRb+pAG3yaTZ74aphFTWk8Wm6e3FK+CLa/yNHPOpYbIdTMNv4oonPgmicrTogQ4FyRgW/Wfp3aDBXaZqWNoq6L2lxn6s9F/On/Y6Hxewrs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by VE1PR04MB7264.eurprd04.prod.outlook.com (2603:10a6:800:1b1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Tue, 19 Nov
 2024 09:38:33 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8158.023; Tue, 19 Nov 2024
 09:38:33 +0000
Message-ID: <5b61d56f-b04f-4fa0-8249-83c605036726@cherry.de>
Date: Tue, 19 Nov 2024 10:38:32 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [yocto-docs PATCH] ref-manual: classes: bin_package: fix
 SRC_URI example
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241118-fix-bin-package-v1-1-906f0148fdaa@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241118-fix-bin-package-v1-1-906f0148fdaa@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0068.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::13) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|VE1PR04MB7264:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dab2a13-d9a3-4b8a-819c-08dd087def0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dDRyaW1IZ2lkWmFoVGVGeEorTklxN0tkblRndTluUHlEMnFERU43dlozVVBl?=
 =?utf-8?B?Z01YRmlvMnBldzZuTmt3Zzh3djF2Mm1QbW83N2hpUnZTOWxwV2g2UG1HZEdV?=
 =?utf-8?B?S2VkL2R4ZUxCcmt1S3JjWkdKdGZNK3I1cWVpbWdYS2RDbHZySEZGWUpDVzhE?=
 =?utf-8?B?TXVOZXNNSzZPdVR5Z2l0OVh1U24zd2FNMjFBRHVNRW9yR1Q0L1J1Nnd2Q2ly?=
 =?utf-8?B?dG9kbElvaUlVb3BMMXF2UjNVbWMxQXZSRERqVkR5T0M2QXl0dGtGWURpbDA5?=
 =?utf-8?B?RC9CTDM2Q2k3bzd4L2xISkljRWtNZTc4YnZKeVU2OXIrSWJlWHlnaXZjWkFl?=
 =?utf-8?B?RkQydUJ0N2t1enhXa1cyL3VGMllHdm1nNW1WMlhDQTNZVGIxM0JBVkVTN05C?=
 =?utf-8?B?N0pRNUtsazJZMXZBcUtwZnhaRWp5cjV5Z0ZhZEtTeGlNaFRldTJVZ2hCSHor?=
 =?utf-8?B?dVpYVWRyVE9CbHJ6d2JpNEFON25LVWRHd0VadXJEUllFV1NyS0JzWUVnaERZ?=
 =?utf-8?B?NkhqNGpxelIzRHZHb2lyTWdTSlZvc1FOb2xCTVF0cFhGS2dZNW1OT2g2ZGE1?=
 =?utf-8?B?a29jeEo2VGcwbVBqYUVaeUFVUWNUZlJWeFo4VlBaSm82V3ZGbVZrVXhUVkVt?=
 =?utf-8?B?T1djMUYzM1RDZVVjYWt1RVk4MWgxZERyczhXZXFNYnJXeVM0enZ5QzE5ZnJT?=
 =?utf-8?B?MVlmNDVzTWJMd0diRHlISUJOU05taUZSZU9nTDY3UEE5ODNsRzlqMzJqaURl?=
 =?utf-8?B?aWYxSHcxS1lBdjhxUG93R08zdkRxSnFQWE42RFkzbGhjalJ1NVR0ZEtPcUZv?=
 =?utf-8?B?SGVtM3BTRk9iNUdXOEJ0Mk90QnhGVVdaME1FL3JrUk5UYi93S0tOL0hwUGlv?=
 =?utf-8?B?T1Mvc05tM1BVR3BwVEhUWUZEd1ZBYzFnT0FPUFRIWVdUc0RpY0RhNGxsaitp?=
 =?utf-8?B?RXg0eWVjay9Cb1FXTzNpU2MvbTBRRXgxV3JBZDBlTDc1L3dGcjAweG5KQm1H?=
 =?utf-8?B?c09ibkZ3SC9sMUwvaHhsK1JVYkFJTFJMSFF4b1BPQ0JOYzJsdzlZYUtnWmdO?=
 =?utf-8?B?eitPbVdCaWZlVEFJNi9XSVRoZGpMY2dQbmR2SWtwRFZXRFdOdHdnZUN6V3ll?=
 =?utf-8?B?cS8vOWVqdkVudzhINGlNdTl3dVZCU3lQOGhRWU81TnlmcnNPL05jb0ZDTWNB?=
 =?utf-8?B?dXFuQzk1bVZjaS81ajdHMDVLZUhWREVwVDNRZytCR21MYUZjRHpBWUhwek1L?=
 =?utf-8?B?bUxxMjNYV29wU05iQ29FWkJ4Vktpa2Urc3UrcEZ2UDNjWGtRQ0FxZTR3U0JO?=
 =?utf-8?B?VndOUlVsSzNqSVAzU2V6SVV3Vy9iQzdQcCtiOVdocHlwWFI2OE01V2RZZ0NN?=
 =?utf-8?B?VjBFTWdwSU9TRWJscEhGT2hlSGxHbFZDZ2c1L0IzU1dpMDZIUGs5N0hWQWhG?=
 =?utf-8?B?R3dKdU5nSEwvVzN0MTc2OS9nL1dibnQ4cmVqQ1RDcGRzWUNjaG5Gcm1lOEln?=
 =?utf-8?B?c2k3b1VVWEhYeWdLcVBoQzBENlAwakhsZ0dDTnphZldkak1NSzRqbUtFZGp0?=
 =?utf-8?B?V3JhY3pyOC83Z2FyaU9QMU9VN1UyaEJMRHJNRlVwM0FFVzBtcFN0S3h3MC9G?=
 =?utf-8?B?WlV4ZWo0aHovNmVMMlh3K2JVblJTaGhmeHBvcjNlNUYxQUcxQlQ1eFUwRkly?=
 =?utf-8?B?MzFQRldtdlRSQ3BnN1RHVHFWREc2R3IwRFh4RE0xZGFkdU5nUDFDazkvMjhK?=
 =?utf-8?Q?wADpFxQIVLl91LPulo7UpfKYmVnay/hViLwQuQi?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VVhLWWVZU1ZIWU42c1NqbmdYMnlJeWJtQlJsQnlBK2xOL3M4SktYZHl4Y0hO?=
 =?utf-8?B?d2M1cFpLdFpvd0dkakkxRldrekpGZWdtYzJNQksxWXhwU2tpcytjQzFKQWJQ?=
 =?utf-8?B?L3JxNVhwNHErRjdoeTVkL2gxeGk3SDVvc3pXdVkxWlh2cEwvUFhha2JqLzdK?=
 =?utf-8?B?OHBRbEtiUWtOYXJWNXlGdWhsZC9YQ3dDYWtvbktNSnBCcU10TVdZemxDODlj?=
 =?utf-8?B?eFRnQWRwQmhpNFRuVnJuazlseFY3bUhqV3I0MVpqdVAvNlVWeTF4YnBEZlBU?=
 =?utf-8?B?amp3Ky9jWnlscmNCdTNSd1RRbWlTTTVyVWlocTROemExeTgveitCN1RiQ0dt?=
 =?utf-8?B?QkM3ZVBmanRqUE5Sanc0cS9nZy9rR1BRMTUrd1NzQ3pacXdKODZvUjBsNjV6?=
 =?utf-8?B?dWlUTm9pYWlJVVZRdWJVczJWYjZJL0xOY0dKc1JxN0YvWW1mWjFCOHZqYldY?=
 =?utf-8?B?MDR6WlFoZWgrZThtRzFDZzc2NEZUN2s5aDF0aE9yQTFiOUtDZTlJSGFLd0FH?=
 =?utf-8?B?Rzk4MytKK0gxbGVVVUNidVVLNFo4NERaREJVVHQ4Vkt1WTZMMEJVeXl1NTBr?=
 =?utf-8?B?eTJGSk1wbHFPWkVpUlRCNWZkQkJxUnU5TTQ2UnRzMlByREF1WGVGdjZHZWhF?=
 =?utf-8?B?ZUFoSDMwdXB6TEtqNUNyeUZVdXZBakNkdk9NODk4c2JDcVNzWjVIY2dhdmFI?=
 =?utf-8?B?Tm9Eb3dXbkczZmtnYnZHWSs5NWJFZFZ1SEROczB2ZkJMdkdSZDVnaHdXTkJ5?=
 =?utf-8?B?dTBkTUxKNkRRbmpLeEUzWDVDZ3pzbTVJa0UzZWJVck03TTlMZWM4bHBlb3pY?=
 =?utf-8?B?RVc0YkRzUmxSUFU4am02RFpVeTFqaUxmajV0NGJYd3E2a1ZKbDFsZ3ZaNHFU?=
 =?utf-8?B?ZnFIOERJa2hTY2xQbkt5ZEVKeWlaR3UycTZtLzZzZTB1TmRKUjJjUU9Lbmt5?=
 =?utf-8?B?dXdQZzhGNDlLZUhFNFM2VUFXVE81VmtCMVdnUFhETkdwc1RWYkl4czVZSmEw?=
 =?utf-8?B?UDBxaHB5MEhHc3pLUWVrSmo5UUtnZzdHdXZjRnFqWmMrOUhnQmUxMWh6Ymx5?=
 =?utf-8?B?K2c4QTYwODVlZTdnYVdKM0ZCOWo2bVpBbEVMWDVVTkxQVFNDdUp6amFUbE5p?=
 =?utf-8?B?Y1lwazN0UkRZWHVLTEE4dURBVFIzM3JIQmdZVTZyY2o2dWJ3Q1lSVXFoQUxj?=
 =?utf-8?B?Mkd2azdmV2poRXdtU25LUUJ4dGsxd1hHUW5oa1VUQmphcG42bXpHTDJaTkMy?=
 =?utf-8?B?anowa2szcEJQajVvTUNmYXNzM1pvaTdMd1JYcDZOTFp1bUhlcEJEc3k2eE1G?=
 =?utf-8?B?UTRjVlo2Qmg1elhFOW9MYk9OajFyUk9MWjcvNFVBOU5FYkt2ZUhVUWl4aWFO?=
 =?utf-8?B?ang3Z1J3WUViTmsxcmdQY0ZZU3NNUXJpMWJLaGtTeVk1QVcrRUhROGhtMk4r?=
 =?utf-8?B?QkptRURMaDdyMzlvOXJrd1BXMk90bm1wMWk0ckVLQkY2ZGYzZHBpVXNRTERD?=
 =?utf-8?B?VENRcW5DSlJjNHAwMnFLNWNkWmFHb0UrV0E2VmtRZk5sbGV4NWdiaEI0aWpl?=
 =?utf-8?B?Z1FYMXE1TVpud09iZTNLZ1dmOXBKYXRYRWdYUTFORFhVMVBsb2g0TjVGdkJt?=
 =?utf-8?B?MXZRUzhlR01SQzROTzIzcXh3M2libHlLMXRhN0N3ckNPTDd4eU43alNBc1Ex?=
 =?utf-8?B?Nk1nVUc3UGVCbGw0NGtka3JXVGt5VkkzQjJkM0RTK1FITjlhU3ZrTUJyb1Fr?=
 =?utf-8?B?YlVNZXM5dkpFemNJbmU3VUVKTlR3YXBPbUNWNW04YXRDbUd6cnZ4ZytLMGhN?=
 =?utf-8?B?aHpJZFFDNy9NRXJCYU9HMURvSmVsWk9KTS9DcmM4aDhQWHJrQXNZSmE1bzVM?=
 =?utf-8?B?QklKMXdLQzVMRnlFV3hPeW9xRUlGaEZaVVByZmp6YndySmg3ZmRIRWttbnNs?=
 =?utf-8?B?R1E5bklRMlgybnRuUTV0MlNVbEI1SnRhN1BPTWo5VmRHL2tCNzhRUmt1czlE?=
 =?utf-8?B?Q283YWNMKzdObzB6RC95MTBqSFNOaTdsdUF5cWdsdVdwYmJCOE9wZkNIZkhJ?=
 =?utf-8?B?aVg0NWdKZnRzVHlPSm1URzYrYTN3WkNrd1Y5eHFVYXh1MmV5dVllbmVhMFBz?=
 =?utf-8?B?UUVFUXZrVERZelRCSmpDcURYVktMR1hxTWxDcTZrNkZhTlptYVZXYUJueHJh?=
 =?utf-8?B?SFE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dab2a13-d9a3-4b8a-819c-08dd087def0f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 09:38:33.2980
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XaTzrmFdSSoVFYXvRNebBKh6SFoT8lmndeH6XkY6gZNGfK8bl6MuMUd7F7ND2w4vYogqIqKF6GEg4C5WN9aEzvRqsi/LHqnZrbB4ODAQ+c8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7264
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 19 Nov 2024 09:38:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5766

Hi Antonin,

On 11/18/24 9:46 AM, Antonin Godard via lists.yoctoproject.org wrote:
> `subdir` is the correct attribute to use for extracting the package in
> the correct directory.
> 
>  From the bitbake doc:
> 
>    subdir: Places the file (or extracts its contents) into the specified
>      subdirectory. This option is useful for unusual tarballs or other
>      archives that do not have their files already in a subdirectory within
>      the archive.
>    subpath: Limits the checkout to a specific subpath of the tree when
>      using the Git fetcher is used.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/ref-manual/classes.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> index b92f4e4f20ea8f702c90f4e3d29251b2461d07d0..2ac94630d80386cf613222b70f7bd6323b9948f2 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -176,7 +176,7 @@ example use for this class.
>      are extracted into the subdirectory expected by the default value of
>      :term:`S`::
>   
> -      SRC_URI = "git://example.com/downloads/somepackage.rpm;branch=main;subpath=${BP}"
> +      SRC_URI = "git://example.com/downloads/somepackage.rpm;branch=main;subdir=${BP}"
>   

This is not enough, subpath is mentioned in the note admonition just 
above a few times, those need to be fixed as well.

Additionally the wording is weird for the bin_package class.

"class is a helper class for recipes that extract the contents of a 
binary package (e.g. an RPM)"
[...]
"For RPMs and other packages that do not contain a subdirectory,"

Maybe we should use another example of a binary package (e.g. a .deb 
package) in the first sentence?

Also I am not entirely sure what this example is supposed to show.

SRC_URI = 
"git://example.com/downloads/somepackage.rpm;branch=main;subpath=${BP}"

This is very confusing to me, is this really a somepackage.rpm **git** 
repo? or was this a mix between fetching via git and unpacking an RPM?

I'm wondering what we were supposed to show with this example. Is it 
about fetching an RPM from a git repo and only extracting a part of that 
RPM? Is that even possible? If so, we probably want a combination of 
subpath and subdir? subdir for the path internal to the repo to the RPM 
and subpath for the path internal to the RPM to extract?

Or, we should provide two examples, one for RPM downloaded from HTTP for 
example, using subpath, and one for a directory from a git repo, using 
subdir?

Cheers,
Quentin

