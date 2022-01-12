Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22387C433EF
	for <webhook@archiver.kernel.org>; Wed, 12 Jan 2022 14:27:02 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (EUR03-AM5-obe.outbound.protection.outlook.com [40.107.3.64])
 by mx.groups.io with SMTP id smtpd.web11.23897.1641997619674879558
 for <docs@lists.yoctoproject.org>;
 Wed, 12 Jan 2022 06:27:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=kHBps8MP;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.3.64,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BDDKeCyKf8E7cHLznVFtRBhIuiY3uLLxaCsZPGTlGnd6Lj+RhZjYYrUA8BAw3jvWAYvUMgvzyCOMuaA8nWRA9zxPJzP1WuajfGlwcPUjesF1nkeo2DuEr+J2jj412MjGcNLpCoTbvaN8BAQPb9Ldc9U1VO++jKBcrFbUXPRhpbgLHPOUhhbIklTsBt7BF1LYB0BPJAJWLmUUl0ziQ5vv4h7SffP60W4ZhySS/dNfQ+Al+PFiSENt7bwh20aLokRgRwkvo193VteJVE1THQiqCKC/v5vKTB2I3W/Wfg0FWBAvAjKXznV25lENlSD+u2xkJ/ShPAu5gZZdER/jkHdL3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K5/iQN0iIY6OpgKA22EfjoTTttID/PJh71H0VmjSmSM=;
 b=Fwjda62lZh0tUH0q18uiPb3LP1Fs7/l0/9pmaQiQZyUr24vzU31dFKrLGDqBl4SthZRxZWyBpLYQ0haYV12FKqUtCS5n8418qqJWtXjV2IY5Hz4HRgwDzsWLCWsLyqJttFcGpLSF4u+oxECL55yQeXM2xUZH3ol5LUVh8LYwI+1gUkRuQn0PxkAaFO5IMkv+7PLhbe03uPJKTyZkJUKEIZNhcSSRyEavlGzDXERKV5yVxHL3MeA5gbunhlUxt0dokjjX/wZ+tZNK6l6SMTe+5Tj95FyRHw9p623QzUx6SuvJJL72LCqtLpwg7WhEvZvpriG5tBn3ThBc30vAkTWOkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K5/iQN0iIY6OpgKA22EfjoTTttID/PJh71H0VmjSmSM=;
 b=kHBps8MP9Gq5D1ooSIxZ2F3Dvjl+aHo0T5YqyMXGVH8TQ86tooTB+TrGUxeF4e9FjcGkVq9QuDdroZeBuyXYjy3gWE2YKXPLd5pwiw2hLFntSW36BT366WKkgM2gqjiBe8Ij7NcOr1BqhGlOTwKcFVkNJ7NT8LZ8evHpKx15U4E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by AS8PR04MB8513.eurprd04.prod.outlook.com (2603:10a6:20b:340::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Wed, 12 Jan
 2022 14:26:57 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::a8e8:87d3:e868:cc93]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::a8e8:87d3:e868:cc93%7]) with mapi id 15.20.4888.010; Wed, 12 Jan 2022
 14:26:57 +0000
Message-ID: <2d51fd3b-8873-3c88-19fd-bd5d07cbe542@theobroma-systems.com>
Date: Wed, 12 Jan 2022 15:26:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [docs] [PATCH 2/3] ref-manual/variables.rst: add
 SETUPTOOLS_*_ARGS
Content-Language: en-US
To: Tim Orling <ticotimo@gmail.com>, docs@lists.yoctoproject.org
Cc: Tim Orling <tim.orling@konsulko.com>
References: <20220111195742.1921572-1-tim.orling@konsulko.com>
 <20220111195742.1921572-3-tim.orling@konsulko.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20220111195742.1921572-3-tim.orling@konsulko.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P190CA0020.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:802:2b::33) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fc31de2f-4798-46d2-8d08-08d9d5d7969d
X-MS-TrafficTypeDiagnostic: AS8PR04MB8513:EE_
X-Microsoft-Antispam-PRVS: 
	<AS8PR04MB8513C4CBFBEBB9EF84F1F27EC2529@AS8PR04MB8513.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:923;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4rjhjPSilypkwe9PW5zZPODroyJ3UDxGtTcGP8VRCe7Pcil8BRgJCyXlmYHpZZ2Omeu9DjBlUqsF1jlL2Z1NqMQYWYbX0P6SuvgEOWpyD6gTYLStdHQWtLM/xA2ANYKMj8KfFg27j4aCp5zWcbI8B2yL+2qqphJyGXD/6MLBevq2MoAX08Q0JiRHK6NtfN1xL5RuR5bfJueP/hi29Z//7aW4AeSIgVASBsOOK/mrBsTkGHimYdWr3ymIv9U0L/cUc6UIn8YatAXVHuSBZ7TchJVz8ygG0RdKBZ9bFmbl+6pbbAtKnjsFARdKnYXsYhwZL8hnttrqvFhp9t2bZl6os8S2Y8a5VvglGPTHyIqZpYJ5mEk4xJ5sZYlpJoUOMfR82lk7SHBcaKVgxvhRrDopkEQq+ycYPrB1vmnxONTuXPq/z+o0th7NbTNutYSMX/QMwg+JN6AEb2SwUeII0UifLUs1Egh0BAQy5xY081DsxHxqbv4Il/wWM7ovyyuV8rUgT94GhuXB4doO7DhiNxAtmTa8RIiO4B7VVmT3nBpOnifcJYbCGbpt5EYo6TPfyJsWC8U+//TzFXWgN+q8zitKVDW6SouQsyoQFJEmhhjNj2SK36IIffbsuuhSvzDKBJAmA9++7aHBoOqSuq90/kbflpqRfI/CR1Lz1qDkj68g9thrVKUr/k0MmdRUQSc4AysOFzzD8NZrNsTI1eNlVwD8wSiqYLngI9BHveUGNjNOkAjqf0FStsVSio9cfnrKv//kinWudMWz1iKmGYNyzgFRTxxGGvEO/zzF3mljmMW1duxF75h8z2ZV/SKKT35aQn8U
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31686004)(36756003)(38100700002)(31696002)(4326008)(6486002)(8936002)(966005)(83380400001)(6512007)(44832011)(186003)(2616005)(2906002)(8676002)(66946007)(66556008)(66476007)(316002)(5660300002)(86362001)(6506007)(53546011)(508600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VlJxaWNVSWh2WXAzbThwdzQwYm9pRnRsemg4OFMxaTg1N2dEMFNMTkRNME8x?=
 =?utf-8?B?SGtyL2ZaMHZLNTBGNFhYZGxNR1hNbldhS0NNQjg3a1BjVDJoMGxqOEQzdXdu?=
 =?utf-8?B?SytNVGNoUlU1M2FQVElmQmRQQnQ5MW5xUHhaQVlzN09qRVpnbFZ5cmpWSndT?=
 =?utf-8?B?Y1FuUlpUR0xONUZFWUx0NFNPUW9ObERwVlk1UjhucXJycnlIdXRPRWlrQ3B4?=
 =?utf-8?B?bmlwYXh4UStRdHgvSlljZmZtTGdoODdDUWxPdHRHZ2EyOTBnOXI4Ny9YTERs?=
 =?utf-8?B?VUNqV2pnblZKb1RUcTZPdGV1R3QvWmRJNWV4UmNScG5HS3h6MzBHZldTRjVn?=
 =?utf-8?B?aGQ3bnpKQ2RIb2wvL3dkdVk3VHBDQ0VCSDNzQVFCUGUrWFFvMnRRYWNKR1FS?=
 =?utf-8?B?b2pLWDVac0VUZlUyZDB2UWRHdGVRVi9ROEV3U1hEcVFCNm1ycXF4MGFQMVc3?=
 =?utf-8?B?a0xTMnJjeWtodkxiK0FpTk1DbVR5VWxkVnI4TktQMEVCdWZnR2kvVFd1WUh3?=
 =?utf-8?B?OTMvZnQxQWdXNk15K2R4UnZkbmVEcnZqN01XNnZuOVRxUWUrVXBDMURqaWx6?=
 =?utf-8?B?akRaRStUd0ZWeExkQmZwM1p1UHovKzE2NUNzQWFWNFVDQUloZ0V3NXd4bkp1?=
 =?utf-8?B?czlSaGEvcFFGVFNPd0l4R1pGRTd2OWo1M2FLckFIMHdwS0xoK2wvZUFQeTU1?=
 =?utf-8?B?TFptR2QrOXlKMVhrY0NkZkVlUnc3UWdJUkZOKzN5U3lFT0hUZXZ2K2JEMkJC?=
 =?utf-8?B?ZmkvN2xMN3ZQUlVYS1B6WHc3OVB5dzZGb29YQ2Y0MEpwRSt4ZGh1ZVJjajFq?=
 =?utf-8?B?alNza3NmbUo3Y1FpOXFnNDlDY2RiRnRJTFBDeUxraGtSbUxSQkhLNldMNm5J?=
 =?utf-8?B?UHR5aEloSWROUGZOdGZEWkhMTVZkZTRjWFJ6azh5c1BXYXg1T3JlU25ZWElW?=
 =?utf-8?B?VDVLbUFFSlVUTEF3SERxajhqZGlaYVRUSE0zOEIvSGwxZk1jdnJSWXFVOWpH?=
 =?utf-8?B?R0F1NVhFT1VXQ2dIemhnWnZ6RkJmQUVjQ0I5MVNYUjZGb3B0K1lhZHorTC8w?=
 =?utf-8?B?OFljdlBRaHFSeC9ERTA2blRZazNibjFBMUNEZzBsNThMcDlZV3NzaW1xSG5X?=
 =?utf-8?B?S0d3cEExSUhiRm1raGM5dXgvak5wcVdURlJuY3lSOVhqaFkwaE4vL25xbWNK?=
 =?utf-8?B?OXRRd0pWc2QwZkFkTGU5eUlXS3NUR2lZdVlaSUhUdEp6YStFQTQyTkFHME04?=
 =?utf-8?B?eUt1c2RPUDNadmRXMm9EZnY2QWMwWHdZdDVMS3U1YnZUM2FuU2x1UWtDbmNk?=
 =?utf-8?B?T2E1c2xQR1ZVUTVNUURwVDNrZS9kSU05UXpSekxxalRGbjh2Yllxc0t1TUEx?=
 =?utf-8?B?SlgrVnhrd1BzZlEvZ09oSEZYTTZ3bHY3aHhtOW1KMCtTMVJVOXRPdUhaSHJS?=
 =?utf-8?B?NWhkenZGUnV6cTRxcm1xZXg4OS9pVEkzNGdPUy82b2lGbGZvTnRqeVVUS1A5?=
 =?utf-8?B?Wm5oanpkRW43NGxnbnJpeGxjYjVsVlo1UHZ2c0dHakJEbndFaE81dnk2VEtq?=
 =?utf-8?B?UDg5dVNXOEZaK2FkWml5U3k0ZWdQbTFBUThiZUxQcFd6UVZ0SnpXbmxsc3Z6?=
 =?utf-8?B?U1craVJySjFUM2tWQVZ5NTh0Z1NRNDdDOXRSQ1ZZaGx1VEQvMVRPNUZUdHRl?=
 =?utf-8?B?dVIwUE1hKzdMdFI5YnRrS29jTDFCZEx4Y0xGTmhhMGdpU2F2dS9NTTczdVBK?=
 =?utf-8?B?TzJFb3lLSEplNTdOSHVxVlVUSllyZXgwR3ZRSnBFVmhQdmM0TEZHTTBUUzh6?=
 =?utf-8?B?Z015TTJhWEo3R2pBRnlmNXEzNDliNXNNTlFjT3JHOFNZKzlVeCt0YVpQcG1u?=
 =?utf-8?B?Y3BnZ1ZnMG81eXlpWGpnZFVWSnFEbzVlc0hMWFY5UXBNRHY2ZWJja24rcUc1?=
 =?utf-8?B?bXV6L2R3WW9jYXFLeWU1NFZQUGtWOFNVd3VIeVJIRi9BYlB0WnJlWnc0bzds?=
 =?utf-8?B?L3VFVHI5cVo2RXZUVVRwampkeDREb25sZkY5TDBOYlFyYnR1eVNleXVGcWEw?=
 =?utf-8?B?YkczU2xWVElUSkFSTVVMZnNhNmRGdEw1cU5VcGxsWDZRb2JmTFJaTGc4SnlO?=
 =?utf-8?B?ZWJUVmF3b3IwVk5uZ1JxOTRRV0lxMTNPczFKQjlFenRkcFBqclFEVm51bXla?=
 =?utf-8?B?N2YyNStLZFdMazZ3YUNnMzhtdzRML0dLcWN4dURicCt0Y0V5NHJLQlVXMSsz?=
 =?utf-8?B?V0ZsRGE1ajBiY1JQQS9Yb3VRQjdQYmNISG1tMjRFbGNpd3V2dWRVVFlvc0gz?=
 =?utf-8?B?bjQvbHJxcCtsdHR6MWJLbjZMaWppY1oxZEpseXZXQUlaK2YrQXU3dzFxbzAw?=
 =?utf-8?Q?39FPQfJ8KksIfd+Q=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 fc31de2f-4798-46d2-8d08-08d9d5d7969d
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2022 14:26:57.2009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ZaThbt+SasuM4dTMvndzDoTlTrlzvq1A6A+HYCPagdUl0g+bbpZiguBepqs7+MGxe4uCOoxdt09YGDprPZSnn05mj2WDjUEJaHVh14IQipYUDoPuvRbKOVLXTImJMEB7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8513
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 12 Jan 2022 14:27:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2394

Hi Tim,

On 1/11/22 20:57, Tim Orling wrote:
> Add SETUPTOOLS_BUILD_ARGS variable which can be used to pass additional
> arguments to `setup.py build`.
> 
> Add SETUPTOOLS_INSTALL_ARGS variable which can be used to pass
> additional arguments to `setup.py install`.
> 
> [YOCTO #14610]
> 
> Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> ---
>   documentation/ref-manual/variables.rst | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
> 
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 83ccda830..3011c1c83 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -6847,6 +6847,25 @@ system and gives an overview of their function and contents.
>   
>            EXTRA_IMAGE_FEATURES += "read-only-rootfs"
>   
> +   :term:`SETUPTOOLS_BUILD_ARGS`
> +      When used by recipes that inherit the
> +      :ref:`setuptools3 <ref-classes-setuptools3>` class, this variable can
> +      be used to specify additional arguments to be passed to ``setup.py build``
> +      in the ``setuptools3_do_compile()`` task. By default, this variable is unset::
> +
> +         SETUPTOOLS_BUILD_ARGS ?= ""
> +
> +   :term:`SETUPTOOLS_INSTALL_ARGS`
> +      When used by recipes that inherit the
> +      :ref:`setuptools3 <ref-classes-setuptools3>` class, this variable can
> +      be used to specify additional arguments to be passed to ``setup.py install``
> +      in the ``setuptools3_do_install()`` task. By default, this variable is::
> +
> +         SETUPTOOLS_INSTALL_ARGS ?= "--root=${D} \
> +             --prefix=${prefix} \
> +             --install-lib=${PYTHON_SITEPACKAGES_DIR} \
> +             --install-data=${datadir}"
> +

I don't really like specifying the default values of variables in the 
docs. The default value can change and the docs will most likely not be 
kept in sync (as a few recent patches from Michael has shown :) ).

I think the paragraph can stop at "be passed to ``setup.py install``. Or 
maybe we can add a few words on what someone would typically set this 
variable to in their recipe if they have to modify it?

Cheers,
Quentin

>      :term:`SETUPTOOLS_SETUP_PATH`
>         When used by recipes that inherit the
>         :ref:`setuptools3 <ref-classes-setuptools3>` class, this variable should
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#2384): https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.yoctoproject.org_g_docs_message_2384&d=DwIFaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=8wGMTT7Mjy9XFEK8rx13kzdh8PSQEe7L1DRuSkGS_zIIejVqWrVUWNVNxtQDiQjR&s=Hrn-7ZEdMEgRnmJGvVy19eX7zCYGwQY2oq4Hr0XGhz0&e=
> Mute This Topic: https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.yoctoproject.org_mt_88357645_6293953&d=DwIFaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=8wGMTT7Mjy9XFEK8rx13kzdh8PSQEe7L1DRuSkGS_zIIejVqWrVUWNVNxtQDiQjR&s=KVFe8_QAMfcjQibqPvJqj14YPqUGtIHNOSHR0hmZEZI&e=
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.yoctoproject.org_g_docs_unsub&d=DwIFaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=8wGMTT7Mjy9XFEK8rx13kzdh8PSQEe7L1DRuSkGS_zIIejVqWrVUWNVNxtQDiQjR&s=a2EqtjY70frDTNQjHZiWadqWOQo6eyBrV7c4oFuIVUI&e=  [quentin.schulz@theobroma-systems.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

