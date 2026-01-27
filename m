Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E326CD2D8FB
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 10:55:58 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7877.1769511356262777359
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 02:55:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=eoiB+PVq;
 spf=pass (domain: cherry.de, ip: 52.101.69.56, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AIYkYrJ/RBG1BPBrBPuUNzwF6284Wk+tvWa0QK5FQ5KhS2xviA316rPuSBslujewf3Xacw5gwdE8HLQjZ5dP/fTaiZ5cCm+YsUvP21yQpc0nynnw/3XMcgJogSQ8Y1sq6fogH1uw5fyW8XseT7D1QJfDjfpsZCuorqXSO6YFWqarvsmN6FaMpYfxNU5GVT0U9kajqreH4iXxCYnsFpLXSzX856NmxDyjPpR5DhTVO5PG46+Vl3DUJxX1aC2XwWOaAH1wY593Po0KFZ/yY6+3QXe6etkMl68SeKIhpK1I9tRqwQKTD4ebNACNIX6BGyUNYIiLX2DLMbdiEElTTE11WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ED0viWuREonw7+o0a2sD2h4rr/g+8EIviowse9iVSRo=;
 b=D1cnY7uZxQFh9bBwSBUHz1bI8hOV4r1AeDM9+7yTq2H4tEJuKDplDBBu+yDQQOmXm/UIYIPi0Wpd6FHicP1UTFTP6bA2KhnnfN/gVaconLHY9ONuUqy4qXqv/48jbptEVv6hfQ2gnLHfXmDI0mYJapGtu31u+gfKp0JyUHTzYTlp5Uok7vMD4f7WQ4ptO4gZEDcryjjh9Z5uW8n4d2uI4JQYajPdJQIJpj0sqVxqHWTPHQHZVYq6vnfxoqgP9O0e5Ksw+b4u3mBS7MLWczIyVhQ87/LOXd8GzMSVigvoh0m8RR8l9p4VXi1X6yLMlKz6Bz5S6X39wK9rMqNkt/+Cfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ED0viWuREonw7+o0a2sD2h4rr/g+8EIviowse9iVSRo=;
 b=eoiB+PVqV7sKYCL38/kIZgb4q4SZD5IBE6uhEiCAmiLjedjffHAKfKIRKT5c4SkxuiTlw97l5Oy31aDV9NL1Xv4nSjuh2mGVCCUegreTHefWCt+hbxazGpCx5Vtt+tNe1X6IgZVo/xrbqgh/tF4Pj6nFiz6CAc44VwdOBWRhun4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by PA1PR04MB10842.eurprd04.prod.outlook.com (2603:10a6:102:483::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Tue, 27 Jan
 2026 10:55:51 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9542.015; Tue, 27 Jan 2026
 10:55:51 +0000
Message-ID: <2cb7db2e-42f0-44c9-86b5-536f0a327d2b@cherry.de>
Date: Tue, 27 Jan 2026 11:55:41 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 02/56] dev-manual/poky-manual-setup.rst: remove
 obsolete poky repo references
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
 <20260127-remove-poky-references-v2-2-74bf80cc4e5a@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260127-remove-poky-references-v2-2-74bf80cc4e5a@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0037.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c7::10) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|PA1PR04MB10842:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b93582f-019f-4a07-676a-08de5d92a2f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|10070799003|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Z3RYcEt3b1NRVHFNTWZVU0VKWXZGcFlxdUVaVzRkQ2tDQ2Mzd1RNaGlnMWYw?=
 =?utf-8?B?MkVOSk00ZWlqeUQySkl5TXU4cWdvVTZITjZjWUVPdkRyS2hYS0xybUhVWnpS?=
 =?utf-8?B?MHB2cDBmWG1pN1MxR2dHNDJwdThmRHlJbDdHZ1ROSktPUTZoQlpJS0VEdlps?=
 =?utf-8?B?WUhqZGpQRFJTRnQ3cDI1SzlqQ0FFRUE2T3UyREtBNW9ZbnNUR2RjNGd5dzc2?=
 =?utf-8?B?UmFxWHA5YkFNWWl1STNmTHl5S3A0aERQTXRzeUZlZ1JJS1dnQWgyR1pJd3J5?=
 =?utf-8?B?NytlSDErdExKMlRJcGhyMDJBTlI5QUM4dXFWd1Bqb0lkelg3Sk4xa0VyU09U?=
 =?utf-8?B?Yzl2aVByQ1pJdnNGeUtVc1BCWG54T01jVkEyNEF1bk42T1FDM282bmlRVi9I?=
 =?utf-8?B?SE16d2cwZHU4V0E1aGpMVHJ4dWxLVVE4ekRPUkZTcmRTaWhtWnNUY2JqSG1v?=
 =?utf-8?B?cG01NDdJOVZwMjVCT2NIc3ZPdFNaZElNLzNmdzRZaVNoRkQveTdOUlIyTk9k?=
 =?utf-8?B?WWQyUGkwcUNqeUJzVHlLSWZ3b3ZLVnFDeGpzc2xPWXNvczZVUGt3TXFuN2Ex?=
 =?utf-8?B?NUlHS01oaUZ1Q0g5Q3cwT2FKTlhSWkJrNExnSW8wOWt0R0pPMm9XWStXRXhU?=
 =?utf-8?B?Vm5xeExXb2JJYXFjV1RBNzJvN0NnSUpPaTRoWitMcE9lUFY2TmI4R2Rjd2dx?=
 =?utf-8?B?QmxUR0VHNWwwb2tPcTVEekVQQ0thM0kwN3ZBSzlnZHlMb3BqeS9qbTl4dk5l?=
 =?utf-8?B?ZjhDK2VOUVBZZlRVTDVlTTBXa0tsMmtqTXJLSzdRKzAwZzlWT2x2UEhyUTBR?=
 =?utf-8?B?eDI1UGpGeDB1MjBPdndWeXowMWpnS0pLbUdrdWtHS0JOZjVCdisxay9Qa0xF?=
 =?utf-8?B?bVlZQ0RmSTVCS2hvYnU2YnNWNjlkdmI5NmlHQS9ILzNmVSsxcS9SeDNnNlpX?=
 =?utf-8?B?THBDbEttc2lDK0szNndCbW1wNnhLdzcxVVllR09zL0NPc2R6Qy9FcFRDUy9T?=
 =?utf-8?B?Tjh0MlV1a3ZTcVVrUmpQTEZTVmdHK2Vtb21kejQwMzZJTlNtaytEbFBrdXNi?=
 =?utf-8?B?cHgwa3c2RkN5N1NvZ2RZUzB3Ymd1d0hOU0FobDVJVjQyMVVUb0JhbmhWOURC?=
 =?utf-8?B?VmN3MFIrTk9YbGpYdzRqd3dHZm0zeTN6b3ZTYmZrOGNRaVNZNWRaQzVxYXA1?=
 =?utf-8?B?eEJZSURWU2JjeURJRzdGRlNjV1grbW1CR25iZlM3K2l2endzV3VvczhtMEFH?=
 =?utf-8?B?SlZNZkJqK09xWnlmcXR0R3dObThSS1RZcGFwczVnSm82YWJnZVc1bmhNeWlH?=
 =?utf-8?B?YzJSMTdBL1A5c1pubVZWWHJvQzQwSm9iU3RmN0MwY0J1WnZycW5MQ29Ib0Y1?=
 =?utf-8?B?VzljWHY3TzZCSUV1Q1BpSWZFK2pxQXZkMkRISmROS3hGZG5Sam01dCtLSnFk?=
 =?utf-8?B?UlNqVFM4YjN5WUpydURxdlFoY0l1OXhqUmlFN0pKVnQ4NGJibHJkN0QvR3pl?=
 =?utf-8?B?Mnc1RXM2SVdzSU5nRFR4Q203S0RjbGo4WVpWV0dLRlI0TGxrd3lxQkNvV3lr?=
 =?utf-8?B?VDF0NDRadHBzaHpDU1hBa3RtdndyWFFYZmhUVDJsRm1JcGQrSml0OUZIdmNC?=
 =?utf-8?B?TlZMa29mdURRcTdENENUQ1Mza2Q3enRLd3ZvbWJCZTA3VWtPaktHdS90cllL?=
 =?utf-8?B?a09wYldvcEVwNnVKWUFDb1RxS0dWRWpKYm9WNmtsYzVxUEdOdGwreC9zUmVq?=
 =?utf-8?B?d0o4S0lQL1ZuV1dYeFdBZlVmeGtvZGJUNlVHakJmcWIrdjRoSDJ4Y0RsRllO?=
 =?utf-8?B?aHNUQlhmTlZMSlBJcm1LMlJycVlWeUpJUmZPdTc2UnRaSksyUHB1OEFPcXdJ?=
 =?utf-8?B?MU5GY2RMUGh0aDliVWs3cUp4dGlMekJ6WjVJaU5XK0hoc3hMTnQ4bHpCVWFy?=
 =?utf-8?B?RVhiWDlRWjYwdmIrMVRXZ0ZjbG94S09lQjhyUHE1emdYU3lMQXFwZ0kyM2FL?=
 =?utf-8?B?Ykx4Mk9lL0JmUHZMU25KRGFuaDFRdXpKYVQzYjducGJ0TUhvaDArUG8vcFow?=
 =?utf-8?B?RTZ6NXBFdmhKMXlUM0NPYitteExwSStnaFBRbTM5RTVUc1VmclkwNW9QOW9S?=
 =?utf-8?Q?FzHw=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?b3pkZU5rTEgyWUZUeGJIdzZiVm40RnNiVGdxLzcwN0loOTdTSWJtUFFTNVc2?=
 =?utf-8?B?VUo1TGlueHFRUVNHY2wveFgvTktDbS91THJ1Vkk3VE41ZzQ3bkY5eDNkd3lB?=
 =?utf-8?B?MG1vaU15aVZzWmlKVmZsLzlWanV1UTVvajVsendSSnNrWXdNZnEvaGhBYzJU?=
 =?utf-8?B?RWhadkhJQm43QmNOZGRlV2RNYzZmNzJJMWtGZ2dBYitPV085dUhwU0NWSDVW?=
 =?utf-8?B?RTdEdWpOYlIvOWdYOVpIOW9HM3VmSXVWdndTeENLVXM2VFBhbFVkQzkvZlBy?=
 =?utf-8?B?VFpDN3F2R3lkSHB5amlsRHI1U0g5Smd4VnVBVFRMeEZla2RnbFFsTk5NdStx?=
 =?utf-8?B?ZWgrZGVQdjlROGVQNzJENXBVWWxZYW90L1FncDNpTlh4MVVtajZrZGVTTVRh?=
 =?utf-8?B?NmhIR09CdXhHQ2p4aDhtN0Z3SXUzOWlEMllJYmNqTmNmWUJWbFhjck5sdTRr?=
 =?utf-8?B?c1VlRTkxeERjZEkvU3BIS2tQZHd5ZG1mR0JYL2NySGo3MGFqZWYySE14T3px?=
 =?utf-8?B?UXpjbW5FS3l6MDJKS0xxTFlOOWgxWkdVTm81bU1sWUY0MVZHK0hNSTRNdk1h?=
 =?utf-8?B?S05jN1BSbUxkenRmYW5HT054T3Vod2Qrc0RiS2Ezd3VjQXFwNG9YM1FwMnZ6?=
 =?utf-8?B?M0hnaFZGRFkvQXF4empnUEYvRDNwNTJHbkloVUZia05xN2k3OGUweWpveWJQ?=
 =?utf-8?B?Wk9pWTFJejl6VWcwVHpad2NMVVpJSU9DZ2V1YnArS1E4MlNMZjNvQVZ2M0x3?=
 =?utf-8?B?b3lHaFZQbVlIRUt4c3I0SUdJYUZ5NGw1ZzN3K0lvbUc1MEZFbHBscjRkWmFi?=
 =?utf-8?B?ZWwyamlicU9zbEVFZkdtYVNvN3Y0OTVESEhSWWdPZTRDeGJkN0UzMjlycnNC?=
 =?utf-8?B?VkVwZW9KbGdKd2R2b1VQMkF1WC9MWmJvQ21zdE8zdld3cCthVjlOaS9Zbnpt?=
 =?utf-8?B?eEQ5ZGI4VEhhZmt5dWNPTGI2UGZtQmtobnp1KzdxVVJwZWYzMzRPOTA1dGp1?=
 =?utf-8?B?NEcxYlI0N2liSEJRUGZOZW5QNmdtMStiOFl4Tjd0a2U4NTVCVDcxbnRNRC9H?=
 =?utf-8?B?eC9sL3N1K0FIUlA3NW9aSGFkcHZWVkNWTU02MUdpMFZsU1F4U1B0TmN2eUk2?=
 =?utf-8?B?NHllWWRQWVpXV29XdWMwMzRhRFdYZEh4YkhIOGtKb1BucVFNZjk4OFVzdmw0?=
 =?utf-8?B?T0xlbGJRbW1iRmlVYWVFZElOdzFtOUw4elE3Vnh1VndVODFicExmTURtV2p4?=
 =?utf-8?B?YU1DMERBdHdXZG1OeGhEb3ZseUlCdzRZODVxOElDU2p1OGhFL2ZKeEJkQXB5?=
 =?utf-8?B?TkpjVlhhc2gwR053akg1anZXU2RiaWIyYzJ0OGdSNTNSaThHalJGNktPQ3Fz?=
 =?utf-8?B?NFhCc0VwTDRIcjdwaUk4SHRSSnFwVmFCK3psYlllenNRWEJ6MXRNRTQ5ZWZ1?=
 =?utf-8?B?b291aWRqcytLeWZ4ZHBBVkhHclFIK243UENQbWRURmw3MXR3ak95blJhS082?=
 =?utf-8?B?QWp5elNSOUJXaGNrQldQU2EzMjVpeTVmekU2L2lwUUpZcU5kV05tSFNkQkFp?=
 =?utf-8?B?REtsKzYyQUh3dThwQ2FIVHdCRjQxOU44MDNtWC9WUVpwVTB2Z1BVK1pFVlpi?=
 =?utf-8?B?S28wQTdiVG1Xa0sxTjgrcFNGSHdJK2ZyZmJhMHpicHZiSnNtRDZiT2tuOXJC?=
 =?utf-8?B?RjF5MHhWckdMdHhsNWYxS05RVE5QRDVnQzM2a0hpV3pkQjB1SGpGaDBXUWkr?=
 =?utf-8?B?eU1wZVYvc0htc1U5QzhUQ0xYempieXVYWkgrakw5bUNaUkRYdzRBM0NlalNO?=
 =?utf-8?B?cGdXNW9HNU1ISTNGZlR1NFVVNTRDTHc5cGFjK0VoU2MyeHhzQkJEOGxHd2Mw?=
 =?utf-8?B?ZE9LZzNqVnRIc3lvb1hmZ3Q5MG93YXZmMURaanNiZXIxVkdjUGNOTkcvbnRY?=
 =?utf-8?B?NytZd1laTkZWczFOMjFCb2pLSXovTmh0UUV6dHBxWTJFQjV1Yng5azZ0REdR?=
 =?utf-8?B?ZGhFd1MxVzJFczZRcWlkUmpiRmZvY05qMFE3MVpPeGpJREw1blV5Z2ZFVHU2?=
 =?utf-8?B?UUpZQkNSV2lPVG9DazRGVFM3QzRXT3pJb3N0ZVpmcnViaVBzSm5IdkNXNW9O?=
 =?utf-8?B?clgzUjJ6VTE4NTZJeHJSZjdlS05GWFRyWnNqeEp2Si9oclU1ekJ2cXlvNjhH?=
 =?utf-8?B?dWVnWEdXNVdBblZxNDM2dlZLemVPV2prNTk4eE1xVmRnL0xVVXBtV2hQeXRC?=
 =?utf-8?B?QkIwa2JwNm1hTW0vQ1M1ZzYzcEhNZVBGUGRkbnZ6NmJtS2Z4N25odnk3cGZN?=
 =?utf-8?B?K2FXK3MyYzZFSHkvcWlEaTNEWUJ0clo2bkxETkFUdFpuajJRNkEvVlFCWE1I?=
 =?utf-8?Q?8fAHa1D3bqZbQKmqXS/L3td8dEXRgeQ5ORjAm?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b93582f-019f-4a07-676a-08de5d92a2f3
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 10:55:51.5328
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kANiZYVkwgzeVgH9MC5xV6xctx0/lyxW19E6VpV/AoWSQlBg7datzQtHzqlt57BpAJjp7LAvdZp3kpi7gl6ZuNQc0VghsMF7YeHkB4KVqio=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10842
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 10:55:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8729

Hi Antonin,

On 1/27/26 9:18 AM, Antonin Godard via lists.yoctoproject.org wrote:
> The commit "dev-manual/start.rst: simplify the document after poky
> obsolescence" removed some of the information related to source archives
> published on downloads.yoctoproject.org. Mention it in this document as
> it makes sense to use those when manually setting up a Poky build.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

