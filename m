Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C77CD3398D
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 14:26:21 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.45])
 by mx.groups.io with SMTP id smtpd.web10.53153.1730125576582574816
 for <docs@lists.yoctoproject.org>;
 Mon, 28 Oct 2024 07:26:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=AoFxiyBQ;
 spf=pass (domain: cherry.de, ip: 40.107.103.45, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c+X3J6/d4G1cqs/l5HGmWt2zSHsbC0eypetkcVAQO+q326BtKMaTcVd3rzlQ4bvW9IqwoFi0uIQyzAztD/qozIEUJOaoqy4zjTK2RpSeMolsEnYXhVeZWUtkVH0PGfC75quRRy3M4IueJaKgCfV+7VhFjzCsAgKP6EDlxCzAek8KRi/OyEjztLjeLlEfzddxZ0sNJ4iUc0xmM6ZOZ7P/UDPWVHEpUt/eRNGPZXZofufKsoq8LliNTz3bFSD8weFCN8ZDASyCWqbeqjQaedVgDnxAwy/KSEW5zNH0YDcDByeMWXajG0ubQ2B3NZwp/G2YnoLU6qqWz/5mAV3DyETYIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qS6V7U0SqFJGJ0ZFSNXsy7vR4nwGFsh7KyNDwNU1Hy8=;
 b=NBaMlFkXft4fot7N0oeb/V+2S2oLImG/Q6tkq+KrcLD61yCCf1h/yoC05K4LcCesOsXMhasmDV0ds1rW0ZJFv2oke7zsDzKGLvGdw/tcNesmJKGePyw718Jd7Hy6p4A8ds3Y9NWmJk1hP9cMAjM9BqLU30BAdSKdXWvWe+PoVUgLW7TyLg7vyYcs7JfUmuhgh+FyOgr86Y3suw7DVg/w34g1wmmodKxql7Q+aU3IMWtrDHCk/eTsGjArBg+3LPJjIksUWMNFlnuXRSPx0FQ2HYiuAUgbTNgG4gxQW5/nceMwz+pxtxfQ40LgsyvSGapcyOffqiXx3/n8QzezTSPV0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qS6V7U0SqFJGJ0ZFSNXsy7vR4nwGFsh7KyNDwNU1Hy8=;
 b=AoFxiyBQBwEprwssoYZ2X8DzCwSuEEbO7NndeoNcugZL8dETzkQCx8rH+p+dWjfgF+UVmPi12nsQ9sfRtj+zridNDgEa1LnE/WSNucmjJONc5WiCW8nGkWiQ/NL9sfKp1hc1lpewOaYcelELcpir+1+0mfyUWNLXkvqK+Pdemn0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by VI0PR04MB10096.eurprd04.prod.outlook.com (2603:10a6:800:24c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20; Mon, 28 Oct
 2024 14:26:11 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%7]) with mapi id 15.20.8093.025; Mon, 28 Oct 2024
 14:26:11 +0000
Message-ID: <962bd727-b63b-4175-bf71-90e5b40a53cf@cherry.de>
Date: Mon, 28 Oct 2024 15:26:10 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] ref-manual: devtool-reference: document missing
 commands
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241022-devtool-improvements-v2-0-9d2ebf9c5311@bootlin.com>
 <20241022-devtool-improvements-v2-2-9d2ebf9c5311@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241022-devtool-improvements-v2-2-9d2ebf9c5311@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0423.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d1::13) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|VI0PR04MB10096:EE_
X-MS-Office365-Filtering-Correlation-Id: 81bf36f7-d71e-4136-d21d-08dcf75c78a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VVdrbXUzU0tmUzIwWEJTTFV4UDAxcktya1ZIczhCYmE4Vkk0ZkZlVkc3bnhT?=
 =?utf-8?B?TnBDdWVma2RqMUFZOENCWnRSakM4TE00NGhkcG8vY1BXa1gyZjlEd1IwaGtX?=
 =?utf-8?B?VVRxTVpDeFNhMEZjamFFZlFkcHJPUHkwdEx3Nzh1NkxYMjJ2NnFidWZyQkNr?=
 =?utf-8?B?SkdvdFo0cSthNzRKMENIYmc5R2hSa25JaFBQdkprTUZ1ODhocUU5UnlsMmlL?=
 =?utf-8?B?Rk9lWlBaVDd0VUg5bmlzWjI5OUF3SzhPQ3B1RzA1WDZFd0UyaGJ5cGdyY1Fm?=
 =?utf-8?B?UmtkRHBHVjVTelo0eG44Mk5pSzQrVm1MRG4xOU5uSis4bDhWemU2TUM4UGk4?=
 =?utf-8?B?bmhWWnZ2cnJWY3RqbFU1eS9mSnhIcGlHWUloVkJOQkUwREpFeWcwNktwSWg5?=
 =?utf-8?B?bmV6NHVmb08zYXk4MHFiNUVJRGpZSFRrYXRsTjMybkFWK21YaDY0UTVWa2Zw?=
 =?utf-8?B?amFhUElORnhzL2FhZHVYZjhEUmkxc3Zsb1lvRDhBVVE0S3UwbjBHWXROWGVo?=
 =?utf-8?B?TnVhWlM1ckUwVzBhWEdpNllVS2hObWQ1K3ZsZVlNZ0NybzdJWlM5OVFscFZS?=
 =?utf-8?B?NFpYQkNpT1FPK2FrdlpqdUdLUjJSK0hQckxoSUtFcTF0dC9zRXVDSDBndjNH?=
 =?utf-8?B?R3F2R0ZNZER5a2dBWUdYYjl5MTQyRzQwbFlmZFFZQzgxUnJ3N2NhRklkRjZn?=
 =?utf-8?B?eHlHbEJSZzBNRktEYVZieUdjT1hLN1I5MENMNFJSUVl3a2k1OFRjYi9YbHh2?=
 =?utf-8?B?eThTRDd3cXE4RHJ5RE1YTEo1S1BGK3JTZGFCOExJQlhYZHBWOVNuR2M5UStP?=
 =?utf-8?B?dm1zYVFKdTJuWVB0YmRSL2hGc2o5SHpiWWUyWll0L1RkSWl6R0tRRWQrRTlt?=
 =?utf-8?B?aVZ4VlV3cThZeFNzVlhwY0gvZk1jMzh0UWlyMVZ5UW1uL0VLTjljRGdvU0Zr?=
 =?utf-8?B?UzNqVUpsTVZEeWxzbU9qTWFHVHh1anFwS0l3d251MDByOHhKQ2tLcEt1V1Zi?=
 =?utf-8?B?K1FTZE5MVUFhQVNyMkJ4VXZRYjVDYmRRdTdUMlZQbjh2OXpDeklJY0JQVVdH?=
 =?utf-8?B?NUpwOUdXbHdLbHhnUU4yZVExeTFUYzlPN2ZNL1NNWlV0Q29VTFNPRFBXeFRo?=
 =?utf-8?B?dzMvZWsyUWpxRFp1UXhQbUZicVo0SDc1dUQzRUJHeWxhZWdBTXV6Um5KZFdx?=
 =?utf-8?B?a3EweThQVW4xbWF2a1VHazRxV2hjblRXRnZ4TTFzZUN6RCtTeCt3dTRYSzRD?=
 =?utf-8?B?d3VIam9PUUFnZmNPUU1nWjV4MVp1NzhCK01jaUx1aFhSYnpCbVV0aDBYY3Zi?=
 =?utf-8?B?dXRYUDU4eHR5NGE0YUJ4Vk4wN2ZyQnczN0FONEdCWCtVamNzT1hlOU4yQS9p?=
 =?utf-8?B?bW0wRDJWZ3YySGNFWHZIKzZWTk1tYVljUWZDMmx0NTNtYnNUYldwRDJTYzlN?=
 =?utf-8?B?czZpUjFJa093aUk0STN6M3lIVElsUEdKU3B4SVJqNHFwN2dIaWtEeTMwSFVS?=
 =?utf-8?B?OEwxRTYrMXN0VmFNeUtHbURVZEx5TGhEdkxQSUdVUlBMOElKT3JlcEx0cllp?=
 =?utf-8?B?ZUlpOGt1b01LREJaSmo4dzJjY000bXBnSEpSMFlvWUk0MHQvd3l4OEtkdlBq?=
 =?utf-8?B?eHRGTlJwb2FBd3l5S2NaTysvaEFWNGZUVUlxWUM4MTZWRmwyY1UrL2xEVWk1?=
 =?utf-8?B?M3VkY0ZoZHB5L0tmVnc2a0hqWWhadm0wODZZTWdpWkJBeUpUOERwaE9Jd09h?=
 =?utf-8?Q?46+4pT93Tz9QtlPhLDVpp8/0ifrVU4HJKUIu3Eh?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Sy9hOHZQNlNmb3pDYUl5VlAxbW9oYklFeGVjdFJFczRjNUM4S1Nua2JiYXlv?=
 =?utf-8?B?b3ljQVN1VDcyMTJoaERzMEVhNUlncENoRTF0K0ZTQUxtZjdtV3IxWGRIL3hw?=
 =?utf-8?B?TWxKU0p5cHZRN2dkYyt6NjYvVE5Gd0t4ZVhTNk9iZU1LRGNaeVQyUVpxTDJN?=
 =?utf-8?B?RXpmenA0RGUyMlhDeGIyc1I2bm9rQmk1S0xrMUZ1bndjYWQxVWwwVG85Y3VS?=
 =?utf-8?B?Qk1sdExjWm50UzdsMHJUYkVpZGhhWmF6c0xUWFdIVzg2U0RrWjlTaklXUzVV?=
 =?utf-8?B?dXNXTmhiSXlmcTZDd0VtdTc3bzVNRGt1YThmakp2NG1sRk05NGxrWUMzVXVz?=
 =?utf-8?B?eEMxMVBFS3NFdERxSEZaV1ZRaUMvRm9SUzBGWHBOei9EbWJ0NWVLb0hXbTF3?=
 =?utf-8?B?YUtqU2dVTkl1aUo1YnFPNjJCRW44NEdENndNT2pycXd4L2Z1ZE5KNndxQ1Zu?=
 =?utf-8?B?TnFlRjRnOTNITm9XQnYyVy9kSnRGUUZOalNsN2swTkl6eDBMS0l4aFhpSUR0?=
 =?utf-8?B?Q1ZRbWNzZkplQzNQQmV4aE01cGgwcktnUjNMcEZGT1JaQmE5MnZPRWVaME5k?=
 =?utf-8?B?TnpRQ0RyTFBDY1JDbS9VL0plZ1B4eWZsMHg1d0xPbXk0YjY2SGJXakU5VG5F?=
 =?utf-8?B?SWdKNko4dWRqVlZ3dmpSK0N6OUJpOHRIM3o0dUNyYTQzZHpyNldyeFNXc0sx?=
 =?utf-8?B?YnJTdU1teitYVXNGWjBpTkpvYUpRU1NPNGgxYzJnYjBLUHJEOEZWNWk4WGdW?=
 =?utf-8?B?enhlWVJ0U0g3T3BSZUhVRmgzcnVuY0ROekl6alRlWjlHZ0dXOFNTVnRSOTlB?=
 =?utf-8?B?N0o0Q1RwaER6aVdONVhZY01pOXJWTHBha09TVVVxS1FaTlg4UEVVNUlTUlYw?=
 =?utf-8?B?cVJmRERhTDVBTm1FS1ZzNUU1UEJaZzVUbFV2c294N1F0UXc0UzQwWUlUQ0x5?=
 =?utf-8?B?Z0wrbW1palFzUEZDMFFPaDROSFFCb0MzK21yU3FMR1pVN2VobWFTVEF4SjNz?=
 =?utf-8?B?ajJKMDNiTEw4MlpqWDFjVE45UHI4TWRVVGRMZE5Rc1VKRVFCbVEzbTNCdG9G?=
 =?utf-8?B?Y2RjcXMxU2h0TDFwbnFqa3RONmhvKzIrNjNpMDZZN1BDMjhHRXVkVE9QdG1q?=
 =?utf-8?B?OW1yWDIvMkcxOXBkQ1l3cU5Qd1FybnU2VE1jQlpLMFFhR1AvNUdtaXcwcHdh?=
 =?utf-8?B?MCtSemtDeFVZMkpoUitYamh1K2NETjhxK3hsQTk2OE5pWENramd1SmZWM3hm?=
 =?utf-8?B?WkRLVEZYNlZqbjMyb245YmhHWFIrM2IzNzdMMXhrRDNHZXgwcnZNWnVyQWFi?=
 =?utf-8?B?M1BLdUNpVDBlaExINlc0VHdEMFdwdWo5dnhjYXNnOWVta1Y4NVF6VXVscE5K?=
 =?utf-8?B?NGVqWFgxcXlnR1hrR1dMT1lDeUhGdXo2WG54MFR4eG4wQzVVRWRmZWV1bHRD?=
 =?utf-8?B?R04vZC9QQ1JnaDlZeHBpMVV2cC82SGRQamo0YW9SblNwaWR1Nk9kNGZrcHE3?=
 =?utf-8?B?Qmk1c1VXWWdFL2pFYkc5MFREQVNQbmtVemRycTFISzZjKzIyQyttcDB6eExI?=
 =?utf-8?B?VU10Z3U0VG5qTXIwNmRKZ1FldTgrbk9VZFRQMCtnMThFbnZ4R3Z2V2VFaTNI?=
 =?utf-8?B?Mk91N0lRWmpvVEk5RkxETHUvSXhwcXJiSEdoT3E0WVB5M00rajRrdWpVV1lI?=
 =?utf-8?B?Z2IwUzJIY2lrRDMvZTNqMnR6WHdqdUt1LzJRaERLdkhpak05eUNYcFZGVUxv?=
 =?utf-8?B?bUhhWjV1TWZiTTRZRlJUYU1FVWZMY1oyVlJ4eVRMQmFTRjNYam9LVHJlL0dy?=
 =?utf-8?B?SjZYVm9mOXIxMzR1Zis1SjdaMGxmc0JTZDdzUEVmTUJoWk5zcVloS2ZRdXJE?=
 =?utf-8?B?WllnSmRubWxOOUhDWmhNU0VGTDI0Z1hTL29LVFhhNm5lbjFMSHRQRnpsdERm?=
 =?utf-8?B?ZkwvR0taM1NXdjEvQ1kwR1BMR3k3eUpRU2Z4MVFHN2NOa2VqRnQ3NkRyQm4x?=
 =?utf-8?B?Z0s2Vk1kV0dpb0lPelhORGtkNjhKOG9VMVMvcCtaVEpBZ2lLZnk0b2dwT1F4?=
 =?utf-8?B?b0ZyZDNJZm5pRlBuU0ZIak05UVBCZzlYcjNKSGc2L0ZqRFUvVndGWlhLMEtp?=
 =?utf-8?B?RW1mUUFYL2lEYW9uVFI4SVJwK2ViRHR0N3J1WDY1azNWVGZwSlBvV0xBK1ho?=
 =?utf-8?B?blE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 81bf36f7-d71e-4136-d21d-08dcf75c78a3
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 14:26:11.4229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HU+gg173SOA0lH/es3vCcPJL7ptce9S44CGTft6dq3XHOnPY+WxxfuUnCplnU7qKLc8F8npaHVnW9lsNYPzvRH1PWWBIWOLTq+0rkk1y/9E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10096
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 28 Oct 2024 14:26:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5603

Hi Antonin,

On 10/22/24 10:37 AM, Antonin Godard wrote:
> Give a brief description for important commands that made it into
> devtool or that were missing from this quick reference document.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/ref-manual/devtool-reference.rst | 54 ++++++++++++++++++++++++++
>   1 file changed, 54 insertions(+)
> 
> diff --git a/documentation/ref-manual/devtool-reference.rst b/documentation/ref-manual/devtool-reference.rst
> index 9c36195c5a5a2405cf8e3a562a2a53291e97c859..4862350f92781c80187a951f149ac2e5ef273510 100644
> --- a/documentation/ref-manual/devtool-reference.rst
> +++ b/documentation/ref-manual/devtool-reference.rst
> @@ -463,6 +463,20 @@ Here is an example that resets the workspace directory that contains the
>      NOTE: Leaving source tree /home/scottrif/poky/build/workspace/sources/mtr as-is; if you no longer need it then please delete it manually
>      $
>   
> +.. _devtool-finish-working-on-a-recipe:
> +
> +Finish Working on a Recipe
> +==========================
> +
> +Use the ``devtool finish`` command to push any committed changes to the
> +specified recipe in the specified layer and remove it from your workspace.
> +
> +This is roughly equivalent to the ``devtool update-recipe`` command followed by
> +the ``devtool reset`` command. The changes must have been committed to the git
> +repository created by ``devtool``. Here is an example::
> +
> +  $ devtool finish recipe /path/to/custom/layer
> +
>   .. _devtool-building-your-recipe:
>   
>   Building Your Recipe
> @@ -614,3 +628,43 @@ a match.
>   
>   When you use the ``devtool search`` command, you must supply a keyword.
>   The command uses the keyword when searching for a match.
> +
> +Alternatively, the ``devtool find-recipe`` command can be used to search for
> +recipe files instead of recipe names. Likewise, you must supply a keyword.
> +
> +.. _devtool-get-the-configure-script-help:
> +
> +Get Information on Recipe Configuration Scripts
> +===============================================
> +
> +Use the ``devtool configure-help`` command to get help on the configuration
> +script options for a given recipe. You must supply the recipe name to the
> +command. For example, it shows the output of ``./configure --help`` for
> +``autotools``-based recipes.

suggestion: maybe use :ref:`classes-autotools` here?

Cheers,
Quentin

