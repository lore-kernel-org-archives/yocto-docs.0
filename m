Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3706C433F5
	for <webhook@archiver.kernel.org>; Mon,  3 Jan 2022 11:33:28 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.83])
 by mx.groups.io with SMTP id smtpd.web10.26629.1641209607917354242
 for <docs@lists.yoctoproject.org>;
 Mon, 03 Jan 2022 03:33:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=sxgSKF3P;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.0.83,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ElGb9UhwIFpN2QtZ7z7Y/62aefR2bQk/d4W7lnMNME0uTHWe7E5NhI9LpjNnhgAWo6NCNvBkAXHMLf9tgpWbzcYjY9d0t/rGKF/ZJJrT3mYkG9bzsIK0ANpKySCUQHA9I2Ik8joXTKOE8ql8LSvNA5Vgi1QZ0OtdmEnEj/u6V+FvLeVnGa2K3BTjXLUA0lbBdOfNN5Cxm5JkL6GiieHfL1zhp2nymLzNwgU2TbdN6BSIGGIIrytjyw5ZuSa059WTRO22vTHmd9PCziZZEW2QXhlh3InNlUDj3tx4cIiJoawGySeGi3+EkB91LI6HIkerSdQoxTXRWyWQwogcnEETEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JcZ1XYlKNS72jXxDEU5+zMlnYMmRTjHpf6mdZ4jgGzc=;
 b=Yplq3X5+z7fHFuX3fvmyiXw5rFLdkQhhpJMKgpo8qccNDGg7RzAJjsUAAx2SY4PuVfnVVhZsQbkqVJ/z+GrdxbDqXXnLlrW6xuhfj54nRpc7vQO2+CKo4mWMc+suMXmqPtGUpfXdl9cmUn9pRoJyFacFvT8pL6nqIjYpcXrsFBBjNg6a7YB2R9AWsegX2QrDijnwXV7bUlzsnryvtfMA1qzj2SfYR8bZ9G2GeeT5bDakGrDRx0G8zYTNYyhsdc0F7fXXHBYuz0KNxAWYGxk/jrAuHWyyOBgnsLEgXWAsk8JEpK5nR3rclXrW6zmlWL8vJX0l3qVy9jfMB7I/eSNCQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JcZ1XYlKNS72jXxDEU5+zMlnYMmRTjHpf6mdZ4jgGzc=;
 b=sxgSKF3PycJX7xcTxc4D81v2iZWkXz5us+q5Htu6P3ObSv2wVf4zIYtRDrMnVVB68l84NpX0/NK2nFOl2+RUMWRXqyIjjjmPmjZOQhtvb0OSNL1q1NBLcSzTXRUqg3N0HxXCs6+V96AnbSZwNRDmqjJlteqo9Ot43Ktr0QU5U60=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by PAXPR04MB9325.eurprd04.prod.outlook.com (2603:10a6:102:2b9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Mon, 3 Jan
 2022 11:33:25 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::a8e8:87d3:e868:cc93]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::a8e8:87d3:e868:cc93%5]) with mapi id 15.20.4844.016; Mon, 3 Jan 2022
 11:33:25 +0000
Message-ID: <0de8f52d-db3f-2e51-9633-0b957c1b675b@theobroma-systems.com>
Date: Mon, 3 Jan 2022 12:33:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [docs] [PATCH] ref-manual: Fix module_conf typo
Content-Language: en-US
To: docs@lists.yoctoproject.org
References: <20211227185854.1125884-1-robert.joslyn@redrectangle.org>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20211227185854.1125884-1-robert.joslyn@redrectangle.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR04CA0082.eurprd04.prod.outlook.com
 (2603:10a6:803:64::17) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2136dc03-38b5-4f52-12c5-08d9ceacdaf2
X-MS-TrafficTypeDiagnostic: PAXPR04MB9325:EE_
X-Microsoft-Antispam-PRVS: 
	<PAXPR04MB9325F0AD06F60F6B541223E5C2499@PAXPR04MB9325.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Q03e/ebcaOkDaic6ffk4Ly2eUxC9ZtyQBuH1lSGIiAnot7zL+1Ci1NbcgVakauun8bfGdzusuWtgDGvVqQNZ0JC1cSCOTZXMWdUeKHhTUzzq/8m/wCn8iOw5kxAWftFV0qq9mn6VphLC6jao+YPipqnMS2RhR0ocFPabQQ93efM0RENxWDBckD6/ZW9uNZibz5D2kE7aJ9LGToISG8Qn411sI9OI0akxgNx8pCf30WmuS5430747d00IRFVFOLLNuS9XJ9Q1Xcy3CGLDoqHwhBwDpJiSPM9aPzaexe/y7bMrHOoGTuA1KhULZR7KO976V1CL0tC7C4vxYwVIF5K0JKMVtKTvJkWZTMfWEKPC3gcxNXaCeuCizKwyE1GcqSEy0kQgnPzSiZeZoDKmqAzc8PPKm8Ff6bdjQzPa1cN2xeqbypdUnPIlrqm9x0sQPEyy8qlnf8QZBGAGrIdYLxXrlBUi81Vc56v8rEMKB2tDdh6gcgg94q9GL7JRptG4ESa1+oUobCBm3p0ymPtHvFCvVEDrB4QzGa3Ca6M+lIRiwvTaq+PEpjWcvDPj+lxXgoz7rF93yLZooX7Tisvp1fOME5+VaijRMf08Nk/DH07JelTyeuAwqybyhDGex44WicPc/4b/QHcuirnZXVYcqxE0F0XYAYMh8vOC3GCMAJ5yfDyKxEVJshNmgZAdiyTmaEKETXLsRNA9fDMS7pf8TnSarumhC8i50JruSqcfYggc6GI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(53546011)(5660300002)(6486002)(36756003)(6506007)(6512007)(558084003)(6916009)(66556008)(8936002)(8676002)(66476007)(66946007)(86362001)(316002)(2906002)(44832011)(508600001)(2616005)(38100700002)(31686004)(186003)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bUw2eG82cWpFQjZVWVNMODRpZEViaEEwS24reGpQZkk1VVJndVNtWjBBU1FW?=
 =?utf-8?B?ZUZwTDNieGR0dVYyZllmQmJtUDYxaWY2WExwMnNTRm52QXhDZnJoVDVOS3R6?=
 =?utf-8?B?Lzl0NjI5bERiTzVDaDgrTVlPZjFZUE1KTFp0b3cxT1FBR1FhdFE2dEdqcVFD?=
 =?utf-8?B?dk1wRHZ4R1gwY3A4Rm0yMzhNTUd0MllmZ1VsUFVjU3hVaWczTGZmSGViQ0hk?=
 =?utf-8?B?V2F2TGhDOFY5cENsZEF1a2NLNzhYV080b2JaNU52YjlESkFuZGlRSGE0aFIr?=
 =?utf-8?B?NGhIK2oyV3pVdWpPTWNreHFldEtSN0NlbnZGOGJrMGRqdUd4b21naEE0aTU3?=
 =?utf-8?B?a3owVjhHVzdLQWYzTHdUeXZlZjNVdTZOa1pldXZnT2pIK3IzQ0VYMFU2akFN?=
 =?utf-8?B?eUVBek1hemNqbVpvdy9GNGdiYVl5S2JSdCsxSE9ubVFIM2FwOGlzTG9vOHh4?=
 =?utf-8?B?VTY4V0YwbDBqNnp3V1NYQWJ0b3JIRWE1WTRCcW9uS1M2cHNuVUF6SndRL1M3?=
 =?utf-8?B?dkZqV1RPSnBTanpycG4zelk3eTdwMmg5ajQ4S09ZWlpnMEpDemd1UnJMblAz?=
 =?utf-8?B?WThreHN1dXFBS1ExNWZYTHF0UmZPeTQ2Z3lVVlNtMTdUNkR4QkUydXd0TW1S?=
 =?utf-8?B?UmRQMUpMQzRYWVhMeG9EV0JBY2dWblFxcVhhcDRWM2F6MDQ4NC9YWGdhWEZQ?=
 =?utf-8?B?S0dIK0RNZDdNcHRuTkRJUUwwZXN4eG9JcWtRTTROOWg1UHQ1azNZM0xKWGhi?=
 =?utf-8?B?QXA2TkYyaUNPWE0rYncxb3RxcVRDT3lMeithaXJxNEVTV2FabUJlQ1h4cjlH?=
 =?utf-8?B?QytsS1NiVkxsa3laTU1wWnpOMnNtMnUyS2p5VnhKUi92SjhFb29vVzRxdERp?=
 =?utf-8?B?ZWtxNnUrR25tWXZ0ZWFWSXh2OFVHdHcyM1hPYkIxY2VJTUx4UWdiTHNJV2xC?=
 =?utf-8?B?RTh6YXNUUlBybTJtRGNZLzh0eWJ0WFdtb0Fnd0pkNW9tbXUyb1NhZk8zK0Ny?=
 =?utf-8?B?Z1NoQ0NkSTVraUJwYjJ2YjFFeitkYTBZMjJFbVlSeCt0R0tFaTZHRGpHWlcz?=
 =?utf-8?B?SEowSEh0YTcwcmp0Wk1CSmRucTR2OWF2RDJpdVJObmk1UE84MXFPamNGb0JR?=
 =?utf-8?B?OXROQkZ5RTl6aW5ZSlI5TXBtRS8vbXJUZW8yc1cwZW9Ld2JOSjRTMmRpYlYz?=
 =?utf-8?B?SzFxa2RjdEdEdm5ZWGNTT1NNMTV4c09uN3NOL1pOelhNaEV0YWVkUXhoYnVm?=
 =?utf-8?B?WVhreWdtY2gxTjY3ZjhKdzBmdHRabllxR0VMTmRiSlJnd3EranBMcEppNXRq?=
 =?utf-8?B?MEYzbGNmdzd6cmVwVE1IYzNESEdMNGIyUy82TDRlSlR3TjFKRHhDSGlaZWZ3?=
 =?utf-8?B?aU94YjZHbXpUb0MrQXZVL003dXFRU1BZamU2Y3Y0WjFGczJvbllKL2ZiTDZ3?=
 =?utf-8?B?U2VPbTk3cmo5THdtTUJ4N1g4eldmNTU3Z1Y4N1p3Mi9zVnVBVjg0ODJwR21m?=
 =?utf-8?B?L2hNZlJHOENnN0h2Y1Q2czYzQjR2Tnh5YzY4NEdjdkxESU5BK3FwMXlQOXB5?=
 =?utf-8?B?a0thMlppU3JzOWpiZGNaZ3R6eFVMVjZnSWJiYlJsUE9OQ1AzVEVTRUN6RDc5?=
 =?utf-8?B?WkJNT2JxV0xlVDRhTzVoNXpnL2p5U3g3Wnc3TkdQLzQ3dUJpQ3BUNVFLR3N5?=
 =?utf-8?B?eFhKaU5uVDFYbDZoVGJQV2lkdG8wUGtXMVRDNncvd2lWTUdoTHMzSE4zbE13?=
 =?utf-8?B?UVZwbXBNejJYRmlZRVZ0aHRMUG9UL1hCelgyODJxSS9iQ1FrdTFCSGpWbWZv?=
 =?utf-8?B?QVhSZTh2SURVWFFkK0NDQmlEZ2s0TjA2bHJ2UkVoaEdmQWF6VW4zN1UvZGxM?=
 =?utf-8?B?b1NuYVhDUHRoN002cHIwUjJlTjc5U3VRanpiZkJQUForbFFQdkk3Unc0d2Qy?=
 =?utf-8?B?ZXBPSzdxdlRCanFhdzA5Y29jY2xTZ3VReWJxdDFadi9aSTZEZmMySmNpY1Fv?=
 =?utf-8?B?bU45OFo1bHY5YlpwN25HRGtTcVBmV0JIZG9rRXJoS0IwWFNhS3RiTWJYU2Fq?=
 =?utf-8?B?cWlxTk02dE1oVGxxUStlSlFEL0w3Q015VHBoZlUyNWtHSjNudFhhWHJsa25v?=
 =?utf-8?B?T0tQWHZGbHFYcW1kOHh5RE80alIwM1oyVXdUdlZHSGlSRTE1eFhPN0gyeEdL?=
 =?utf-8?B?ZXZKeUZxMHJFMkZ4SXlBVzQxb3hkRk1JL3JqQkxLaFFzeTBBbXQxenhxSnhz?=
 =?utf-8?B?bkV2M2Rnbjl5SHdjWUhlT3JWTzl0bS92Ui8rMUYwZDlOMHI3V1plVEh5alNj?=
 =?utf-8?B?RFNBQmgzRkZjZnBGZ1M0SXRrU0xDMmlzWTNUdDV1ZmdpSFJQd0NvSkVlLzhV?=
 =?utf-8?Q?wkBvANrXl3PmsRzE=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2136dc03-38b5-4f52-12c5-08d9ceacdaf2
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2022 11:33:25.4361
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 keJl5705wZf1cmI8vLNYMZERdyMfEEQxVgFUnplQ/+LsQ3NZJaMrcCrFp1qmnoXw5Lyhm294hT+tAIoHBez810sZ4O0JofxJoAW7al4NOAhnGSB+vvYODYQoQRVjUmqM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9325
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 03 Jan 2022 11:33:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2330

Hi Robert,

On 12/27/21 19:58, Robert Joslyn wrote:
> Modules specified as part of module_conf must be listed in
> KERNEL_MODULE_PROBECONF, not KERNEL_MODULE_AUTOLOAD.
> 
> Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>

Reviewed-by: Quentin Schulz <foss+yocto@0leil.net>

Thanks!
Quentin

