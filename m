Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF771D41C3B
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 13:59:32 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.70])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9746.1765461566195437260
 for <docs@lists.yoctoproject.org>;
 Thu, 11 Dec 2025 05:59:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=AESd+Cji;
 spf=pass (domain: cherry.de, ip: 52.101.69.70, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VQZghyZvMuHS3X4NwVvxX5Fa3Z8t1MASEf2ax1BokGnmVaaLt5WldLzPnCp3g+/RMf9i/K57YcUIAZ98SPX7IV9xGkaoVCuGflQFTjqth2qgQqQeYbGcW00iC7nzdXWgWWkAVvBd6Rmdxwcmd+gG9OK54pBXaAO1dTYm0wVIBKUDoJSjedXKfG/oaNI4RIZpCyTC8AUpN3A2JVRjx81GswZbkjm2R78y18MlXHFKWwQKlwlgqmImK+VdN52MOxU1wyKTdbC4NV5oLIABYGQGkEOafgNMcLcrAWzKS1Y2UfT6dKpXlG+YdDt+duAijuFcRwJ4VMpN41fQLArIs+BE5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AArS1wgrijjmGlR90avTfaVTWMV/H6gvqUGE0xlR23I=;
 b=OQpe7wOaB2PFjU70KoOXla/zCD+NwgE3fEscRLizXXx/vQpQPuSU9rP/ZaoRGxmBmLYcsE04WrwMHbjdO0cT/GT5sGOy5y65P3qNinNX8CrzEVrIyIzNRv5Fl38Lw/FS4bu92243M+8myOOfadsLH0WtSQp4OKSMk9RNf/AblVt+t7gtbPELL1yPF1ZUESNEWduGdTwRlPWjvxDuuTIyH3Wo9zukxHqvTD8St/lw0GiL50qUl1n+j9/XYINik5B4lnTch9k0Id4ziXlER1LZ/AA6T88jkYCdt71zsh06ifzvuynvu69yImD+6Q7S5eM1ZRtye8CBsYgq9QXXThM6nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AArS1wgrijjmGlR90avTfaVTWMV/H6gvqUGE0xlR23I=;
 b=AESd+CjiRJYKC2n2AuOYDxTq3XqgEx7tns/lvzc3IA4NhgjyAzCIgaeWrrHhNB6+WOVFl2zoZle5dojEY7M4ddJbwGOWfug4OwPb4dkzrXie/2PvHD9FlmSJZj38wblFgQLur1SUfvYU9zpYkit/Ye0SoMAXC9vzsIaSbgX3l+U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by OSKPR04MB11365.eurprd04.prod.outlook.com (2603:10a6:e10:95::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Thu, 11 Dec
 2025 13:59:20 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 13:59:20 +0000
Message-ID: <83944861-f6fc-4fe8-92cc-3d4e1a47a0a7@cherry.de>
Date: Thu, 11 Dec 2025 14:59:09 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 5/5] ref-manual/system-requirements.rst: add
 RockyLinux install instructions
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251211-build-docs-container-tlmgr-v2-0-58719c103a50@bootlin.com>
 <20251211-build-docs-container-tlmgr-v2-5-58719c103a50@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251211-build-docs-container-tlmgr-v2-5-58719c103a50@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: VI1PR07CA0258.eurprd07.prod.outlook.com
 (2603:10a6:803:b4::25) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|OSKPR04MB11365:EE_
X-MS-Office365-Filtering-Correlation-Id: ec19a29b-0f81-4967-c3aa-08de38bd7b9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|1800799024|376014|366016|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TWVWVlVMbmFMbmV2cFpEaFlxV1hiMEZVdG9CWjdQY2NGZ2E5WklkaUsrQU53?=
 =?utf-8?B?Qm9yRDZkMm0zUXdHa1hibmhjS0hDRW1yeXZabE1IOWU3VzI1d25LRnoyemVC?=
 =?utf-8?B?V3ZKUFl6RmZkY2VXdDNUT1JvbkM4NlAwQmYzcG9CTVVickFIbHpNcy9xTVNt?=
 =?utf-8?B?V1ZWZFFaeFR6NHdvM1pFNXBXM3FaTElvV1lQcS9wM1dsQVZuazVMM2hPWkhw?=
 =?utf-8?B?STlkbmZUVUNoRVJ5aEw1NmJ1ZUVUQ2ZoVXYwS3daUkk5MURzNjVGY0ltbkc2?=
 =?utf-8?B?bmlJRGErbVFVbVNWZUhrMk5wRVIxdmpGZWFKUU5TSEhab0V3TkZXcEo2SkF5?=
 =?utf-8?B?L1p6TkhYRXpJYS9CckFvczk1dDBQYzE0M0QvWU5wbXNpdkRKVnJPaTh3RjlJ?=
 =?utf-8?B?NWtjUjl0eXN0YkRvekZrL2JCNGJxYzVzSTFtVm5jVmx1STJtbHAveWg1MVFy?=
 =?utf-8?B?SDJxMFc1NUFnVGVtWkZ1Yi9sbDQ1SXR5UEFZNEdwUFZNb2lSZ2hlWEpHQ29R?=
 =?utf-8?B?R3ZhYTd5UGtUZkRWYnliOUwyeU9lNjRLcGlIc203Z0o4Vjd1QldyUTFBVHQ1?=
 =?utf-8?B?c0w0bkpGT3BJUzhKb2d0QWJHZWVoVUJqa08wRlRUVkpTNzdUaEpnTkt5WVVX?=
 =?utf-8?B?R0xGUmptU1p4RkF6TE1JNWVUYndYWXFBaFNiRHF2aVFkcXpNYkdlSDZRNnZv?=
 =?utf-8?B?WDhscmE0MWpENVNQSFYvWmtoUXVUajNKeXJJZ3lYUlNRa1JERTI1TytXeTg2?=
 =?utf-8?B?aWY3R0RFYnNrZXlhL0E4eW1pTjVMK3VncjlZaENIQlFsK1pkZmJOSkZiTG5n?=
 =?utf-8?B?ZkV4NUg2YWxUN1pZQVBrMnNpQXpCZFZyTER2Nm80QTNFQkUxdEk4SjBEbzkx?=
 =?utf-8?B?elMzejlGWTY2UGhTMk1NS2FHSmloS3MyRXZjU0Rqei9xY1dMV1ErYlhVMUdq?=
 =?utf-8?B?YVlkbkdRdjljR0ppTmhtbjlTOTl0TmxwTFZpZnJLSzdKMU52RDZxbjAxcVFL?=
 =?utf-8?B?QzVFWm0va1J5Z1hRSWd0T244ZkdyeC9BSk5aUFZJRk4wTTFpZWZIWDFxdEhL?=
 =?utf-8?B?SlFNSVVtQlNXWHR4emZnTjlWNXA4U0dFWkV1djI4VmRwM2ROd3JDajU1WmFZ?=
 =?utf-8?B?SVNYTVd4dW9CeUdXb3pWMlFOSFBocWxIVG1ZNWVxbXhNYVg0bW1lYzU3TEk2?=
 =?utf-8?B?UmhlR0N3T3pGVE9sWUpRVUtjbHRyTDAzNTdiSU8yV3RHOGJjb2pvckdKdm1i?=
 =?utf-8?B?dnNsTW1VWXdzMFpXVnlmbE5kREZwNkREVm5oMUVDYlpwSFluMlBQeFJKSW9Y?=
 =?utf-8?B?Yk4xUVFSZWtSaW1ucitqWHRKVEVyQ0FmUjQ1MCswVis3b3BHNDhIenorYTdh?=
 =?utf-8?B?VitYeXplTjMrNkxNZmJjd2ZscTY0ZEkrUzlDcHdWSi9jTzg5OEpZTHdPSWIv?=
 =?utf-8?B?U1U0N2p0dWZDeldyZVQyQlNZVkxLSjdrb2xhMk1YZklQSFZtUEs3d3BLZVNi?=
 =?utf-8?B?RDc2cHY5L25vcmh4aVMrUE4rR1o0Umk3SmVJaXY1NlpRWDhBYWc5M050STJr?=
 =?utf-8?B?TXUrWmkwa0FSaWUraHFUVDVkeVF3TGtwOG55ZmljdmpSam9ZRyt1RktuODZm?=
 =?utf-8?B?SkRpeU1QeU1jL0w1dEFhQmEvelhBcmtDcCtUU3crSHoyUnVLb2Q0SHJGMlFC?=
 =?utf-8?B?T1BmME9uT3ZvMmorbi9zZmhkQVZPQm9ldmRmUVpPZWJ1VXVBWkNPajAzcGl5?=
 =?utf-8?B?Q1cxUzJjVHZCN2tyU1VkNDZ3UG50cGFUNGJ4OWZEWXF3UkpOVlpoOE1NaTNM?=
 =?utf-8?B?ZUttUUZzbVNyL3ZpUVhpbURLbFhuKzdjYXQ2V2hFUyttd3VhQjAvUFE3VmJL?=
 =?utf-8?B?Q0ZFSGhCbCtnTlRPbURlbHU5Y2ZmYXAzVS9vdU1kalc1TW53akF4d01LMlVN?=
 =?utf-8?B?Sk5TL2NXWjRldGtXZzJ2RG5Fa0JCUXJnQld3NDN2WUhLc056ZjA2MDdGelUw?=
 =?utf-8?B?ejhXbXI0aTBnPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(376014)(366016)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WHNQRXZsc0xoT3QrV0JJblRyaVpEcHIra0FNU3g0YnZWZTlwaTBaL25kTFBV?=
 =?utf-8?B?UW1vdjJvN01zMnVsN1pHT2J6cHZ4YkdpNXpMRS9lb1RvdU1RVGM0TTJMeXpt?=
 =?utf-8?B?QlFmYnVxRERMRUFhN040Yy9vS0d5TFJvWlVpRWRWWDdqenMyNWp2RTNGWkZE?=
 =?utf-8?B?SnB2aVVEVUNJRDJXMkYyampaK2pNUDVGa2xsY2pPS3hrdW51cFozRDhpZjYr?=
 =?utf-8?B?azVPUmQ3UFo5S25jaFJsYzlCNXRrMmdDQ1FTdStCY2FhdkhHZ3AycnVueU9j?=
 =?utf-8?B?K1RnSVdPZENTdmMwMFZwSS83Wk9weGJTUWhod1JJY1c4QitkZHc4UDQ1cHBi?=
 =?utf-8?B?Z0lma0hPay9pRmZXeVBUOFF6YURrblc4a05BM3RzTWZpVmtyeldlUGNUSVlZ?=
 =?utf-8?B?dU0vTlVJTWNNRFJGanoySU1HMGJTb25rOW1ZdlVFL0RXa2M2MHl6ZGtYY3Z6?=
 =?utf-8?B?QjVuTEt6bG5GVFgwanRPOXlBWEI5cklKWXB0KzUvT3p1K0x6eVZsazJRVkY5?=
 =?utf-8?B?MHFkeEJ6T2laSlE3bmIyaWw4bktKOXNEbkxNVlFFMFdOaEg1TC90dTRVUXFY?=
 =?utf-8?B?UkphWHlPMmM3QytyZGd5MktHM3lpdXlVeFo1a01FcURRVDNVbFJ5c3ZBU0s5?=
 =?utf-8?B?VlFIWFBON0htQVlMOHVlR1NKSERWdzdtTlkzVzFnUFZOR3hBaGhZS3dVY2x5?=
 =?utf-8?B?M1hXYjZXbGxtS1dtMjl6ZVh5aTVtSE04UnR4ODBJeVRjcVROZCtNZUpla1p0?=
 =?utf-8?B?dGMydStpVFRCM0w1UUJPVmpJNjRVYjducW1UektYd2cvNU9tbEl4WTNmYkV3?=
 =?utf-8?B?SjUwTXQ0YnpMYlQrMmlIMHJUVklwM0U4cTlMc0V3UDRkWG81NFJyMnVOVHdq?=
 =?utf-8?B?cHdOcW0zMG9pZG10bGVVUmRXajlzL2QyRnhHUGJjWmE5S3dJTmRoMGx2VlI2?=
 =?utf-8?B?MTVlUGZWMUM5a3BwNDlHMHRoeFBLM2lXQVRSRjdOb0R4VnhtZzNDYmdrVk8w?=
 =?utf-8?B?YStMUlc4UHovTy9DMWpGVFNYSmxqNFVIOU9aYXVWN1c1UTJwVmVjSGVzbVMx?=
 =?utf-8?B?SlpHQ0M3NzJSclZPY2Y5bFZZRzV1U2tkcDJpRVlrWFRNS3NsMnN3ZXJjQ0tU?=
 =?utf-8?B?R2VCdGZmMTJYWVdxNFI1bno4VkJyQU5PblpMbllXaHVsTm5Jcisram8xcEli?=
 =?utf-8?B?cUhTVWFLRlZWc3VYN21uRy9HVU9GN3h0clVwTlkxb21LYmlUYW1JUVVoMUtL?=
 =?utf-8?B?TjF3ZmpMNUVqQlpGRWxVb1NwL0d2U2pmbEFIYTJYOWhESkl2TnpNU0JTNDBp?=
 =?utf-8?B?b1VvdGtnZUp3VFNzV09UOTc1US9QWENicGErdnF4RUtNRCt5UFdPK0xUSGhq?=
 =?utf-8?B?R1ZnRWRXbWcwNUExU0w4WWpRaUpSeWZucHNiRmVEbU8yTWsvZm5xdXR5NGl3?=
 =?utf-8?B?Z2RiM0FNVTNyN3pWUEMzMS8yR05RSzJaSVRHaVE0aHFjWVp5VDlkdFZBYjJx?=
 =?utf-8?B?bXorN1lDY1NhcHZYUFhZYUJaNDVjeXZZZG54VmRyTjNBemZyc1dVR3NSSlY1?=
 =?utf-8?B?NHNuYWhVZ2xjbWpjanNNMElXU2l1V3luTjlkdXNaU2hEL0tkQlFMejRrRHhF?=
 =?utf-8?B?N2JKclhTTGk1dTJ3amtGOUpFMU1aVTRlaDRLaEVnVzR1SXFoVUNzRk9CS0Q4?=
 =?utf-8?B?eGw1Tk9CYzBYOUhnemdrM0E1dWxpUmxrSTliOGpKd3U4RlY3czcwc2hIZHpp?=
 =?utf-8?B?YUtIYzlEVVlWeW9tMkgzWUhxRGFWa0pRbkphQ2J4YU5FdlVNaWszaUsvNXVo?=
 =?utf-8?B?SWU1ZW5IRThJeTlYeHAxUEQ0a3pJdU8wUXhyN05UUEg5MjljTEZQbWF3d3k1?=
 =?utf-8?B?enZNWDhMRGtUY3VpVWhmWjg1YnNoWGREUlMzTmd4cWI0cmsvWVU1MURkNkRS?=
 =?utf-8?B?dGRYdUNkZVBXa3lPSm5WT3dvbHY1dGhxNXhwVWlBWVNIbGt2bmttNnlSTUo4?=
 =?utf-8?B?SXdzdm9vdi9PUzJFd1BTeXRvbmg3L0M1Mkt4V0NRRGtMKzZKWnRGY1dqeEdV?=
 =?utf-8?B?VVA4cVJVL3VoRGFoU2lvNmFXRS9jUFV4YWd0cVlldHgxa0FiRUYxaWxDbEpn?=
 =?utf-8?B?ZXFtdXZBVUJqOVpBNElGVVNOT2x0cUJqSWxZSHp4cElCWXNPN0pMcDJUQS9s?=
 =?utf-8?Q?i1qYloUa4kR5nemh+XvjwQU=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: ec19a29b-0f81-4967-c3aa-08de38bd7b9e
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 13:59:20.7827
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hAmPq5VaxVGr8dzaXD1tLCY5l+7Gh3kDnhMV4eKDv6uKnBJFy768fMS/DMMYlHWdf0QHO01f2/0GlIK6MpPNff5h3EWsBXxeIpFndHh4Ev0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSKPR04MB11365
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 11 Dec 2025 13:59:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8256

Hi Antonin,

On 12/11/25 10:06 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Add instructions on how to install host packages on Rocky Linux. It is
> very similar to AlmaLinux so installation scripts were based on it.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/ref-manual/system-requirements.rst   | 48 ++++++++++++++++++++++
>   documentation/tools/build-docs-container           | 10 +++++
>   .../tools/containerfiles/Containerfile.rocky       |  1 +
>   .../tools/host_packages_scripts/rockylinux_docs.sh |  1 +
>   .../host_packages_scripts/rockylinux_essential.sh  |  5 +++
>   5 files changed, 65 insertions(+)
> 
> diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
> index 4063253f7..66d920698 100644
> --- a/documentation/ref-manual/system-requirements.rst
> +++ b/documentation/ref-manual/system-requirements.rst
> @@ -302,6 +302,54 @@ the `TeX Live package manager <https://tug.org/texlive/tlmgr.html>`__:
>   Before building the documentation PDF, setup the ``PATH`` to use the installed
>   packages:
>   
> +.. code-block:: console
> +
> +   $ export PATH="${PATH}:${textooldir}/tl/bin/x86_64-linux"
> +

Same remark as in patch 3 and 4.

> +RockyLinux Packages
> +-------------------
> +
> +Here are the packages needed to build an image on a headless system
> +with a supported RockyLinux distribution:
> +
> +.. literalinclude:: ../tools/host_packages_scripts/rockylinux_essential.sh
> +   :language: shell
> +
> +.. note::
> +
> +   -  Extra Packages for Enterprise Linux (i.e. ``epel-release``) is
> +      a collection of packages from Fedora built on RHEL/CentOS for
> +      easy installation of packages not included in enterprise Linux
> +      by default. You need to install these packages separately.
> +
> +   -  The ``PowerTools/CRB`` repo provides additional packages such as
> +      ``rpcgen`` and ``texinfo``.
> +
> +   -  The ``makecache`` command consumes additional Metadata from
> +      ``epel-release``.
> +
> +Here are the packages needed to build Project documentation manuals:
> +
> +.. literalinclude:: ../tools/host_packages_scripts/rockylinux_docs.sh
> +   :language: shell
> +
> +.. literalinclude:: ../tools/host_packages_scripts/pip3_docs.sh
> +   :language: shell
> +
> +In addition to the previous packages, the following TeX Live packages
> +are needed to build the documentation in PDF format and can be installed with
> +the `TeX Live package manager <https://tug.org/texlive/tlmgr.html>`__:
> +
> +.. literalinclude:: ../tools/host_packages_scripts/tlmgr_docs_pdf.sh
> +   :language: shell
> +
> +.. warning::
> +
> +   The Tex Live installation above is only valid for `x86_64` hosts.
> +
> +Before building the documentation PDF, setup the ``PATH`` to use the installed
> +packages:
> +
>   .. code-block:: console
>   
>      $ export PATH="${PATH}:${textooldir}/tl/bin/x86_64-linux"
> diff --git a/documentation/tools/build-docs-container b/documentation/tools/build-docs-container
> index 9d1bfdcdf..dda4a6170 100755
> --- a/documentation/tools/build-docs-container
> +++ b/documentation/tools/build-docs-container
> @@ -44,6 +44,8 @@ $0 OCI_IMAGE [make arguments...]
>        - fedora:42
>        - leap:15.5
>        - leap:15.6
> +     - rockylinux:8
> +     - rockylinux:9
>        - ubuntu:22.04
>        - ubuntu:24.04
>        - ubuntu:25.04
> @@ -130,6 +132,14 @@ main ()
>         docs_pdf=opensuse_docs_pdf.sh
>         pip3=pip3_docs.sh
>         ;;
> +    "rockylinux:8"*|\
> +    "rockylinux:9"*)
> +      containerfile=Containerfile.rocky
> +      essential=rockylinux_essential.sh
> +      docs=rockylinux_docs.sh
> +      docs_pdf=tlmgr_docs_pdf.sh
> +      pip3=pip3_docs.sh
> +      ;;
>       "ubuntu:22.04"*|\
>       "ubuntu:24.04"*|\
>       "ubuntu:25.04"*|\
> diff --git a/documentation/tools/containerfiles/Containerfile.rocky b/documentation/tools/containerfiles/Containerfile.rocky
> new file mode 120000
> index 000000000..5430d17dc
> --- /dev/null
> +++ b/documentation/tools/containerfiles/Containerfile.rocky
> @@ -0,0 +1 @@
> +Containerfile.stream
> \ No newline at end of file
> diff --git a/documentation/tools/host_packages_scripts/rockylinux_docs.sh b/documentation/tools/host_packages_scripts/rockylinux_docs.sh
> new file mode 100644
> index 000000000..dfb201fe2
> --- /dev/null
> +++ b/documentation/tools/host_packages_scripts/rockylinux_docs.sh
> @@ -0,0 +1 @@
> +sudo dnf install git glibc-locale-source librsvg2-tools make python3-pip which wget

Same remark as patch 4.

> diff --git a/documentation/tools/host_packages_scripts/rockylinux_essential.sh b/documentation/tools/host_packages_scripts/rockylinux_essential.sh
> new file mode 100644
> index 000000000..9564bb4fe
> --- /dev/null
> +++ b/documentation/tools/host_packages_scripts/rockylinux_essential.sh
> @@ -0,0 +1,5 @@
> +sudo dnf install -y epel-release
> +sudo yum install -y dnf-plugins-core
> +sudo dnf config-manager --set-enabled crb || sudo dnf config-manager --set-enabled powertools
> +sudo dnf makecache
> +sudo dnf install -y bzip2 ccache chrpath cpio cpp diffstat diffutils gawk gcc gcc-c++ git glibc-devel glibc-langpack-en gzip libacl make patch perl perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue python3 python3-GitPython python3-jinja2 python3-pexpect python3-pip rpcgen socat tar texinfo unzip wget which xz zstd
> 

Is there anything actually different from almalinux in here that 
prevents us from using a symlink?

Cheers,
Quentin

