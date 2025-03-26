Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A0D3C3600B
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 15:12:00 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.86])
 by mx.groups.io with SMTP id smtpd.web10.25057.1743001913959177076
 for <docs@lists.yoctoproject.org>;
 Wed, 26 Mar 2025 08:11:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=b48/XBdz;
 spf=pass (domain: cherry.de, ip: 40.107.22.86, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MGw8/egN5/Z6o2nqfbI2flLHFlzJmthr7keEWwY7kaBNlj52g4Z8EKSAsLs45xX6ZKfm+XCDVGKCs4KeBCh/R/nC8Al3uZdxnob9lMdV8EmAL5Ua/oVINhuERFIf8OIHDxfg9lG3NG3auNR8SG2xFzBLv2l/0v9xmaYlXGWdX7ZZJ7In2HQgN+jGADlr/P+l/6GZNDGCSXTdg88YMAmskgMAJEmKe38uLHY9ajYdVrR/Ed5zq1Hvssqz3RcUW83a0R/6HbL4hsFObYDj1xUEasPrRsG4JstG+zqR0biSTUtCGgYvmsDi5+BrpbDGZgZ66vGV8Cf/NeV4NHnzLtdSOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r4/2W11v44XsP402eB3yMqxHGsI9Dz1VoX3NDwIstFw=;
 b=BHrOgso/0nJwl8HR4TT7fP2jCXrqLukSBZF0wUtEs3m9Dy36StlDVz9b9CiJwYhZGys3tEff0rMBGpEc+eQuQC8kmusy+7MJw7Od86LYjytV2etirom+dTHg+bZ7IwYstVeZnEJwOkZzHuVRd5tQkdkwlKHMLnsC7q69TMrC7CAGtKdyF650sDrsW2QxxSsP3q9v6zsG6buj0vM/KqxBkDL9/h/frIupGLryJSYJqgyxvw+9+Bh1lOGkTP1/Jr7vbuotgOP+305U2HBOQklvKDlSqeiIy5HA6hp71iegEPq0Frc3W4CWZShnuj1mYKSlrdTM9fd8JFpuvaUhp4lMFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r4/2W11v44XsP402eB3yMqxHGsI9Dz1VoX3NDwIstFw=;
 b=b48/XBdzQCoC7fLotPsVKR+9mWz0r816SghBhmW6ggmNEWx+RsiWoDRdJssbLaKJiv/Vb1TuqC6hw21/P8WzC9UgIrfQSRKkbcGEl55bukUXwb+A/5dNUmClhjXGf0hVZbvJOBkx7/DmujAW7AcOjZ2kZ80Zm7PReWlx1oXT8Ng=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
 by VI2PR04MB10738.eurprd04.prod.outlook.com (2603:10a6:800:277::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Wed, 26 Mar
 2025 15:11:49 +0000
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea]) by AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea%3]) with mapi id 15.20.8534.043; Wed, 26 Mar 2025
 15:11:48 +0000
Message-ID: <309afe89-8112-4189-8789-f07446a89eac@cherry.de>
Date: Wed, 26 Mar 2025 16:11:47 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 3/6] ref-manual/variables.rst: add missing
 documentation for BUILD_* variables
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250326-cc-vars-v2-0-36b80c64c4a9@bootlin.com>
 <20250326-cc-vars-v2-3-36b80c64c4a9@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250326-cc-vars-v2-3-36b80c64c4a9@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0425.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d1::12) To AM9PR04MB8906.eurprd04.prod.outlook.com
 (2603:10a6:20b:409::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8906:EE_|VI2PR04MB10738:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ad6556d-79a4-4fde-b36e-08dd6c7887c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UE1Pa013RHo5YjFjbS9wOHRMdGh4NHdqbi80dmFDM0dtUE5aWHBVMWE1T3dy?=
 =?utf-8?B?ODlBcm1lZ09TMitRRDFHaXpncHpXMEtTOWdQMS9BNnQxV1NuV1JtTWJvWTNH?=
 =?utf-8?B?NkVPQkFKRVd2Z1UyZzRETmhWMXhmanJxV2IvcGRFZVpBQnRXWWZBQnQvZms0?=
 =?utf-8?B?VzJtNHdXSEJFWm42a2hVWkJZcTFnRnNzeGpWSU0zVlJtWk9IYm9Va2hFQUJZ?=
 =?utf-8?B?MnFESnRTdkhjeE02WXhoVW96bWJjMzR5SHBtSStXanVrT1c1YVcyQUtwZit0?=
 =?utf-8?B?czlxUUdOc3JXR01BVkorMnpsYlJscnp5TmhCRnlia0NqZWlwaWVRZS9INkZ3?=
 =?utf-8?B?NWFzbXkvelZBNW53Q05nOENUZFJOckxlRVBDTDhYbjFzbnI4OXVOS3RQSUdQ?=
 =?utf-8?B?dVc0R0hEVytXNC81RkZ5dHRiUFRRMjVCK01yTThEaGZoMU1ZNFp6eEpiRmlE?=
 =?utf-8?B?Qzk1RW5SblhuVEJwL0IzUzZWa2pONmtRcjBUZjgyOElOVzlZTU1sOEk4MVFo?=
 =?utf-8?B?WU5ZSGdIcUhjV0RrdGJTQUJFZW1vSTlHT0JsUGcyR0hOUXZDZm5vdEROLzlt?=
 =?utf-8?B?UGQ2aXQrNi96Y3NnOHcrdzkwZGVUNi9DM1g3YW5iZlcrQmdXM3BMWFVOQmtC?=
 =?utf-8?B?WEgvTDd4MGYzbDNoOHhqYitPcmcwVjhHTlV6ZDF0V2NTdDJzYWl3Nm9PVjdO?=
 =?utf-8?B?eWd4L0J4b0RaQjduakh3MlNNSkpIZ0w3TzZhM1NmaFIrcGsrdHVXRVdoVXhr?=
 =?utf-8?B?amQwOFFhdEFYS3JhMWdBYVNYRGZTMWNhM1JmZDAxeUk2RGsxaWhYbUY2WWRN?=
 =?utf-8?B?dXJLVk4vNzVlNXY5OENJdWtxM005RHB3LzI1YnYybXBucFRLT0IxbUk1ZUJB?=
 =?utf-8?B?L1Ntam0vWFpRSDd2elBhSDZTb0kyRVdRQngrL2RTNkRoY01OeVB2UmJaSmhn?=
 =?utf-8?B?Z0wvL01mR0crNjJzSExkNnRZNkQ3NWt4aFZMSFpiOG5COU1uNHZLNnA4RkdS?=
 =?utf-8?B?dURobzlXSWpBRklQaDczdlErVzdtTHhMMjdQc09uMTRQS1pzMVdwS1ZsMTZs?=
 =?utf-8?B?QXJOaCtpRnNSTDZPZCtnaDRBQXN4VkFJa0tqNFN3aEhSOUdhUDhlbkJQbVI3?=
 =?utf-8?B?WWVtU2c1TGlibStQcU0xOFFZVTBjb1dGcktNSVRZRkFkMEhLRDZqZlQ0NUJT?=
 =?utf-8?B?S3Ayc0xyM0ZBYURUbzI3UjhySkhyOHc5VlV5eFB2QlgrNkRHODE2ZTE4YjhJ?=
 =?utf-8?B?RDhQSUJUTkJVU2NBa1NtOXU0YmYxZ2k4c2ptakpjdHhqcmhNOUF0M2NOell2?=
 =?utf-8?B?dkF4dHhuVDV6Rk5JdGhwbFdzMDVFWlVrZHk0Q0tsR05sNm12QmhhaHBvNysr?=
 =?utf-8?B?eEZvWWNybVM1UXBvM0JLZ1JuV2F6cmNmcXpabG8rYUlEWTNjWW5PNGd2a2sr?=
 =?utf-8?B?dzRBL1g4UlBpNVo3UlV0aHB4cW9oZHVxNENYTEtkYWYvd0dnMHZBTzZIdnUv?=
 =?utf-8?B?ZUR4V2dUSjYycWx5QTdqcHFBc3BkTDgwZHkrMlloOW1Na1JvazV1TlN0ajdl?=
 =?utf-8?B?YUI0WEE4aUh5dTl3ZUg3c05xYW10cXJEdVhnNmlnYlNJNklWL1VMYXpxMnRH?=
 =?utf-8?B?Mk1vY3V0NWdGdXZybzg1N3F6RFF5S1FnRFAySk1ZTk5Ud3l0SXdLYk1KaEhl?=
 =?utf-8?B?NUZCRlNSMEZZMU1ySTY1KzZ3N25wR3R0d2FqaWk2UENJcTZRSEVxU052WE5w?=
 =?utf-8?B?TGxZYzJFMmdBTUlQZTNhc3hIUWxZTE9GMlhvcnh0SHZRbEFMSzdCU1MyQ05X?=
 =?utf-8?B?MklTZnQrSTNSV3lScU1DeDJ0VTA2QUZqVDlUdUlsUWNKdkExWmJQaHFuVUdu?=
 =?utf-8?Q?LEu4VvKgSMNPE?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8906.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cFVKcXdJVklhdzBqWUh2MFlYdWR5RWFpL085cUpFWStYZ3N1akIyazBMbVJP?=
 =?utf-8?B?d1hLN0hLQVNXdWx0SlJ6UUYyUmp6K3l5QjR3TzRaUGhJV3pMaGk1UTBoNTBs?=
 =?utf-8?B?b0VuWGQxaGExUVpYUHFmbmZGK2gxSHBaQ1hhZnRmOTdOZUNpd2VqLzYvRDJD?=
 =?utf-8?B?UEVQeVlGdjNsNHZnKzNnWlBsREkwNlM0UE16ZC9jVXNWK3QyVklIRm1rQUJO?=
 =?utf-8?B?cUtWYlNSYlBUeFpzUmpmRTFYYkJNMlFhUnJQdlJ2eDAzK0tVSGh3UDM2dkRU?=
 =?utf-8?B?aXNFT1JIVzlBbE12QjZESkVScXBWVUFnWFpqL2NaRVZQT1BobVBkNnN5eUJh?=
 =?utf-8?B?azJ0QU0wZUZWTU85S2F6WUxtQnBQTmdOY2FGMEhjbURDd3MyeXVDb1MzQWUx?=
 =?utf-8?B?UWpXWExZcnluTVUxczdnbG9lMmtJTXlQaDA4b3Fyd2ErSWVMVEM0TmExVVJM?=
 =?utf-8?B?bjBKajIxOTZtTkV5RFozeEd1b3RCYUdWeGZHSndnV20yUi94cjl6VmhKMTh0?=
 =?utf-8?B?a1llSHVxRkx1RFV2TUdQaW84UmQ1MGZxeDI1QkU3aTBjNFBaTU1ISlA3Vmth?=
 =?utf-8?B?SmFjVXoydnZXZFpMbVdLb2ZtZHZCaVVTYmVrNVAwVlB3anN1U2tVWElMQUN0?=
 =?utf-8?B?OFlqT05ObzlrVnJuYzJYcTdyVzE3azRicno3M3FpbkovUDdvekdLbXZWRXJm?=
 =?utf-8?B?M3IvaTdFZVZzWXRKRi9tZHVOMGdLbVhpVkU5ZitSR1B2ZEw3VUtXS21QeTRZ?=
 =?utf-8?B?Ym5BOHJZaHVSNE40TXVLellNenhWT1RtNUhrWVNUcGcwaFVGVFBDTGtmanJ6?=
 =?utf-8?B?YllHSDF4ajMwZ3BDbVl3SzdCN1Y1SWd0clpqNGl3MmtIejcwbXhpYWpDaDBV?=
 =?utf-8?B?NXFKVWlCcFFncVFGNzJKNmZ1SG1UUGlPdTJNNFJ0aHR5MENvekoyYUFMK01m?=
 =?utf-8?B?ZTJIQmpsYnFvTXI4YXhSb2trZ1JzMm8ySmRCWk5FdmRseUl6OUJyK0Irajcv?=
 =?utf-8?B?bWNQMDJ3R3duVW5Zc3JMMW0xR3VQdHZDdGhScVdEUWlkS1BwcnRFcjZMOXQv?=
 =?utf-8?B?L1hNeW1SRnJJUUJNK0hlNWdmTU1EbVhMc3Z1QTdrSlJybFFZNVp1TWdMWEVR?=
 =?utf-8?B?cDlLZ2F2YlpOYlJxU0Y0UGp5eHJRbkI2WkZrekxTVXdJQmNveDR5RjYvS2Z1?=
 =?utf-8?B?amEwczhUT0tXcDZzODAzTUNqbWRYcitYZVcrT3I0ZzdmeGNBUlNYcER5QWs0?=
 =?utf-8?B?S0szektPU0RyQUhQQzQ2L3YzcWZabS9GMWNScnVFOWIyQUtOSVVvc0FPZ3lI?=
 =?utf-8?B?NkNZbFYyY0xwdHpkZjBhM2JYbTFpR09aRXNsd3MxdmRrbkVPN1d3QTNBL2VH?=
 =?utf-8?B?QUltU0R1RnN3NG13UlpnWnJhU2pmeWVNMlovV3JlM1ppckQ0aUdpbFI4S0NM?=
 =?utf-8?B?azB0NnROZ3FZNHRYVFFiUVhFOTNjeEJndDZxRy84UDJGL09Zb2hjMEJTMnJz?=
 =?utf-8?B?Rm9JUCt0WGkzOENKR2t4eWp5bnQzYndVUTF0dkRITGpyREdJaEM4SlBxZ1Zy?=
 =?utf-8?B?MFJ4ZXFJSnZDNkVra3ZvWjNNQy81dE8yRGtUNk5wMVhJTFlLWDFpR0JzVFEr?=
 =?utf-8?B?MTkvSVo2VDJPNi9LZUt4d0VWQ0dIa1kyckxKR3doWUxLYmpNdDdRRzdrakxM?=
 =?utf-8?B?ZUJlTEE4SC9CdHkrU0tGYkZqU1JiWFFDSG5qaFdvUTVGdnpPZTJyWGRUY2Nk?=
 =?utf-8?B?VFY2UkkvOTgxQlpzNnYwV1k0dzZPVEMzMXd5aTRuRlY3czM3TlgrMnBJWWhT?=
 =?utf-8?B?aEVuUWcvUUlpZTZHSmhLei9ZMDdVNEs5WjNaNmpZMnpCaUw3ZjZ4NVBCVC91?=
 =?utf-8?B?MS82dDNqeE5qN3huc280WkZrU050UnhxRFo1Q0twR1VwL051NE1RbFRDbkFB?=
 =?utf-8?B?dUMwYmQvZUJxaWs2MWs3ekxKUTFSTUZIMEJVYzE3SU0zTWlzRTk3Snl4eGtJ?=
 =?utf-8?B?aTVNTDVsc054bHJvTmdUT1dHc1MwUXhPaHYycjJKaTRlM3FZYXpBZnZKTGs5?=
 =?utf-8?B?OEZsWEFDSDc0eDNrYzh5d05uVERLYkRuVUtrazZMRUxmRHQxRlBNOGh3dGN0?=
 =?utf-8?B?SUtERXk4YjFPMVpyR0tNL2RQVjdkOTU4YUpWUUNFcmxHUXNUamdWWXk5TmRq?=
 =?utf-8?B?c0E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ad6556d-79a4-4fde-b36e-08dd6c7887c1
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8906.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 15:11:48.7258
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v+8MJucHbpga9b4oWZvkqvD3wSFGNVncl2owqCdYBkAvXTxiN/6IfJnkE4f6VuAnZf7dRBRYPuwxKodIAuDEI5HmQufyQs65PZ3jqqd3oqU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10738
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 26 Mar 2025 15:12:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6643

Hi Antonin,

On 3/26/25 2:21 PM, Antonin Godard via lists.yoctoproject.org wrote:
> These toolchain variables are used in a native context. Some of the
> BUILD_* variables missed documentation. Also, some of the base commands
> were also not there so document them.
> 
> Some of existing BUILD_* variable documentation were missing the note
> about their usage in a native context, so add it too so that all BUILD_*
> variables are documented the same way.
> 
> [YOCTO #15719]
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/ref-manual/variables.rst | 222 ++++++++++++++++++++++++++++++---
>   1 file changed, 202 insertions(+), 20 deletions(-)
> 
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index ccb4e0de2..9ee63622f 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -985,55 +985,149 @@ system and gives an overview of their function and contents.
>         variable is a useful pointer in case a bug in the software being
>         built needs to be manually reported.
>   
> +   :term:`BUILD_AR`
> +      Specifies the architecture-specific :manpage:`archiver <ar>` for the build
> +      host, and its default definition is derived in part from
> +      :term:`BUILD_PREFIX`::
> +
> +         BUILD_AR = "${BUILD_PREFIX}ar"
> +
> +      When building a :ref:`ref-classes-native` recipe, :term:`AR` is set to the
> +      value of this variable by default.
> +
> +      The :term:`BUILD_AR` variable should not be set manually, and should not
> +      be used in recipes directly since :term:`AR` will hold the correct value
> +      depending on the context.
> +

I think we came to the conclusion this is wrong, the user may have to 
use BUILD_AR in some cases?

Maybe something like:

"""and is seldom used in recipes as :term:`AR` contains the appropriate 
value depending on the context (native or target recipes). Exception be 
made for target recipes that need to use the :manpage:`archiver <ar(1)>` 
from the build host at some point during the build.
"""

What do you think?

Cheers,
Quentin

