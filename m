Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.36])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.722.1795195873374502537
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Nov 2026 09:31:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=DlzdS7Qk;
 spf=pass (domain: cherry.de, ip: 52.101.84.36, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zGM6MvMbj0L4P5xY86alvT9F8f19lHzxnWg6eykNe7JoEXqJX1Kyvv7ulkbQ3kf+unTc1xm0bOHtggy+mmFpS9XTXkWAkDlhi85c9uhmFfls+BwAqGnK4ek4LiQI4MN4avfNZ8ngQpPfDlDIPuNhqCP1DP431xtAwHFfw7bOJqkcDPVkq5KizkojNrl7OfgHDkCtqzCubFZ7Cw4kd5vl6+v4Mj0+q3g5QocndTJqpujCaAwG/iKl4Rw6a9AV2VpTcjsbbsySHQTxlSL+ruXlaxglz/iagPjiqsO1/JgaMwOQcM13hxYl+8SPPCqc9PJGskH9DJNdVmIw75WWQh8yUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wKowlAxubJk5D403tnLe3tli292xhLD0VGMs/7PIERM=;
 b=EIO4zMJGTpHLpbMln/qu9sIY8TTGpAmchWAAUJT0FFtdpurm1YMT5yaP/7Wq0f3P+POGBl3C+oh8pjUuBz6xoAGXzxwQ6Z6R057/4pKdFIt++OnN4g97Eo4Qpa/o73aFujia6ohdAUxnKVp5/4616qW3yyXlEpY3jT9F1zStsf7KTBtFL7+Rl6w/qZALo7FbEoS8ePKj85fTcW0C7DtbS07BaXO976jCYnoeKtFdmMWv0YWDW6jHrOhDSYwIU/KpSGT19sxz+b8cg+qYSfQekMUMMa64yVDNU1I4AH42eM3Gv3PItvvQKHcyDpTMHidR77LcCLysx7M0X6FGp/jMKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wKowlAxubJk5D403tnLe3tli292xhLD0VGMs/7PIERM=;
 b=DlzdS7Qkx1hFovv4QTePubt/92JXs/azECJTT6LJ1XkljAahm+alJ+egUqHLrlD0xtutZGrxYghckPezo5qtmpMeUoraXF9s1MeE1DdAKFdI4l5lmIp1iObBVqz+v/XetOwlOqo0v/C1UlClkTP6WutLAN2m3QYUCY6guY80epM=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14) by DU2PR04MB8679.eurprd04.prod.outlook.com
 (2603:10a6:10:2de::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 17:31:09 +0000
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::c859:7e6d:9345:afe1]) by VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::c859:7e6d:9345:afe1%6]) with mapi id 15.21.0639.010; Fri, 20 Nov 2026
 17:31:08 +0000
Message-ID: <b2f3e59f-32c9-4039-aad4-e9218e8d669a@cherry.de>
Date: Fri, 20 Nov 2026 18:31:07 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 3/8] conf.py: enable the sphinx-tags extension
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20261028-tags-v1-0-d5ad01019eae@bootlin.com>
 <20261028-tags-v1-3-d5ad01019eae@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20261028-tags-v1-3-d5ad01019eae@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0045.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::14) To VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14)
Return-Path: quentin.schulz@cherry.de
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI2PR04MB11147:EE_|DU2PR04MB8679:EE_
X-MS-Office365-Filtering-Correlation-Id: 47647e28-3a24-4674-eec7-08df472c1038
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|18002099003|6133799003|22082099003|3023799007|11063799006|56012099006|4143699003|261021121427099003|261102123227099003|261022075727099003|261026121527099003|261021123027099003|261009223027099003|261102124527099003|10067099003;
X-Microsoft-Antispam-Message-Info: lG7ji/vc9FUWCSPAT85/nCWz7xBMtbJA7z2euRXguvdlHfuL32G1ccj+BSOwCUXBtnv3KG6rGgWqOpeYJuFyzQWAbVCqedxeDga4/ytrdykPuvroKQSZAqHxFpI9jG8uEjL0GgU6C4oNQIj0K6w21ANpIvU2wrnEAmnTImAAbcEfusBpcltbfLxfasjAx7tQ0wD2d65mEw+y7OPXS1WFjiAva7XdK5YWK8bPJNx4x2/pF+lrS3D2dmIqmyvpEosN8jqjxio6T+PlCoQAqfIbOF2HcI1j7jBISDlzWCPdkLUD8ZUiT8vCYmv1ixqvYkKpHpRuu/cZ8BaVyEE9FJqt5KL/fOAyZCe1txp84tASEFIf80lKV91AcfdzELLLBIZxgdcfBUQ+xj0QOel6hd3x0iI9yWqyyHom8S4pp4V19Xkkt8jPGT5ilnfKDiYaINgSZS0GXYzotK0gW4tpyw+7Vjme0cDB2vYOdT63RWmpkw1FxnsswCrGVx5ed/bx5sgNwCyCaOYKYt2GiKQrFR9CeIHWD1X8lNEyCfmCAqpvV+cpQ07SQBOkOfhPjomWEkvXHbAwNpPh1bqOH6E9kFKk+t2xLhokCXGcWAxb6elQ+J7vz45Kqs8TGa3RYHvgE3QSI3sGFnQUsGmg1fgIDVzEJtbRam05p7N9F0xhQf1omf0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2PR04MB11147.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(18002099003)(6133799003)(22082099003)(3023799007)(11063799006)(56012099006)(4143699003)(261021121427099003)(261102123227099003)(261022075727099003)(261026121527099003)(261021123027099003)(261009223027099003)(261102124527099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eElCUEcyZjNBTTV2dml1QW02NDYyYUpteEpYbUhEZzc1ZTdyNFU2MFlDckZw?=
 =?utf-8?B?M09XV2I1Nkp0dnlZOThiNDhhNzczMlk2VndWdzIwaVEzdURUZy9LOUtNaHgw?=
 =?utf-8?B?VTBLRG8xc0FqMlEreXJTMnYxVmEvaGhsMkExNC9iSWF6c3g4MlZZdGVwbXdj?=
 =?utf-8?B?ZmRETGp5emtDVGY5YklMZFBUakJvbE1IZ3o1bzhibk1WSnFjR3YrVzd0RFli?=
 =?utf-8?B?MzVic2lXN3I1Q2ZsWnIxYmMzUkt3RnUzdXpVWS8rLzFpUUNERHVwTTJDMzRN?=
 =?utf-8?B?T0E1Z2pvTE83a0g3MDhycmpkWm44WmxQZ0lteVZHT3diS1VIVGxsOCtiOE9Y?=
 =?utf-8?B?aUJiNWppSGJGM0tWZXdFWXZmWGE5L2piM1Bva3FHbEhIZjBrMWxJR0w5M1o4?=
 =?utf-8?B?QzU2ODJPWjRYanpiUzF5Q2k1MVU5bG12RzhsRFU2QmMyUTdZTVcwaFRYbS8x?=
 =?utf-8?B?OFVqcUtZbzlJMTQwd003LzVMOFJoNDRPTnYxczFpY1BOaTdIV01qZUNOZHBT?=
 =?utf-8?B?MzdyQ3lDR09RK1NzT3p5UjhNSlAzajhqaWtZUXhrR3kyOXpOcWw3OWRwbVJY?=
 =?utf-8?B?SGhPRTJuaGdOYlFMalVaY3k4MzZwSDlKeWlOVEIzYkI5R2Rkbjk0c3hRTjNR?=
 =?utf-8?B?V2RnYVdXZjNnbjlPbk5LUllkR3QydlhJSDVaTGN3RHl1VEtnOFBodzcwT1Ra?=
 =?utf-8?B?OEtrNHAwL2R4QXA3WENqTFBHQk00T0pwaUIvL25XNkZ2YUVJY2wyVi9QQU93?=
 =?utf-8?B?ZEpvblVLMHVQTXhwYWpyMVorVXVERExSbXRhWnpoUWJ2aExiWVYwVzlVaDdR?=
 =?utf-8?B?dDBXSVF5bU9VeU5qanVCQTYrK1dnTmthQ1pXdVVzdktVYS9tT2VnNWR5cy9R?=
 =?utf-8?B?RU1adGxyNVF2czh6dUtFRXVFSEoxUDBsOGlSazUvczhCS3Vtb2hHQXNyVzMy?=
 =?utf-8?B?dExuckxZVndDbExESlZ5VXlzUnFhUWZOOWMvZy82NEJtZ2M5RmpLKytmakNx?=
 =?utf-8?B?NlZjTng0b0NhK1dzamtLM2JnUjFVVzFHVmxwQWFiUTJJNzhiMTMwdXJxaFRO?=
 =?utf-8?B?MDNJTWUxa2NrbWRseHBkdGVsem5iM0Q4cFlUb2lIYitEakxwVE1uM1dNUzMv?=
 =?utf-8?B?cFBSTEJvK1J5KzJCK0gyZE9zYkxoYnhOWjhJaWd1L01Pb3YwaE56YTd5Y3h5?=
 =?utf-8?B?WURvS0dKOHB0Qks2T1JMODFRbThZV0xRK3EwbjNBaGhoVGFCa2djZkZJWjNS?=
 =?utf-8?B?K01kaGhJZWNMQTZXRHhRZWFnLy95V2lrSjJFZWsrMFZBYXVzbWcvWG5JWTVz?=
 =?utf-8?B?OXg0R2F6bzNJdTh0M1ZwOXRKQmRxYmNMek5vUTlpSnRJVDN0czYxWm1nWHlp?=
 =?utf-8?B?VWtYa2V5Y0lRTFJyM1c5amRaUmx1a3F0ZFY3SVF2ME9GWkUxU3Frc3F5UWNR?=
 =?utf-8?B?UlJrZzdhWHJKNC9YVnhBTTFaek5iQURzSEE1NUJOaEs2aHJvRDQ1MzZHUi9v?=
 =?utf-8?B?enk0cytDZU54UVYvTm55enBKcW9hV3h0YTMyeWZsUmZrWWJIKytaQWFqYXVD?=
 =?utf-8?B?UE9OaUpYZEdOTEZtMTBmUkJpRmdTMDNzTkRJUEwycHo0dGQ1T0Y1aWxwVjd1?=
 =?utf-8?B?N2RKS21NRmpxVWUwTGN6ZDJYbUQ1VXNaSkdPOURaZFJIMGpJTUhXVWNBYUhS?=
 =?utf-8?B?dmY3aTZpcFBkc0NLNC9GMXg2Q0g0RGdYQXFTRzl6NW9hYjlMVVlLSWUvTXlh?=
 =?utf-8?B?bUhaOUNBNHl4SXp0OEZ5YlRnOXowVnZKUUE0MDZUSG5DMkVDVmNQTXVYNkl0?=
 =?utf-8?B?dVFEL3doY0ZlUHlwK1FBSG9QbEpXbGZyb09TUGl4enFFU3BJcEI2UGVERm9j?=
 =?utf-8?B?cmsvSVd5dEc2eTh1ellNVDZrTjg0RFBlYStLVjdOZFdENTlvVk5uTzdJbTNl?=
 =?utf-8?B?eFRwRlVEK1NuVnRvQTdhaHZES0FoWFZGd3I2UTgrMXRmVklkL2I4S1EvTXZJ?=
 =?utf-8?B?MG5lSUhXdUppRG1hTWFRbS9GZytOQnBLZ2EwbWRDdlZ3TEM3cWpFZkFYYlVU?=
 =?utf-8?B?MW9ZMWxuNkZpWjdHTUd0aXA5S1pKMTdSQVBadExLQWR5MzkvQmgzS0JENWVH?=
 =?utf-8?B?b1A3UFVDeS9OVGlSaWo1Y1pURzM1OE52YU5SVjJvTlV1WGFmNWRVaHVTZjND?=
 =?utf-8?B?RWFqckpadDc2MENBd0YvcjJyUWRQQXppU3oweS81Smo3L2dUNFFWQTd5ZlpS?=
 =?utf-8?B?bFF6YUY2WXUvd1A5bk82RXA3TURGemUwUGM5Z09GcFZZNS82aW44NHR5eXVq?=
 =?utf-8?B?R1RGOVpyN1g4OGJMVHZDMlZ3aW5VKzZSYzJiS2I5NGNwMTRNR0x0Zz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 47647e28-3a24-4674-eec7-08df472c1038
X-MS-Exchange-CrossTenant-AuthSource: VI2PR04MB11147.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 17:31:08.8367
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bUi1awF2QJUpBMQ5GMlTDU+2pSa+lAjCI3KVohXlXuNenypgLTxriaq4crjFnONyW1OWNXfNt/jsyAs+ZGuwMsDz6oqkC9dYoG6xJ52nuDU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8679
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Fri, 20 Nov 2026 17:31:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10820

Hi Antonin,

On 10/28/26 9:04 AM, Antonin Godard via lists.yoctoproject.org wrote:
> The sphinx-tags extension can be used to add tags to document, which
> then creates a section of the documentation with a list of tags which
> group documents. This should help users finding the different documents
> across the Yocto Project documentation which fall under a common
> category.
> 
> Update the Makefile to remove the generated _tags/ directory on a make
> clean, and the .gitignore.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/.gitignore | 1 +
>   documentation/Makefile   | 2 +-
>   documentation/conf.py    | 8 ++++++++
>   3 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/documentation/.gitignore b/documentation/.gitignore
> index d6d020efb..84d82f45d 100644
> --- a/documentation/.gitignore
> +++ b/documentation/.gitignore
> @@ -1,5 +1,6 @@
>   sphinx/__pycache__
>   _build/
> +_tags/
>   Pipfile.lock
>   poky.yaml
>   sphinx-static/switchers.js
> diff --git a/documentation/Makefile b/documentation/Makefile
> index 2df23ebf4..f165e36c2 100644
> --- a/documentation/Makefile
> +++ b/documentation/Makefile
> @@ -33,7 +33,7 @@ publish: Makefile checks epub latexpdf html singlehtml
>   	sed -i -e 's@index.html#@singleindex.html#@g' $(BUILDDIR)/$(DESTDIR)/singleindex.html
>   
>   clean:
> -	@rm -rf $(BUILDDIR) poky.yaml sphinx-static/switchers.js releases.rst releases.json
> +	@rm -rf $(BUILDDIR) _tags/ poky.yaml sphinx-static/switchers.js releases.rst releases.json
>   
>   checks:
>   	$(SOURCEDIR)/tools/check-glossaries --docs-dir $(SOURCEDIR)
> diff --git a/documentation/conf.py b/documentation/conf.py
> index d2252d5ab..75d062945 100644
> --- a/documentation/conf.py
> +++ b/documentation/conf.py
> @@ -50,6 +50,7 @@ extensions = [
>       'sphinx.ext.extlinks',
>       'sphinx.ext.intersphinx',
>       'sphinx_copybutton',
> +    'sphinx_tags',
>       'sphinxcontrib.rsvgconverter',
>       'yocto-vars'
>   ]
> @@ -260,3 +261,10 @@ copybutton_prompt_is_regexp = True
>   copybutton_only_copy_prompt_lines = True
>   copybutton_remove_prompts = True
>   copybutton_line_continuation_character = "\\"
> +
> +# -- sphinx_tags configuration -----------------------------------------------
> +
> +tags_create_tags = True
> +tags_page_title = "Tag"
> +tags_page_header = "Document(s) with this tag"
> +tags_create_badges = True
> 

suggestion: set tags_output_dir to $(BUILDDIR) (maybe /_tags also?)

This should allow us to avoid having to update our Makefile and 
.gitignore? It's also where we put build artifacts so it makes much more 
sense IMO.

Looks ok to me otherwise,
Cheers,
Quentin
