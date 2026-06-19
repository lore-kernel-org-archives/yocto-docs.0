Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 150B3CD98F2
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 15:18:36 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.25])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44881.1781882307581353068
 for <docs@lists.yoctoproject.org>;
 Fri, 19 Jun 2026 08:18:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=jlnLuUgR;
 spf=pass (domain: cherry.de, ip: 40.107.130.25, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XBcJVTCB7twYoytWudLCdvswezNW6RAwg4DY7XvQopeFNoKHXsj7sochH5FMTTDJiL7cBmvv9Wi9c3HAs6tUhdc6NXG8eCrM1okGzESqsMhUo0vmWEZYU1QPMIw1HfZwTlMoZJqVX00yV9iLb0x70pb83faYeXJotTszofw5oAcQXmzmGkNPL7IODPo3KuspejdkooyCSZuE9dtTD6PJOj+9qwdHpQosjNv0hPm5UO/ZJ4fpVJoAgOB5o6hMZBh/XDzy2mStz/EqBKfC7l5P2iW57nXTDYDzzdu5JrKA7AdR5Pubc45RRYCf6P1WOmI/V5VCp+WZq9QNciYvyx8vug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XfxH305JUIz1Wg2MwxtY+sUSs9fhRm330k/KJ3VWH5o=;
 b=TX2bxQoE8Evcv/1SGkPF17hjxoKuNUmbUPE6RNHT0G3NSxEb5mCyh4A0YUJN9f4/GsNy/ysuyJ5OyISMSAGckpaAA3cQzb8/qtKBBAntw0JB376oqqNxJXc+UgCqT7NCIWBKZTY3ES7dmcjEaj+dca9LZjk24qBVrYWCvy0VbZw6d7uesUzoOqFY5EDqH6N2yAiJrbQzHvygTmzKoVL6/lDYK1hRzaJqNmjV51vAWBH22X1PCYG60o0BQbL7rZPzg2ruw9KZDg9PwMWmOCdXJsId6BrUNnais/tKo8PfwUNLnChjkvByunB74DaRAezR9AY37q0G/P2vxtoIRSkVag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XfxH305JUIz1Wg2MwxtY+sUSs9fhRm330k/KJ3VWH5o=;
 b=jlnLuUgRkmSva/3ztqnhU3oVb5WY3WtbFMvpL3OF5/oFjikRvEEUXO/LtyUxwKwM2B92ymKe44PWAKWNGTFdTIDGvXsKouJoQPIpTOo7Hv1vgxo4JOvCHxk+7o9sLBlleSqyrvuaWGaujaGel+9BufYta64yTj3Q3TljL1pbGPM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com (2603:10a6:102:b8::20)
 by GVXPR04MB12127.eurprd04.prod.outlook.com (2603:10a6:150:313::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Fri, 19 Jun
 2026 15:18:21 +0000
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7]) by PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7%6]) with mapi id 15.21.0071.010; Fri, 19 Jun 2026
 15:18:20 +0000
Message-ID: <b2efd029-8b9b-499b-91e5-dce3646f384f@cherry.de>
Date: Fri, 19 Jun 2026 17:18:19 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2] dev-manual: mention that "bmap-tools" is
 transitional package
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <79fecd83-e402-c49f-ef11-ea4024ed77e8@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <79fecd83-e402-c49f-ef11-ea4024ed77e8@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0241.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f5::6) To PA4PR04MB7743.eurprd04.prod.outlook.com
 (2603:10a6:102:b8::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7743:EE_|GVXPR04MB12127:EE_
X-MS-Office365-Filtering-Correlation-Id: 641b2a42-43fe-4cc5-73e9-08dece15ff48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|6133799003|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	qxx5VdLLjIKFN37ujla66L02t/+TgN4dpKendZv3r2cz36wLe72y3sjaxPcoeAj4dGLyRfUorsXuNrPUIbK2C2jqLGeldF130NOISEx/urP84PMcMlfgvVJFCq1JxsQS2zwpvaP1mMHEuhFhedXnwJuWMjP3/iebAK007JxR125qFHXkk2pYqNqZMbJ2AMiB1AE9c/N08uwSmwauVKqVDn5BEVYHDAblL0XWf7AbsMRlE9pWy2KXgZAe4uCDAIiV2qNavyuykqhAH4gOA6eiW1FBSrQHVgmwgSa6JScGfjDa6KZSpcKU3uliuQBwsiVUzEb/O21xsI71IKZrOCjq2JUMGyhJ6O+FHLFUvxcm5N1c/7pDHexbVq8O0xZtJmdA1ssI0/OLn9YQt6wm5+ZkNxxykCRywo/CkzGVUu+kIOe70XzOf0siu1D6dhsQawIKw4yXW3D3ZuIMWCxudm4IHm7eXUNieocRxMsld1cwlSrnqTg+Rnk+y7vX8eKyTdRMHwFZqtIcgagoA321HIbImlSL5N/pzPauWC4fuwUVp30kae9H/s+6T5SY/UfdaImuw5I5tuwOQmCaR7M4ZynPBjq9HAwb66vBnsECinb2ZR3lKGNIZBJ6xrrnB4JlH0sPAzdONYGvfYd7s8GlvZbRPxvZxsSxSayJRSNafOw8xLE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7743.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(6133799003)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cENQZlNpbVBHNzIzWUl4M3V5WDQzUzh2TkZXN3NYT0lTY1J5U2lsZzhRZlYx?=
 =?utf-8?B?SVcxVEdwSFdvRVZzSmpKeHY0MjRmTkFibzY4RE9vZUkxMHNWVlJiQ3JBNmFH?=
 =?utf-8?B?SURNYzErV3JmME13UGcrVzRKeWF5ZXRqSnJpYWVRU0VwRVBRdWpEY0QrWVNU?=
 =?utf-8?B?QzM4RUJjTHViRHJHMjExWHc3WnQyQnZKZU83dnNuN01LRWFkNVRWUHZDQ0pY?=
 =?utf-8?B?UGJtdHQzS1l3dWNJem9zSGdPTDFEYkVMdGUvYWxXVlczK2llaXpaWDl6RG1w?=
 =?utf-8?B?bFNLMXE3eG84akw1b0h3b1lkR1dhWVhhQjBFRVcvNURaTTFIdUxBVnlxaE5X?=
 =?utf-8?B?alJmQ0QxT3hQeHFwN0l1ZUF2NHdGWVRuUllKWGM5WnRlbVZaYUFWaVpkaEpZ?=
 =?utf-8?B?ZEV5d29VcmxjUFovbjF1WlI4RnpOWGpMY3B4Z3FMczdCQjZTeU5JZzNyN1hS?=
 =?utf-8?B?NGJRY1V6Ujl0VjdydlEvUUxYNTE1V0hLakx1blY5a3dQT3FTNTBCb2htOTNh?=
 =?utf-8?B?YWs5UEhDdTczVzFCQ253c2pJcTZ2QStIU25QNUpMT2IzS2JVN1FZWG5tOTZy?=
 =?utf-8?B?dEZ1UURManpEd0lnVUVVNGlBeC9tQ2ttemtNU2srY3pHYXZubmhuMzNBWHYv?=
 =?utf-8?B?MjNKeTdYT3VPb2ZWT1JwRnB3QWd0QklIcG5yMU9hdStZMCt0SkgwV3NERjdY?=
 =?utf-8?B?RlpONkp1V3h2dTVtNnZiQlJWNVliMEJxNlJwY1VobVRUTlcyWjJnempWRkhx?=
 =?utf-8?B?aWl2MEMvWHFraHcrRnora1FRSCtlcXNPWlR1dTJyRGQ5K2JUUkl5N3FCRDk2?=
 =?utf-8?B?d3J3RDlHMnUvdk5TODdSODR3MGxRQVArdVIrWnpXSjA5ZEdwOXkzb3htU01V?=
 =?utf-8?B?ZEpxSWZJSVZidkM5QUJNKzNQQUJxaUUzQmIwWS8rWUlHUjRJOXRNSll3cGkr?=
 =?utf-8?B?T2pETkFkV1BVRjMzY3pnSVg4dFJQemtXWDNuK21qblFTTTdRVExURitVaENI?=
 =?utf-8?B?My9qS2dIWExuQ3psVkRCVzBtSThwbzFQRjJNU1RlN203TC9GNVU3eFZoWTVu?=
 =?utf-8?B?RzBQR0dnYzQveWhqbDN2eHFJK3NWQjd0WU03bkI4S3dEdlYzTTVVMW95MmxB?=
 =?utf-8?B?cWhjT0ZSa1Q0R1pUSVpkWGdxaEIzSXhBKzhoSTNUZkJOS3kzdlk3bWZBNzg1?=
 =?utf-8?B?VXJFTVltZDhTcU9aOWwyU1d2cjZuVE96UDM1RUdZWHFSMFRmUFVqbjZuQUZk?=
 =?utf-8?B?SzU3M0w4U05xL3pESS9OTmVDcDcwZE9kTkQwZTVuekNvWEZNc2JQNmM2dGFG?=
 =?utf-8?B?YnVmc25KMWFXNUdIbTdyTXF0RGxEMjdabnByMVByZjlwSkliVmkxaWswRG1B?=
 =?utf-8?B?ODZjUWp1WVBxR2dDY01XOWpBaktKWGFUZVJuR1lYam9NaEdreWFadlcyeEgx?=
 =?utf-8?B?NGNZSEptTlI2d0p5bUUrcEEvS2VvVmlVRnFSZ3FPOVlkdk9sTVdMNExQMFF1?=
 =?utf-8?B?dlR2QmRPZWx4S3VremM5cXdXeEJRWWJmQmY4akhDSTZ6aTVjdldnODg1WVYv?=
 =?utf-8?B?RXkvTTlCemhWQWxmeUFla1FNY0daVlJUUnJITWpjcjRWNjZsekFLeHhtaWZM?=
 =?utf-8?B?V2NZTDZwQVB6RWxxczRNSC9JSjc1c1VtR3JJbTZnMjVJa3ZBVUoxeC9qMUtI?=
 =?utf-8?B?M1ZtZ21aalVrRlFrSjBWTDQ0U2JVVGVKNmlCVW00ZThMNDBYaDJ0Mkc5cGEx?=
 =?utf-8?B?TTBEWm5jNHJOWGtDakZ4YkIwNkRIeU9zUElOa0pjUERpalhScUZrZXdQUStu?=
 =?utf-8?B?MldTNVduRTNIcUZqQ1VUUFFBRVVGMnpuemV3cFBDdTU3THY3bjBVenBPeHJ4?=
 =?utf-8?B?emZUeGhYdi9zQk1oTnUxZUQydml4N3VkRnlIdnpuTko2NjBoUFl0MVFZNmZH?=
 =?utf-8?B?VDh3S3hKK2tsRkpyNzR1UXk0VjFkaVlYWlpJQXViK0VsZEVIcHlvTE1VbVRS?=
 =?utf-8?B?V0dMR1hLbmllcFFEMTFRM2ZGa2ZYKzIzTisrNXBheGlreDlMTkxvc1V3bGRL?=
 =?utf-8?B?aFQ1eHVHWVgrcFFOb2J5ckMrMW90QXNSelpZOWJ1OVZrT3BNdmMwZFU2QlE2?=
 =?utf-8?B?Ym9NbTJaS3dVNnJYMU15QTlkQ3ByNStiM05VWDBhaFpBdjBIMWt4VjJHTWNY?=
 =?utf-8?B?RE5IZVBibkNLNmw3Z2ZkUjZNRldEdjB3S2p1OTU0MjZMdTRtVGtTQTdKcWhF?=
 =?utf-8?B?cjl6Wk9xOEFkeFh4YzVEM1A4MUVYN2FGZnpkV21aRnFGK1hZZjRLNElDMFZa?=
 =?utf-8?B?N0dTajJ2aC9RU244aEpXUTZXbFVVM2pNKzlzUzAvZzU1a2V3aGR1Zz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 641b2a42-43fe-4cc5-73e9-08dece15ff48
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7743.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 15:18:20.7457
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2hbgZ8v+2zVexZNFvjxmqI2ILYoTon9Lwe4Nc5oz+9SveFjruaMQQYTE7ZSG/3h5YKwuU9yXwsFiC8DCVeiRC95dlhAzeteLz629Irs4MuY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB12127
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 19 Jun 2026 15:18:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9797

Hi Robert,

On 6/11/26 5:34 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
> For modern Debian and Ubuntu releases, mention that the "bmap-tools"
> package is transitional to the newer "bmaptool" package.
> 
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> 
> ---
> 
>    sorry about the earlier typo in the subject line
> 
> diff --git a/documentation/dev-manual/bmaptool.rst b/documentation/dev-manual/bmaptool.rst
> index 87162a49c..1e5ad2bba 100644
> --- a/documentation/dev-manual/bmaptool.rst
> +++ b/documentation/dev-manual/bmaptool.rst
> @@ -24,6 +24,12 @@ system image files much faster.
> 
>            $ bitbake bmaptool-native -caddto_recipe_sysroot
> 
> +   -  Finally, in modern Ubuntu and Debian releases, the ``bmap-tools``
> +      package is a transitional package; it exists solely to ensure
> +      backward compatibility and smooth upgrades from older installations.
> +      You can safely remove it and install the active package, ``bmaptool``,
> +      which contains the actual utilities for flashing block images.
> +

Just list this in the first bullet point which is related to Ubuntu and 
Debian distributions?

I could see switching the default package to install from bmap-tools to 
bmaptool and add a note (Sphinx note) that on older releases, it was 
named bmap-tools so install that package instead.

Note that Fedora 43+ has bmap-tools, and Leap 16+ 
python3-bmap-tools/python3-bmaptools.

Cheers,
Quentin

