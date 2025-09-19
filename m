Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E285CAC59A
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 10:59:26 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.13])
 by mx.groups.io with SMTP id smtpd.web10.13532.1758279558005812292
 for <docs@lists.yoctoproject.org>;
 Fri, 19 Sep 2025 03:59:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=OiLEHS2g;
 spf=pass (domain: cherry.de, ip: 52.101.70.13, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OYdXywEJRzfs+2/L0So3p4bidu2pl7TWGQmUTT1zoHmwuO3QpHT4irseXCY0eApYBtxITpyt8BpirJLfSGxmUlunVytB1fYj+kGknMLet9i6xJlqJbj2ejQQyXXPJU9yZyEyzyKfMQ9j6oLmxM+Dqs+Z4MWFNE0OfZjBaWoI/RtU4evc0jZee3RZvupx1zRjtttkox1OAatFKkWZw8Olnq8czYUqDP/Gq4I398o95r6e1GDbUc9EnVIort9kQ/xm5nIbx73WyyXe4HYKxxKjWzvquCfF6idJWzp51psLXkmqUkJvZd08maWxr4CjXJOWmmY841c1JlXVdIVjzY2NLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fKUrL6Mb2uG7fK8r07Saul9A8UeN56esgIxz3RBgc3U=;
 b=Zoq5WtyJHOicZX2GuJD07EnV+6zLqGjmRiVceY3xtz4hl5YY5hBFheqDn+gfDQkFLjqD1FV655sN++NjPPJe+HwcDZxe7OBHiyN3/LOc5bV/EM3K2xPzVjPEquBkF3inpAYkOUWIk4oIKx1dDkQlroaG0TpWhAXIwA9XMrCFbtfJn7yY6UojbCOc9tZxfGWpQg31agpwAcgj3K9AO/TSeStzM37A/b66xv0bKab1QtPopsumnq6L5wlA1plIsvWU2JtIZURzKZ1p4EhxktpMhr79Pwq0ghLvCxZJ4VvlRXI5X3AoNUa+1CRChcALu3p/XqUk0H4kTU7P8ANiGtlcxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fKUrL6Mb2uG7fK8r07Saul9A8UeN56esgIxz3RBgc3U=;
 b=OiLEHS2gwxo+kkTpDnQzFkAd9H6vd5Bf9jSm+JW3ODUIE4dHOz03xYiy/L5jN2Cvkh0H9g9ZtS4j3dkBKxbMpjHK7xZ4PN/yp9qA84J5LrHh0Ayp/ZOxbmoDQl4UVkADyXqXJK+y9sa0jQuRcY1MxFr68WnEcsolzkWuB0qKXDA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
 by DBAPR04MB7319.eurprd04.prod.outlook.com (2603:10a6:10:1ac::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.15; Fri, 19 Sep
 2025 10:59:14 +0000
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea]) by AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea%4]) with mapi id 15.20.9137.015; Fri, 19 Sep 2025
 10:59:14 +0000
Message-ID: <b24eb087-b986-4095-8efb-f4ce1d769155@cherry.de>
Date: Fri, 19 Sep 2025 12:59:13 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 1/2] dev-manual/layers.rst: yocto-check-layer:
 mention the --machines argument
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mark Hatle <mark.hatle@kernel.crashing.org>
References: <20250919-update-compatible-doc-v1-0-f3a343914503@bootlin.com>
 <20250919-update-compatible-doc-v1-1-f3a343914503@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250919-update-compatible-doc-v1-1-f3a343914503@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA0P291CA0008.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::24) To AM9PR04MB8906.eurprd04.prod.outlook.com
 (2603:10a6:20b:409::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8906:EE_|DBAPR04MB7319:EE_
X-MS-Office365-Filtering-Correlation-Id: a3495327-2924-4938-6520-08ddf76b9245
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bCtaRXFEV3ZqOXRBcGZXV2xhcWJuOWord1pZUktucThSc1FPVTB0OGo3c0Y5?=
 =?utf-8?B?V2NDMlE3eWtuWHhBc0NibFFIZm5FZm0zYWlkQU1IbnF0b21TNUtUR0RJZzIw?=
 =?utf-8?B?emlLU1A0U3ZZWlRsTWR3Z0tZaVZxZFNQUCtzTTczdDRQREg3VVIrSWhkdW9F?=
 =?utf-8?B?aVd6QVRTNHdpbGpaZWt6Q3dXMUtkdWE1QmR1bzAwdFJ3UnZPWmRrS0JUbTdm?=
 =?utf-8?B?VGQrMWQ3V0tFZGlvN3JrSDhyVDYvdUtONHZLVHJUWWdyakxCU2tUSlNOTnRu?=
 =?utf-8?B?NFdKeFdQV0pNeFRtSkNQdm8yUmYxQUJnUGZkYkFST05VS1AyK1hTa3JuNVgv?=
 =?utf-8?B?RHNydTducFZBZEoreE9xN2g3czBrVnB6c3hJRTNPSml4U3IvQmhXRXpPUDlK?=
 =?utf-8?B?bHBEN29hTFgrNUs4RTN3OHBTd3RBZ2dreDlRTE4rZUhnQ29mUHVBa01YbG80?=
 =?utf-8?B?Q1dHWUJ0aTdmS09nWnhPR1o4cVV4V0EycFdYUFl1U2RpWFRGeFRtenEzY0Vx?=
 =?utf-8?B?RWNMNHFuVHZNWjZveElJdlNFOFBmR1BRV2F3NFpXYUx1V096VC9jSlhYVWoy?=
 =?utf-8?B?bHdWTjdoMkJJRUdaNytuUHNwS2oxOVJ1VjdraWRhUmlibU1Jb203bHFGYStU?=
 =?utf-8?B?OEM4U3htNmlPOXJib1ZIK2M3U2krNlhIZ1R4cjRPeVlqY05jb2dQcnh1c0p3?=
 =?utf-8?B?c1RKVDhlR0RvdG1wV3NHdmlETXBrRDZPWGltS29wc21MeGJuVmZ5a3dyUHRE?=
 =?utf-8?B?NFphZ2tpRDVYN0g1M2ptMTR1M0NBM05sb2twbVZEV1ZjWXZWb3JVRU9sZVlT?=
 =?utf-8?B?ZzJWNW5TdmVlOGF4c3FMdGtoZGExSGJtWGx0M203WEI3VVpPcCtmUlBqamlD?=
 =?utf-8?B?Vk13RTdxY01iZ3ljNThPaHZTcFVHTFFadHZpcFdGSGtTamw3aW12N0VCbkdW?=
 =?utf-8?B?cm4wc3hMN0JTK0t1emNBejJjVnhzcGpaWGIzS2JaVDNIcWdjQitTRHRkeS8y?=
 =?utf-8?B?KzcvSFpVOHBGSlorb3U2ZVhSam80QlJSSmdJamJISVpuUkFYMnVvaUpQUEkr?=
 =?utf-8?B?dkkzcG5QUG9SMitPdUx2OE1DVWhQSW5rVmZKVXIzWDVtRDRydHBDaWR5K3k4?=
 =?utf-8?B?eFpkTG1oY0dTSDBtUjZvWUo1dmVOODBLWmJWenA5UE9FTHo2R0xjZnpYV3Bu?=
 =?utf-8?B?VHBjMy92Qk4rV0NEUnNLTUluOVJCRGtYLzQ2YVl1M01TWm8ycEFjdE1Kb0lM?=
 =?utf-8?B?NzV2SGFKcjV2MzZGdXlzTURDTHp1bFcwTTlQcmZmS05NRExESGlBdEY4ZzBJ?=
 =?utf-8?B?ZVJMZk1LdngvY25EaERsc3cyeHJsL05OWGZ1c0JvRTRSdGdqa2ErWWpWa0Zn?=
 =?utf-8?B?QmxkZC9vUU1LUlptUTVRdUlyRkIzaWlqaStaSXBjVTVaM3VQdXhIdDVzSWp5?=
 =?utf-8?B?UUJSNTI3NGtDMVBoemJjbThWYWxjRG5vWXphOWU4cE5wTnh5SEF2RnBOckVl?=
 =?utf-8?B?cXhyNWk1YmplTHZ4SkxKakducVFycVNKNVd6N0wxOUJrS3FuaHpSNThiYWI3?=
 =?utf-8?B?OTJ3Zm0veDgzUmhQcWx0aUFkcGtUVHZ1SlZGZXVHY1ZFajNoRnZ5M0tQUXZn?=
 =?utf-8?B?N3Y3Y29FbVNOem5wY0FMZHFjQy9WQTltRUVhZkErYzNDNm1lUW9ERXVROXJT?=
 =?utf-8?B?d3VGZ21iSjBqWUpCNm5mZElJWkF6K0tHcVBrdXNJUW45NTJlN1lBeWlKU1c0?=
 =?utf-8?B?L21tVlE3WDhZMHpIKzFPdkhaU0F3L3J3enFnZWxUS1pNdDRRV2s2cEJOUnlB?=
 =?utf-8?B?Vjk2YmFKT09GV3Q3R0VzTEZtWnJyOUpVc0REZ2M2TWdFdzZGbWdUZDJPN2g4?=
 =?utf-8?B?bERhWW9td3JjcUZ2L3p4ZmNQbHFlNWQ2WU5wR1hWOUdBRXlGeHpObDl3ZVR5?=
 =?utf-8?Q?1jYhDWBsyUA=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8906.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Ky9YWDBVdTd4QjBhZGhweXhZTENEQVJnVDFWazlVVyt6OG5kdnpvd0EwL2Zp?=
 =?utf-8?B?TldTL1ByQmxua05vaExmYklqVFpkNDNORXZYREdKVzM1TnFEcmtmZm5IcHRU?=
 =?utf-8?B?eFFEYlR1ZTRtYTdOaG15ZXBDaG1xVnVGYnhUK3ptM2g3ZnhuZThPSTVLYUYz?=
 =?utf-8?B?bklmeXFJTS9ISWNJSFYxUVZMdXk0N2Rldm5SdGl6R2xPNXVUekxWbHFHVytv?=
 =?utf-8?B?bDBLdXA3NDlmL2Uvb01JVnFDQzdGZUVHM3ZOSXNhV1FqdHBCeW14Y3huSVor?=
 =?utf-8?B?QlBUeGhYay9TT1pLYks1WmpmZ3ZrRFE4VnpyNTczMnJJcTNOYzZLTmlQTkIw?=
 =?utf-8?B?SCtTN3ZGOEtobTk2aU1NakU4Vy9HMjh1YkV2Zjl1Q0xVMFhzL3djUUVMR2tO?=
 =?utf-8?B?eG1mbldlSHA3S1gxZkF4OC91K20xMVFwbk1aclFlaFV3UVgrQ3FMMDdrdldV?=
 =?utf-8?B?UU9rdzRjOVpsd0FlQ0dGSU43enFsbjlZZEhLSVd2bXp4aXUycHdzNGw4WDht?=
 =?utf-8?B?eW90bFh1SmVRMExMcHJ2Sksza3NuMnUxL1JHQWJ0MTBUZ2FUTWJhWklqbE5W?=
 =?utf-8?B?Y25nVXE5eUYzTVVXZGNTNXV3NlNtYytKKytpWjlZN2d5NmUrQ2xNMElSdVVH?=
 =?utf-8?B?cy9vaTVWRlZqN3NJSUVraks0ZW9QSXBERnMyVnFsbnlMNE1Jd2wxS0hIcXF6?=
 =?utf-8?B?aGg4UmRaMWNMNlVZR1JDTjU5K2dNVlhFdDRGUFRXdjNKaWxxN0pPQmxHamE2?=
 =?utf-8?B?aUVTS0RhNUhNQ3NVQ2RycXRGclNTOHVhcFNJRXNMYXZBSVpwZEtMcnRnQklH?=
 =?utf-8?B?M0JmbEV3azBITVNtNWo0bWVtNm56YndESTJYT2F2Vk5oemhkWE1HVmVBdlRS?=
 =?utf-8?B?d1RFK1lrdWtYWlZFMWNScUNuNEJYWDE4MC9lUDRRTmE5SEt1NWZhVTY2SnlT?=
 =?utf-8?B?clNIUUxuRnI5QlNiV2pkNGhHVk5nVG1JYm1ZNVdPdTQwRGltRlY3elNzak9M?=
 =?utf-8?B?M1V6cCswR25ONUZndEpQL3lJTVhRaUQ3VlVXUkhxMENIMzZyaW5iTHE5aXlw?=
 =?utf-8?B?NGFHSklHTXdKbGZ6V0h6UW54K0ZQVGhuT3dTUTY4WHc1VzhCcTZjWG5nZzdJ?=
 =?utf-8?B?L2ZuQmt5YjYyZ3FVaEg4YmlYWnptdjltZWs2SXptNi96anhISzZHT2RwdEgy?=
 =?utf-8?B?T01Mbi9IZURZeCttU0VwajFRRXZYdmtPSktlWEhreG5GOFQxekY5enRlZk0y?=
 =?utf-8?B?KzlNZmM5d2tINk9JblhQL3ovVVBieE9xSFd6SlVKQVZOZHhhOGpJQkY0QUxY?=
 =?utf-8?B?OHZFanpOR2VXdkNJbG1VeStYTHFxRFR3dDhwZXlDMFZ3d1ZDdnk1eHl5elpn?=
 =?utf-8?B?UnJWQ2RHem5TekFWVzhsUDgwMDdnVDYyVnhZejJVQmQyTUxNbVNLTVZscTJU?=
 =?utf-8?B?UjNIU1ZhblpwbG9tNmU0VHFYMnl1R0lNMTA1RFU4WW15YlA1NS84dFRtZDRm?=
 =?utf-8?B?Rk1kdlhneWptNm9SRG5OSk5pZTRIclN4VUJLZ2pWVXhlQkNxYVdTcURxMDJF?=
 =?utf-8?B?YU5uSXNxYVJoWk1saW9QUmFKNm1obVpmSXVqc3JmWjA5Yk1LMTR1MUhVQTg1?=
 =?utf-8?B?QWkxN3loOHdXT0xVNm0rVk1rQ3pJcEs5MUZsa0IxUUhTV282bWZmWkNadEtR?=
 =?utf-8?B?Rko2UlFKNWV1SXhFZHNkaEx5SGE0RDA1YXRndFNqTmdVSG1PVm91Z25HS3VR?=
 =?utf-8?B?OVVGNEF3UVNUNlJLMmpqZ1RSdGw5T2R2YjBBTGt4Zm40S3RDamlOb05SNzVa?=
 =?utf-8?B?bFh0WXJCQ3lFWStVbWJLVTZIaDRaUEF6Y2hvaDBYcDNqQXdLbk44YmdTMXl2?=
 =?utf-8?B?eEo2cHFaaFJCUjRYRDU1SjJSMldNN01uT3hDUDJwSnkwdmx2MVZzMFVEMUVB?=
 =?utf-8?B?UTBEakl0SkQ3NmtFTHhVUUpRdjc3cXg2ZHdDRUwrVkRVcGdVM2l4MGtEOHFr?=
 =?utf-8?B?MURBc1A0b0ZISzFGc1o5Y28vNCtFalE4VkZ1UHF0a0VzTVdYanZKc2NmUE5X?=
 =?utf-8?B?K3ZnOEF5bFdlc3daV0UzR2J4elhHbW1YVlFwMjZPUE9HaG9KRGhTbzM3QVd2?=
 =?utf-8?B?ZFZib0NGREYxeUNpT3FHVEs3U0tneTh2WlNCek9hU0hKeVVHZnZlRTFnQmZ0?=
 =?utf-8?B?SHc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: a3495327-2924-4938-6520-08ddf76b9245
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8906.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 10:59:14.6256
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8E2HChNJEFz/MbJsvTbSMIjLJfx2Ms/vU7k84/zxCZa0L53ikemtHj37uqmcHsnvZw54h2/Hik/8WB+pQ7zST1IbMyIAtvrDJhWfhz9qzyo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7319
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 19 Sep 2025 10:59:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7559

Hi Antonin,

On 9/19/25 12:14 PM, Antonin Godard via lists.yoctoproject.org wrote:
> The yocto-check-layer script should be run with the --machines arguments
> to test the different machines present in a BSP layer. Mention it in the
> documentation.
> 
> [YOCTO #15974]
> 
> Cc: Mark Hatle <mark.hatle@kernel.crashing.org>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/dev-manual/layers.rst | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/documentation/dev-manual/layers.rst b/documentation/dev-manual/layers.rst
> index fbf3f1a33..0bcbceb1e 100644
> --- a/documentation/dev-manual/layers.rst
> +++ b/documentation/dev-manual/layers.rst
> @@ -376,6 +376,15 @@ directory::
>   Be sure to provide the actual directory for your
>   layer as part of the command.
>   
> +For :term:`BSP <Board Support Package (BSP)>` layers, the ``--machines``
> +argument should be passed as part of the command::
> +
> +   $ source oe-init-build-env
> +   $ yocto-check-layer your_layer_directory --machines <machine1> <machine2> ...
> +

Considering the help text of the script, we should probably rather have 
the machines before the layer directory? I assume you may have tried and 
discovered that it doesn't work by simply swapping both, likely due to 
https://github.com/python/cpython/issues/53584?

The answer to that is "--", as in:

yocto-check-layer --machines <machine1> <machine2> ... -- 
your_layer_directory

I always wondered what my BSP layer would return to match this and I 
just tried from within a kas setup.

First thing... it seems it doesn't detect layer dependencies from 
bblayers.conf, so I have to make them explicit them from the command 
line via --dependency (which is fine but a bit odd if they already are 
in bblayers.conf?). Once that is done, BitBake complains because the 
layer is included twice (?????). So I instead sourced the script from 
within the kas container to another location, with thus an empty 
bblayers.conf and then it started.

I ended up calling

yocto-check-layer --machines jaguar puma-haikou ringneck-haikou 
tiger-haikou --dependency ../meta-openembedded/meta-python/ 
../meta-rockchip/ ../meta-arm/meta-arm ../meta-arm/meta-arm-toolchain/ 
../meta-openembedded/meta-oe/ -- ../meta-cherry-es/meta-bsp/

which is what's required to setup a BSP build for me.

The issue is that it seems to test more than just my layer?

[...]
INFO: Setting up for meta-python(LayerType.SOFTWARE), 
/work/meta-openembedded/meta-python
INFO: Adding layer meta-oe
INFO: Getting initial bitbake variables ...
INFO: Getting initial signatures ...
INFO: Adding layer meta-python
INFO: Starting to analyze: meta-python
INFO: Distro: poky
[...]
INFO: Setting up for meta-oe(LayerType.SOFTWARE), 
/work/meta-openembedded/meta-oe
INFO: Getting initial bitbake variables ...
INFO: Getting initial signatures ...
INFO: Adding layer meta-oe
INFO: Starting to analyze: meta-oe
INFO: Distro: poky
[...]
INFO: Setting up for meta-rockchip(LayerType.BSP), /work/meta-rockchip
INFO: Adding layer meta-arm
INFO: Adding layer meta-arm-toolchain
INFO: Getting initial bitbake variables ...
INFO: Getting initial signatures ...
INFO: Adding layer meta-rockchip
INFO: Starting to analyze: meta-rockchip
INFO: Distro: poky
[...]
etc....

Which is very surprising to me, why would we want to run the check 
against those layers? They are dependencies after all and of course 
since my machine only exists in my BSP layer, the test for my machine 
won't pass for meta-python without my layer for example.

So I'm not sure what is supposed to happen here but I'm not sure what 
actually matters as output to this script :/

I would recommend to add a few words maybe on the --dependency argument 
and that it should be run from a clean build directory (at least it 
seems like to me) to work?

What do you think? Can be added in a follow-up patch if wanted, so for 
the current content:

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

