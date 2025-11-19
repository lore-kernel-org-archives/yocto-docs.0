Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37CAFCF394D
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 16:04:49 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.25])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10688.1763568286601036842
 for <docs@lists.yoctoproject.org>;
 Wed, 19 Nov 2025 08:04:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=LdZKIpKT;
 spf=pass (domain: cherry.de, ip: 40.107.130.25, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bK3+2fcSBQTI15Z0Z3ASwy6Q+qq1EVrCo6zMqZ3/pZdhGUqASxBpTE5ez+7mYWRHNGt6JaPzYohTxUMhLSKxqYf1B6RyrlqwTXFFsFALIBxJd4Ff2L7VVsOd/96U4eKSfrhfTOo31KVaBymUaYgccPZNsv1KJjd5/hayuKn8pit4PLBIG8dZ4qRcW7epN1gc+sKRhcL12QD7rsstHhFzrM5W0xuQ3k0LdK4CY6G08tJ7loi5HxcwqT6euoNAhoFtWnb6Ba2YsYHtQioeLJhKYH65ucVSdCq7DuH903peBWMJaAQQj15OXOVQIBBLPDTTdJFGzh4r/YRz48BIMCBH6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X9Fw4MOAsfS5p7j02sISTq1poo2DwcxB6FaFaNKPb9Y=;
 b=BRsFPf1O/nOPWnZ9oeZM3nLx5/+6W8PXp8ana3wdt5rVwMRyHD4kIrEoFVvJ9cudA7KPCSfZSBfBEJ2yB84R1pkOAO/fEzO8Hg+hU8iE/U6aYR+o3obznrsbE4G41p+l2Nod1AtNyD6VuF91KMbPZ7tTjMePyJ3dSRH9KJwdPxflrO7Z620Gdsu2BdV8jdCTFryBwEdqmbjWGTSEwMR16qkSoYeIgGLZEmOqeKJncKlZhiQvowBcLcWQe5DmG5A28pBZGnyhLlUFbYxDcxgHSoN9uTVRyA9jwmfaAghVbqj4nM/cfoywhvrcv2gipoO9klkSCX8IxdzvCk7WJOKSZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X9Fw4MOAsfS5p7j02sISTq1poo2DwcxB6FaFaNKPb9Y=;
 b=LdZKIpKT6cMNM7EKtsm8pCXliavCCPVhn+sELHEc2XoZxQBoFdL3ld3njfjnPFAUzPZr5zz8G0i/11vik5IhGWKDqp/CsxuugwhwCev/UqTIZdcpp/RZ2jki0Rh7MRHD7AL10VMwAwZexP9zQLgP4f0VT1s15JZmeEQqOA2YBvw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DB9PR04MB9991.eurprd04.prod.outlook.com (2603:10a6:10:4c4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 16:04:39 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 16:04:39 +0000
Message-ID: <e84a32a8-2c09-40db-9688-340e96474cb6@cherry.de>
Date: Wed, 19 Nov 2025 17:04:38 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] brief-yoctoprojectqs: shorten and clarify required
 host packages
To: "rpjday@crashcourse.ca" <rpjday@crashcourse.ca>,
 YP docs mailing list <docs@lists.yoctoproject.org>
References: <8a97eda5-0b39-03dc-1e37-76031a747f46@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <8a97eda5-0b39-03dc-1e37-76031a747f46@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0168.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:66::16) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DB9PR04MB9991:EE_
X-MS-Office365-Filtering-Correlation-Id: dce77980-6a55-4464-1380-08de2785581e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SFpPL3EzY0lOZ0xyVExMZlRISENMYWF6V1VlYTZrV2FXTExtVGlSTFRSSHJp?=
 =?utf-8?B?aEgyczltOHdXQmU0d3NTWnVYakQvQVIzL1p3dXRjU1UwV1FPTWxnWkJwYVFS?=
 =?utf-8?B?ZWMxYlR0Vks0N0lVMEt5UFJRZ3IwU1lnL3pmQldRMXQ3SjNnYWpKalpwczdC?=
 =?utf-8?B?bUlvZEFwbVpxVDRRMTZMR2FZMDVUZHlqYXRuWGw5UG42UmZLdkhmL2FDcC9p?=
 =?utf-8?B?RU1WWHBYTzQvbkZ3VUU0NU5oVTRsRk5obHArcms1QWl0QTRGd1FYVy8yTjVW?=
 =?utf-8?B?K1R1YmNLdndwZzZaV29aSGN4akU3bUZEMTZsbWJNREhmb2ZyQWJ3Y3MzSEIv?=
 =?utf-8?B?ckRyZlhKaWxjVGwyL0JTR3J1YUVJYkVqYkUvSHU2Q0w4VzNhUEowOHQ2VEpV?=
 =?utf-8?B?NVFnV1hyUU1NVGFBTHJHUGlyVFpGVks1UDdNSC9CNGc1Z1lnR1VqNjNCQjJt?=
 =?utf-8?B?aUUrLzN3R2ttWVdadjZCUGZTeWNTdmFQSkk5dUl5VGV1TDZSMFptZmlUbS85?=
 =?utf-8?B?Z283T2RwVHRoWmRyb21odHFxQkxuOHNHQW9KZVdkeXI1YWIwY1BJdDIzdnVN?=
 =?utf-8?B?WUtEcTRQdlNJYjdGQ2lCNlJvMlcwS1JBMlZPcUd2RnNhUEQxK0t3Qlk4UlBa?=
 =?utf-8?B?SXNLbjVLblUvVmxWdkNLWmxIVXEreS9lb1NmeTBiL0FvTGFiSHFSVUFUajNo?=
 =?utf-8?B?SHpCQjhLUHp2aDQ4a1UxVXFMaXN5N3AxZ0pManhNUURQZzRseDh6MlFXRWJm?=
 =?utf-8?B?ckQ3QkZ0Q2V5NFVUYnhUTk5MZ21BVkYvL1Npd0M2NFRlc3IwQjhlYStLdXd5?=
 =?utf-8?B?YnEzOC9GaDVJRWIvZWR6S0NKQkQ0ZGVmYnBGUGlxUVNFNE9vbCtmKy9rUnhr?=
 =?utf-8?B?OXJSVllQN2Uwa2FCVklKTGQ0WEEvUUZONE0rTnpUeW5MVWxhdXVwamFuMVdx?=
 =?utf-8?B?NTJBVjhIMWl0bFBzcEdjSk1CRkluQmZ4YmNKZExYL0tXeGZMZEFhZFgyTTlJ?=
 =?utf-8?B?UWI5V2NEbmkxMXNIUFJOUnlMNHBQNXZnMTcxYUhuc0ptN1k2ZWRNeW9Ob0NS?=
 =?utf-8?B?QUxtaWcyRnM1RkpYU0phTkNpNmJ2ZmZBdlNXaU1WWE9rckNqN2JCSlZDdFVl?=
 =?utf-8?B?bDJ2UEpzZTM4YzBnT1BQRXdKajRJVnk1VFprWlBHRHYxWGkralFDQWowYVU5?=
 =?utf-8?B?SUJxNFpneTdvdllwdzRUMnJYOTZ6aDJZNXliR0t6RDluYUF0cU5OT0MxVENO?=
 =?utf-8?B?QkdnNG5aYi9teCtkWWJMaE9ndHZ6cGFxVkxtd0svNkd0ZEFRK1AvTkZ2YmRN?=
 =?utf-8?B?aFVaaU5QbWViVzRrS3VkNTJ5QVdiNzRCWnVHUTZnalVLZnRKQWZUTjJCVUk3?=
 =?utf-8?B?Z010M2VucHd3c1RUenNsa3U3MkJ4NzhlZmJ6U0kwRTJHUDZZR2swM0cza3p5?=
 =?utf-8?B?V2pmWjNUTk01YVdJcWVDUWxIWWV3LytDUVUzRWxKL1VQc3g1dVMvRGpTdUQy?=
 =?utf-8?B?MmxUVHZpWG1DNWZyS1kzdkRWd3F0SmI3NThCdFpZQXUvT2VadUt0UDlZWXFk?=
 =?utf-8?B?VHFualBidFBpWXBwSXJ0WkEyR1pCak0yNVpGZEJWR05sU2J3THFzdjk0QnNz?=
 =?utf-8?B?Z3VLU1prSnFBdnJJRnRzVGRnb3hyd1JDTGN5MGZCWThIUGdsUlZ0VWdxTnpB?=
 =?utf-8?B?RE43SnhXUmRkNEFPZXgxNXNQQyt6TkRMNE95QUVob0RqVTR3R0xlTDNENVUx?=
 =?utf-8?B?TlUrdmltMWJEQm50ZjRSb05ZUmdTSWJHQkZLYjBYRDI2Tm5zd0p2MmpsOUth?=
 =?utf-8?B?WURsdlZpVVUrdGRNS3BRNHpZM0d1UnQyWEN4UjhONVVPam1hbS8yeEE0N05J?=
 =?utf-8?B?czgvbGV4ZU8vRWZ5UW1NZFJrWmFMOFlwVTFIdzJuQkRRR1Flc05XbTFOb3Bn?=
 =?utf-8?Q?/NVjZVQ70ZH5n7DWJvNUzWvvojwc6KK8?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?clVVT296UHp6YTEwZTBzQks3RnBMMTBDNURQRi9VYTJIYU92NFdiQVVZWFhn?=
 =?utf-8?B?Y0tKc2lySFdaVUhHMjEvbXlMK2dSd3lOWFNobmNOemtKUDdLenQxcG1xR3h6?=
 =?utf-8?B?NW1yOVJUZ3pSbTNBb0tGVWhSbWpMSHJkMXUvSEZtYk1vL2k3Qzd4dDlGWUk0?=
 =?utf-8?B?OHJlZHNjQ1NLeEsraFpVU0M0UXBMT2tnSFJZYllOOVZWN21XdW1sQkVla29M?=
 =?utf-8?B?eW1TRGlMdEs3S0VUaExZd3lGdzY1bFVUQWtHb3FDL1lFOXFhaFpPcXduQzVQ?=
 =?utf-8?B?OG51ckE5ajhXMCtsbTJwbWE0YWdwWC9laWRiVU9DZW9GemtsQ0xjQUZXY3ZD?=
 =?utf-8?B?RFRkcUx3SldWanpDc0U2ZnlRd0R4cFBkR1oxcHowYnkyTXVieUdyTjZDQTI4?=
 =?utf-8?B?eDNQaE9zTGRnbWFnZVlDSk1jKzdaOWhmMFZmQlVib29hbFlDd0VCK3RTNDl0?=
 =?utf-8?B?NVFmMFNUQ2lCTi9LSCtUaXludGQ2SnVZOXlkbHB0c3JIN3VMcDJQN1VTeEIw?=
 =?utf-8?B?d2R3cmpkV0E1RlpVNk5qOXFxUWNiNklzSmwyN1Vsb1BRUWZsY3Myd3hBVVZM?=
 =?utf-8?B?Q0ViUnZVZC9UbjcwdnFrQk9vU2JiWWsyODNXZEl5VmJuajNjYU1qNmpKS0FF?=
 =?utf-8?B?NzBsakZWc0RtejFhV1YveWNwNU8xdE1uS3AvVWFSK1hLR0VPODAzYlp3YVZF?=
 =?utf-8?B?UWdjaEFIUUF1WnByVVVnK1p0VnE0M3B4bG1FUVR2aCtQZzVZYnpRUWpLVE9C?=
 =?utf-8?B?Ukd1T1RJOXRrL0ZnVHNlWjEvTExxZjNBL0JQRzBqRm1Ma0JmU3BlcWdqSURw?=
 =?utf-8?B?UlM4RXp6QWx4WEIzN3hhVGlOclJIYkt0Nmh6cWtWY3liR09oR1NUYy9PWnov?=
 =?utf-8?B?TEFRU1paREo3UGkwT1B2TTh0ZGI1ZzhQSUJjRmE4NWh0aStGaURtYTZuaG9F?=
 =?utf-8?B?b1hRWmUrVmNKTWZ4V3JObXhIMWJmaWZ2dEUwcmZiMlJsUG5nSFJvekVBaCtY?=
 =?utf-8?B?emF1dDExc29kSVZmVXFEK292M2VaUXg4TiszcytOK0Zqb0RwbloyK0p5b3E2?=
 =?utf-8?B?RlY5WXcxSkd5YzFDOFBOeWdsZGVhRERSM3MvZWdtc0lWeWg5S2E4U21kSXZa?=
 =?utf-8?B?bWFSY2VOWkpELzVYUzBsNCttMVkyVWxSamdGNE9WNENpMlB1ZHhPaDFtMUt0?=
 =?utf-8?B?Z0JRdTQzZkYvd3llMXhUWGRFRUp6azRIRU5XYk1qNDVpWjJuVVpFdEo2WnpX?=
 =?utf-8?B?Mm1vQnJzQTdMRmZBYU9vQ2R2ZCs5V0Z3WTJKV3ZpUkFFdXpTaW0wSW5NSnpY?=
 =?utf-8?B?Q2wxVFhHK2JNN0JsdWlWclpPcDhaMHF4UGdseHc0VS9xbHhPZlFva2I1dTdT?=
 =?utf-8?B?QzdxVFJib0szUTA5RWdId0ZwUXcreWVUZmlvdkVJYmFDM2hNMXhyVWR3clY5?=
 =?utf-8?B?Vmx5SldVOTgwcGswd0VlUjlTVVp4S0U3MDFlTnJOa0VFRFF2QmRPRkFLaEk4?=
 =?utf-8?B?ampqdUp4S0JiR09razJkTnM3YURKN2x1SHNqSENWcDF6YlppdDVQNlhKRTg5?=
 =?utf-8?B?ay9QOGQ0enloSTd0WFFPRFRNRzZYLzBZT25NbVJDQXowU2tIN0J4Umdscnl5?=
 =?utf-8?B?NWRZa1diWnl0eWtrVkNxMXpHaXA5dlBybUFPQWJDYnl3NFMwT3hhYTZPN3VU?=
 =?utf-8?B?ZFRvcXl4c0RsUldDdi9hQ3JvayswU1ZYOWU4N2FNMEY4RjN4K1JHaWpXQkFW?=
 =?utf-8?B?YWI2Ry8vNGVDeHdoWDJydzgyOUNUMXhxaW1XZzBiY242N3VKUzJ0TENWbDhz?=
 =?utf-8?B?clllVlh1U0ZPMG16d3djWUZSMldiUVJXV21wejc3UDBNMkxIQi9TNlorR05S?=
 =?utf-8?B?SzdiLzdNaXp6cEJKMG0wUjVZbFQvSTRxY1p3V0hTUEk0VHZ3cDE1MkNsNWR5?=
 =?utf-8?B?U3lxaGRDb0xWdGlHdmJGRVRLSjhGS3BrN3lhY1RTK3M0Wk1ReUxoaFJ1NkE0?=
 =?utf-8?B?TTAxejdJTDd5RjhSdXhOeHc5YUZzZkovdUs3ZmY0VUkrdnJleVk2dFBabno3?=
 =?utf-8?B?MmtGdktOUkw1a0RwSENySjBOS3RSaHNva1ZwVXZkL3NSaUlBOWM0b2J4cnUx?=
 =?utf-8?B?VmpXYmNZL2xISmNLbk1sL251U0hWNEc0Z0NQejB6Mit3eHVJN3FHd0dXSW1T?=
 =?utf-8?B?ZEE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: dce77980-6a55-4464-1380-08de2785581e
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 16:04:39.8009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cAofDuP1aGNxtd9F0Y6Zlas+BDrgwr6/YGhSSNnJy7G8ufH/1QQQXqL/3xKXGxFCNsRVx0EOlVO1AV4MsKWxjQ5fwIKqfbzjpRAep8eg2bU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9991
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 19 Nov 2025 16:04:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8092

Hi Robert,

On 11/19/25 2:01 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
> Rather than refer specifically to Ubuntu and show an example of
> installing essential packages, just refer the reader to the page on
> supported Linux distributions and leave it at that.
> 
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> 
> ---
> 
> diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
> index 211b6d70f..36acd655e 100644
> --- a/documentation/brief-yoctoprojectqs/index.rst
> +++ b/documentation/brief-yoctoprojectqs/index.rst
> @@ -71,21 +71,14 @@ can still use the Yocto Project. See the
>   :ref:`ref-manual/system-requirements:required git, tar, python, make and gcc versions`
>   section in the Yocto Project Reference Manual for information.
> 
> -Build Host Packages
> -===================
> -
> -You must install essential host packages on your build host. The
> -following command installs the host packages based on an Ubuntu
> -distribution:
> -
> -.. literalinclude:: ../tools/host_packages_scripts/ubuntu_essential.sh
> -   :language: shell
> -
> -.. note::
> -
> -   For host package requirements on all supported Linux distributions,
> -   see the :ref:`ref-manual/system-requirements:required packages for the build host`
> -   section in the Yocto Project Reference Manual.
> +Supported Linux Distributions and Required Host Packages
> +========================================================
> +
> +Depending on your Linux distribution, you might have to install
> +some essential packages on your build host.  For host package

Spurious whitespace after the dot?

It's unlikely someone's system will have all dependencies already 
installed so I think we can just lose the first sentence?

We should probably also update the note at the top of the page. 
Especially the "running a *recent* Ubuntu distribution". We're often a 
few weeks if not months behind after a new distro version has been 
released before we actually do support it officially, and we don't 
always backport support for that new distro version on older YP/BB/OE 
releases.

Looks good otherwise,
Thanks!
Quentin

