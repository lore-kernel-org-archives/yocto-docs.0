Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FE12C02182
	for <webhook@archiver.kernel.org>; Thu, 23 Jan 2025 16:40:32 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.61])
 by mx.groups.io with SMTP id smtpd.web10.15024.1737650423144352001
 for <docs@lists.yoctoproject.org>;
 Thu, 23 Jan 2025 08:40:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=c33mA0H8;
 spf=pass (domain: cherry.de, ip: 40.107.20.61, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ucB3wMq5GCBgEcF5p/IEi5+94W7C4SSWFT7jS6MEAnYtkEoqb2UB5fnZ9zLnc7iDWtL90U0qhXjP1JXpMyFuK9uRDN3oh+gbwTnvGV3bXWbiF0tpJvADMl2xCgCixIrYsGl3EH6EyBOwnk99N/Lf+mYQbGYkv5E4KvSGSce6kAPYli/exDUNbgTLKmODmfLWdV8+74pjBucqWPUVjazCO0RfCOE9XW23ndcwN9An2uWWMCFPaCdHtk1i9aIEB2/WbrtLO0gUHjq2UBCyBJcaAcW2zUyroleiM2BONmO/7AhVZRG0YnQTcEBVK2yBmL4+sGNcyRu/LFKYnX56j61j+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j1OdIz3FJTdEuQjFeyUrP3zztV5lJ2Flyc3n07sY5FY=;
 b=cFr9fiIM0mzQhREHfiWPxZS79TwHEGgZAK+GBRh57SFjWoaWyBzCpLrARrUK8oiauTsvfuQxYGwo2d7x/njoEdEu+lTf767GJHPlEGjEdMTq35WnLURxsG5PUW9+mQu7ieY5sZ56W5Tra0TH0/ujJzQD170jq0ilMo6B/2DK5wQq5CAaLcuCpONJvuBR/los/DM0QF0/73tZ5HZDKTA7BoZoSySULFbjZqXgY7MZxpoz0R075JtpA/ltrgtn8Lana+7ab0ZNAvuE4HSzSs0Ff980R4OTAo2cRp5ZRUnr5SKSv/gCyj+zSX8vByK502xhriLREsKYmTbVUdBAMYABUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j1OdIz3FJTdEuQjFeyUrP3zztV5lJ2Flyc3n07sY5FY=;
 b=c33mA0H8bK1AA+Ga8IYuTSY1jm8+ZACrkDmAM+PDRB9Fh60PIWqgF+2sSUyTSeOs4fgxEcN/4h54nNyRJmhGxf8qG1h/HM1sZcm7WLz+Ezogb1iGMFdAsEfD4bjBx21sWLr2zTsb9jFUDiubRfedYYOyVp6CukLUrx54VtsEY20=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
 by AM0PR04MB6786.eurprd04.prod.outlook.com (2603:10a6:208:184::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.17; Thu, 23 Jan
 2025 16:40:19 +0000
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea]) by AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea%5]) with mapi id 15.20.8356.020; Thu, 23 Jan 2025
 16:40:19 +0000
Message-ID: <751d5a0c-6efd-4d1d-b936-696409e20c57@cherry.de>
Date: Thu, 23 Jan 2025 17:40:18 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [yocto-docs][PATCH v2] dev-manual/building: document the
 initramfs-framework recipe
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Alejandro <alejandro@enedino.org>
References: <20250117-initramfs-framework-v2-1-91d5c23ae5d4@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250117-initramfs-framework-v2-1-91d5c23ae5d4@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR3P281CA0011.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::17) To AM9PR04MB8906.eurprd04.prod.outlook.com
 (2603:10a6:20b:409::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8906:EE_|AM0PR04MB6786:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a065fad-74bc-45d1-cbaa-08dd3bcc9f49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Y1F4dHhTY1JCMlg2SWRoWDBLNWdXSU0wenRWK0ovTTJJVVFETDdSamZ5OWFa?=
 =?utf-8?B?Ty8wNG1wQ1BsMFVkS2x3Ulc0MEZaT0VXMlpwTm9MYVFja2I5Ti83TDVUNStX?=
 =?utf-8?B?NlMwbFpCQU51SkRUQ3MxeU8wZnZ5Z1Y2UHpNQmdUTGpGRmNTTFFrdVgvQlgv?=
 =?utf-8?B?dmpKZ1E1UHFlcWRXWUpTWVNMNll4TDgyWlI2WVBFdUJaZmZkaWFNbkpTOUQy?=
 =?utf-8?B?aVZ0NHhTbDhlbVY3UUF5M2FMMVpaZnI3L2VMNkpPM285bnVwenY3eEx0ZExi?=
 =?utf-8?B?RHBMOXJtT3RYOVlIZUI3QnFSQnh1dnp3WGpRdCtvWENGcFBDVVJVc1BRaGlU?=
 =?utf-8?B?NVNNVSs0cWVvdUV4OWltTjVFNVBiY2Q3K0JDSWRZR1NjVTB1Y1NHYUFYUEd4?=
 =?utf-8?B?MEd6aGlRQU1YL253NDRxb0tHMEJ0Zm5DcXdqeEMvM0R4Um9ENFJzaTUyMi92?=
 =?utf-8?B?ZlV4QS8vNkhEWWR3VDJoUzJpWnhhU0I3T2FjcjNYNlROQ1JTY0J2WDZleHlw?=
 =?utf-8?B?Zk43UWE4L2VBM29vSzlnWXZRMFpPZmtsNEhXWFRIWmR6MFlDL29OOStSejZY?=
 =?utf-8?B?Z3pLWXJMcldJTGZRVDNZMXpGZzdyZVlzYllzMTFhMU9lM3FkWEpkYTFvTzVu?=
 =?utf-8?B?UVZaREZlSzB3em95REk2NXZoN2dSemRRRjh1UzRXK1l0UVI5OTRyNFpDQURK?=
 =?utf-8?B?MjlRalU5azZxdnkxSVIrc01OOXNyTVU2eFZCT0NtOXlrZ1BnSXJKTnFrOVg5?=
 =?utf-8?B?RmlmbURQVDBBTG1DR1Fjcy9XUGl2S0xmaXpGSncrdHhIYkkzOXBMamVubWp6?=
 =?utf-8?B?MEQwRVRBWGNVUTV4TUFmVkZGUGg4RUtjZ2NYMUgwRTQ1aEN2d2x4cXNsMU5o?=
 =?utf-8?B?VGNISHB1WUg2VVhva1lIYUprcmlBc0x4cm9QZHkwL2xaY3BlYXJuMHA3SXBk?=
 =?utf-8?B?VWMweDRjUUVodGRDOUx0aE9XRTBLZ3kxM3JZVHhlazM3akpva2JrTTdodVdz?=
 =?utf-8?B?SGtkU054WTJHZVIvYW5NaWdsczgra2tueThhMDhram83QngxS2ZHZXpvL0hu?=
 =?utf-8?B?V2pWemI4KzN3dy9zcmFQZElENDA4ZXZzak9VUmVuUEVPMml6NjBGY0p3Nllq?=
 =?utf-8?B?Z3lOZ2xSeUJjRGRKcVZhWVcrbDJEQVVKVUMzZFJ0aTU2YnJVYjFacEpZZG5p?=
 =?utf-8?B?NzZHMDJtNzYrdlZYQS96dFZHcm1sNmY2cWU5UWFNTUZzbFVjcUF4TEpNNU85?=
 =?utf-8?B?TGU1Ukc5TE9McUlDTkdwS2tqWURjVWlxd3hrQ0t3Ykc3VnJIRkVBY2FETW5z?=
 =?utf-8?B?VHVxekxRYVRUNWFFVDYrQml6Lzdmbnlua09Obmk1WlhqOW01T1RwMHFEUGM5?=
 =?utf-8?B?NTd0dHVGczJhVnRCZys3QVdGbXlOL3FvK3BtZEFOVXRkbkVDZW53ZzB2UHdw?=
 =?utf-8?B?czY4Mm8va1dEZ1ZkQ2E0ZHdSKzNnY2ZFZzUwZjRXS2NGMTdBQ2lMVlRvMXE3?=
 =?utf-8?B?cXFKUWtKN0Q4V0tMWVRoQitsSWR3L0ViYnQ4QnZjM0RCSlFlWVgvMGdidUZm?=
 =?utf-8?B?QkJvQUtrbVB1UVJTT3NrZHptSjZ4Z3o0Y3hMaEM2VjRWMVc1TjlpMituVUJO?=
 =?utf-8?B?Vll0YnZoOXJXcEczeG9hU1o2UkZwelpGeTZqRHNlNE5tZHNhd2tnSDIvb0xq?=
 =?utf-8?B?NjE1YTJmSXRIYXRxL1RNdENabUgyY0VISGNXTDJIYTMwTjAyaFBBeEVlOGRI?=
 =?utf-8?B?UFNpVEtFSkREMkRwd0dTQmlnOUhCbTludzZXV3JjbDhXWlk5TUR4YmVXWlNR?=
 =?utf-8?B?TnZleENpQnJ5WWdObVdHZz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8906.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?elBBUDNpL3VDM3puaFhKOWdiU2w5R21ocE0rdEpKRjExM1N0NmM0RDhQaytI?=
 =?utf-8?B?L2VmQjdFZXVuZUpaS0hPMUE2cllHckY2Y0lGdVJORTBVdmpLRlA4VWtPeHhP?=
 =?utf-8?B?ajMxdTE2TW15RlVhZXFrcU9kb0pMVHpyWXJtaVJ3c0dNZENhYk9oTHRmZUFw?=
 =?utf-8?B?ckJnMnh5cDk2TGE4RG9hK3dybXdnNnFHckR2enNweER6NlpDK0dmYyt4b1JD?=
 =?utf-8?B?eHg2Ni9qTU1vTmVmd2lGbk9DVVNVRGZSdjNSdUdlZXh5b3ljWHNkbjU3aTd6?=
 =?utf-8?B?eStPdDNDSW5MS00wL0tCVUc2eEhXYlNhT0I0WXA0Q2h1VUpkRTc2STA1STYw?=
 =?utf-8?B?eXJOM0lETWlnUGZmbjBiMk5CM3l2eGx5OUdhcWpRSi8ydGJsN1E0SFJRWWJC?=
 =?utf-8?B?bjBYcEltOXYyeVFxaXNXMjlBUEZscHdFeEVwVnNxeGtwaGJJR1ZkVGdCbzVj?=
 =?utf-8?B?STlGZzZzZm9iQVBtbE04VUxqUHRKOEdaelJYdXlOSGh0Y3RFbEpzRGJMRUty?=
 =?utf-8?B?RTdwMy82R3g1ODNvTmpud3NzdkdRUzNmaWxTM1dzcTNvY3ZxMUFnVk9kY1Y4?=
 =?utf-8?B?b3lXT3lLSWt4NXFwWWFvU1RveTV4NDlYQXRnR3VoYnROay96UkJGNWhHQ1d6?=
 =?utf-8?B?RXN3NmdYd0VVYXdyeHhQcGpwMGdrNlg4Y1o2VjlXNFFSZE42YUpqdC8wSTZC?=
 =?utf-8?B?Mm9paHljL3dIWVF4ZjludzRkdmV5Z1FPaFJLT3haRlNOQU1TVVgrZmY2Q1BI?=
 =?utf-8?B?ak5TY3RNWUxydzNxbXZzQTlIcTVoSTIzSHY3eVhjNGlTVTV3Y2IvV3ZRSDFh?=
 =?utf-8?B?bG5nekZrTXJpYmNiZjVBSFd1eXk3a1dnd0dBcGZFSm1pOWVyalpGUkhhcXZv?=
 =?utf-8?B?dGtEY0pJNVVlWTJRSmg0cSs0Sko1enVMS0RrSmc4QlFuazZZQk9MTXVFaUhG?=
 =?utf-8?B?SW1YUXBYckZ3RUh6NFYyQjd0UFg1MHhBSlNQakJNOEJyVS85V0NjckVyZmlS?=
 =?utf-8?B?UFp4Nm5CcDM1eTU1OGYrQWZ0VEdwYVlGYXNiZXZRRVNFYklzbTVNb1hjdlY3?=
 =?utf-8?B?TUp6ZW14cTl2azdrMmpTd3hQWmp6TDhqVUxydTFzSVd6cXRqcW9DR3gxZWVP?=
 =?utf-8?B?RU1vT0xzZXlDMkhyUllCdUVqMzNnMit4UE1KSkJUQ1VBYWhmcEc3Y21FSCtj?=
 =?utf-8?B?ZHFmdmtvN1RScHFJdU0wQ3ZXc0V2anhiTy9YVks0ZDB3RkdMdWZ1TU9Lano2?=
 =?utf-8?B?SFJYTXRkTDZabVk0VW1OZ3hOZS9DeFl5UEdNSkI4ZGhoN282YTdva2tKdzFm?=
 =?utf-8?B?QU5rbzYxVTRsL0ovNzk4aGlvcXZtK3RHenF5bHZuMkFZUzVmR3NXWHYyR24z?=
 =?utf-8?B?VDcyRUN3WS9GTFgyMlloTzU2S0JBN3Z6WmJUVVVkeUZMdHN6SllRU0ozby9D?=
 =?utf-8?B?N2lkVzJHTEhqVkk0akQxenJtTWZuRUtpcFFDYUFhL2JqUkYwbFhpOVpPcmZF?=
 =?utf-8?B?RTlaZmJlbVF5WU52RHo3NkZqZXk0OEJBSENpRFRCVFRkRzZMbG1yb01KSmlO?=
 =?utf-8?B?b0l4MGxkYzBNb2x2WGE4K0kvMi83MGRXSmlMODBSdTd6SmtneElRbnJIR2pT?=
 =?utf-8?B?ZkY1RS9PRDdIdjlTQWZsWkIzampqMnExNlcrdXdvOU9OWG5zVWtPSzh5THRj?=
 =?utf-8?B?VGdMdTJrb3Q2NDByYjVpMjlhMUFFeTYwZHRBUkRVNW1Za2E1cUhtcmhTclAy?=
 =?utf-8?B?QVpxL1NHOGhFKzNMRTd2dHVNcjMxT29wUlh0TVdpTTNac0RrZkoyYjE4WjlT?=
 =?utf-8?B?RFdFQjl3dzJGdThZUzRPdWI5RmhaRGk5d1dVcDVIa294U1VxbFVNOGlRQXJG?=
 =?utf-8?B?Vzh3SjVvS2Izb1F0aWpvZGIxY1JxVDBaK1dSUzN3Uld3VzRyaTFhWkUvMW9w?=
 =?utf-8?B?Y1lwWDc5eU5pT3l5S1BtTGZCa2VFNkxrVHlsaVBjNEd5ajh3dEc2bGY5eU9E?=
 =?utf-8?B?OWcrWlFsLzh3K2tsaHFudndybGprNHZ0VGZxaVRLdkYraXgrYzBDT20rUmJL?=
 =?utf-8?B?cGxKaE1aQzdNelRGMjFQMXVxaUZRem9VT3hwaGRiSlVJeG5sRERTSFhZQ21p?=
 =?utf-8?B?eHZ5VnZqUFR0eTZrbHg5Vm1xU2p2WmY1SHFTbGlNcHFzUjZzRndpMWpzODhP?=
 =?utf-8?B?QlE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a065fad-74bc-45d1-cbaa-08dd3bcc9f49
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8906.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2025 16:40:19.6025
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b8n/fWa7Oc0KEeSgjf1OZDZ7VpswfDVKH8jLkIfT2MWrCcAvXmCP8j9s1IM8MrB90X9sUrKvSUm4TTlM8l9+70ROOEVPp3VfsH/oel98Nug=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6786
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 23 Jan 2025 16:40:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6166

Hi Antonin,

On 1/17/25 12:58 PM, Antonin Godard via lists.yoctoproject.org wrote:
> [ YOCTO #14747 ]
> 
> Adding a initramfs is a common task, and the way oe-core offers to do so
> is by using the initramfs-framework recipe and companion modules. There
> was already documentation on adding an initramfs but the documentation
> was lacking details on this framework. Add it before the multiconfig
> section because it is a bit more important IMO.
> 
> Reported-by: Alejandro <alejandro@enedino.org>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
> Changes in v2:
> - Various rephrasings and typos from Quentin Schulz (thank you!)
> - Link to v1: https://lore.kernel.org/r/20250103-initramfs-framework-v1-1-bfc2cf950842@bootlin.com
> ---
>   documentation/dev-manual/building.rst | 83 ++++++++++++++++++++++++++++++++++-
>   1 file changed, 82 insertions(+), 1 deletion(-)
> 
> diff --git a/documentation/dev-manual/building.rst b/documentation/dev-manual/building.rst
> index fe502690ddc45694a9b0ae2d5e98894fe5153d74..853642d513a62afd9ef3fb7bf1b49b8455d27c77 100644
> --- a/documentation/dev-manual/building.rst
> +++ b/documentation/dev-manual/building.rst
> @@ -280,7 +280,9 @@ Follow these steps to create an :term:`Initramfs` image:
>   #. *Create the Initramfs Image Recipe:* You can reference the
>      ``core-image-minimal-initramfs.bb`` recipe found in the
>      ``meta/recipes-core`` directory of the :term:`Source Directory`
> -   as an example from which to work.
> +   as an example from which to work. The ``core-image-minimal-initramfs`` recipe
> +   is based on the :ref:`initramfs-framework <dev-manual/building:Customizing an
> +   Initramfs using \`\`initramfs-framework\`\`>` recipe described below.
>   
>   #. *Decide if You Need to Bundle the Initramfs Image Into the Kernel
>      Image:* If you want the :term:`Initramfs` image that is built to be bundled
> @@ -308,6 +310,85 @@ Follow these steps to create an :term:`Initramfs` image:
>      and bundled with the kernel image if you used the
>      :term:`INITRAMFS_IMAGE_BUNDLE` variable described earlier.
>   
> +Customizing an Initramfs using ``initramfs-framework``
> +------------------------------------------------------
> +
> +The ``core-image-minimal-initramfs.bb`` recipe found in
> +:oe_git:`meta/recipes-core/images
> +</openembedded-core/tree/meta/recipes-core/images>` uses the
> +:oe_git:`initramfs-framework_1.0.bb
> +</openembedded-core/tree/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb>`
> +recipe as its base component. The goal of the ``initramfs-framework`` recipe is
> +to provide the building blocks to build a customized :term:`Initramfs`.
> +
> +The ``initramfs-framework`` recipe relies on shell initialization scripts
> +defined in :oe_git:`meta/recipes-core/initrdscripts/initramfs-framework
> +</openembedded-core/tree/meta/recipes-core/initrdscripts/initramfs-framework>`. Since some of
> +these scripts do not apply for all use cases, the ``initramfs-framework`` recipe
> +defines different packages:
> +
> +-  ``initramfs-framework-base``: this package installs the basic components of
> +   an :term:`Initramfs`, such as the ``init`` script or the ``/dev/console``
> +   character special file. As this package is a runtime dependency of all
> +   modules listed below, it is automatically pulled in when one of the modules
> +   is installed in the image.
> +-  ``initramfs-module-exec``: support for execution of applications.
> +-  ``initramfs-module-mdev``: support for `mdev
> +   <https://wiki.gentoo.org/wiki/Mdev>`__.
> +-  ``initramfs-module-udev``: support for :wikipedia:`Udev <Udev>`.
> +-  ``initramfs-module-e2fs``: support for :wikipedia:`ext4/ext3/ext2
> +   <Extended_file_system>` filesystems.
> +-  ``initramfs-module-nfsrootfs``: support for locating and mounting the root
> +   partition via :wikipedia:`NFS <Network_File_System>`.
> +-  ``initramfs-module-rootfs``: support for locating and mounting the root
> +   partition.
> +-  ``initramfs-module-debug``: dynamic debug support.
> +-  ``initramfs-module-lvm``: :wikipedia:`LVM <Logical_volume_management>` rootfs support.
> +-  ``initramfs-module-overlayroot``: support for mounting a read-write overlay
> +   on top of a read-only root filesystem.
> +
> +In addition to the packages defined by the ``initramfs-framework`` recipe
> +itself, the following packages are defined by the recipes present in
> +:oe_git:`meta/recipes-core/initrdscripts </openembedded-core/tree/meta/recipes-core/initrdscripts>`:
> +
> +-  ``initramfs-module-install``: module to create and install a partition layout
> +   on a selected block device.
> +-  ``initramfs-module-install-efi``: module to create and install an EFI
> +   partition layout on a selected block device.
> +-  ``initramfs-module-setup-live``: module to start a shell in the
> +   :term:`Initramfs` if ``root=/dev/ram0`` in passed in the `Kernel command-line
> +   <https://www.kernel.org/doc/html/latest/admin-guide/kernel-parameters.html>`__
> +   or the ``root=`` parameter was not passed.
> +
> +To customize the :term:`Initramfs`, you can add or remove packages listed
> +earlier from the :term:`PACKAGE_INSTALL` variable with a :ref:`bbappend
> +<dev-manual/layers:Appending Other Layers Metadata With Your Layer>` on the
> +``core-image-minimal-initramfs`` recipe, or create a custom recipe for the
> +:term:`Initramfs` taking ``core-image-minimal-initramfs`` as example.
> +
> +Custom scripts can be added to the :term:`Initramfs` by writing your own
> +recipes. The recipes are conventionally named ``initramfs-module-<module name>``
> +where ``<module name>`` is the name of the module. The recipe should set its
> +variable :term:`RDEPENDS` to ``initramfs-framework-base`` and the other packages

RDEPENDS is not a recipe variable but a package variable.

I would suggest rephrasing to

The recipe should set its :term:`RDEPENDS` package-specific variables to

What do you think?

Otherwise, looks good to me!

Cheers,
Quentin

