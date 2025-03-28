Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B4BBC28B20
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 14:16:27 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.87])
 by mx.groups.io with SMTP id smtpd.web10.12276.1743171380900493270
 for <docs@lists.yoctoproject.org>;
 Fri, 28 Mar 2025 07:16:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=VJqBbrkJ;
 spf=pass (domain: cherry.de, ip: 40.107.247.87, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rTFO3WyNR8mUQSxDjfnuky5kWcl+63FAmwFVMmWHtrPz1LNP5Og4uZ8wWLszBf4kBBOi63i5VLBnwYX4PLNOLw6mRQ7HSC7IFTD2qWcjGQuzKYqUvAZ1YbfJ+VnPKBDbcMfCyu/RwmedqmoDzbj+V17Ni0Y0T28eKvEmkgmPny6Xun7fgrt8DNd+Qt2tIuIs7ccertOEIYP6a7x12KSl245St1gm25CT2ktlfXucaLieBTWO2k6Ikjil9mAud+93QpdnIWclehY7aZFFuVgcnhzBsW3tKalRy2jknaQgiakK+OmdSH+D2AvQTwCmIqI8WYJAPK9JfLWEDr12hVKm7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h3NDVIytWsIe4OJNyvjP7fxgYkG9N8HZkEdPVkhdUYI=;
 b=FXRRjbREfLFjmzh2ZnLCMqLnUazDpkkUNf13oVl39GNqSoaiYNc5sqQXXgmXjfzfrPtzsWi3hl1jExinxDg5Wl5o23fzsrPyGjsrdWmO70qPHSTeLzHjUdLi/flCg1ZcKxe4dfZvfOdD4gzRNJvz5MZSHL+8QajlWIyeIp6Kd02HhilBxkfTbyDDJzaJ0+OeX5j/5KO7FH/jXZXFZZulSUqQ/fu12cOjsMgrjWaoDgq6Cr3/wmL/IlTfY9dOQ+ycbgnhT5A+VYKEW+anlIWvGrpYCwzeco6Bl+Zf03kWz0+zok0G/BklVxz362U+LIytMrhhT966RdWhRstf7ba1CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h3NDVIytWsIe4OJNyvjP7fxgYkG9N8HZkEdPVkhdUYI=;
 b=VJqBbrkJefLZOQvX3RLBlLjy4ugpFjBQChpA+jrRDe8kazH7rVx2pIu+SIQIDvtW9WaP+TWbumtbV/Apr/aNmhfwST0SF04KWXfnutMD0osFxH9KcM9EZ7MtfFIolG9ZkUI9Bakl3u1SbaQI7g4LdSUcXhXD2iM75nsEDYagzH8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM9PR04MB8415.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 14:16:17 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 14:16:17 +0000
Message-ID: <7e755039-2a94-4142-b4ab-bdce1a52fdd5@cherry.de>
Date: Fri, 28 Mar 2025 15:16:17 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 11/12] migration-guides/migration-5.2: update
 for upcoming 5.2 release
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250325-release-note-5-2-updates-v2-0-19f050d61da3@bootlin.com>
 <20250325-release-note-5-2-updates-v2-11-19f050d61da3@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250325-release-note-5-2-updates-v2-11-19f050d61da3@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0206.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::10) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM9PR04MB8415:EE_
X-MS-Office365-Filtering-Correlation-Id: 6daadff3-ff9a-4abd-42af-08dd6e031b1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?djEvTjkvNmdDNk1KRDJwMUJNQ2F5VTNIYjYrbUwxTzF1ZFNGNzgvbFptYitU?=
 =?utf-8?B?UXBqdmgrR3oyN0llRlBrTFpNOTZHdWpIOHgzZ1pQQU0zSlZGVUllUDNFS3lj?=
 =?utf-8?B?b1pxUmpTSEUxTzRzalZXUnpKUXRFOU1KUWNLS0g4dThBYnNTaEtDMkJ4SjhO?=
 =?utf-8?B?RmQ4SEc5c3lOb1MxNU9iam5NYUk4bWNDZThrNzh5RnIyYURUbm1EcnVHOFl0?=
 =?utf-8?B?MTR2N1FlKzJvRTlzRklwUjlmNHhidmo4NU9LR2NsWlVIZUc4bEM5MTN1S3d2?=
 =?utf-8?B?VFYxcnpTbmJZM2h3Q2lNdThkOFdHaXFhVW9kTVJqSExRaFdhd1FaSmRKaTRs?=
 =?utf-8?B?UFBCWWtuYWdsSjhHdEx4VGRvOHNYMnZrbUdRWEFaS3FnZ3NJMVhXdjJEYldk?=
 =?utf-8?B?TTAxQ09ZOFh3YlFGaXlKdm9HVWNYb0JMSVl2TldUekpNNURwNlJ5OVBCOW5r?=
 =?utf-8?B?MHQyUUpjdXJER0wwVHVXaXVtdGpNRFoxUXdJeUtpME1qL3BSMklaVHFYWXVY?=
 =?utf-8?B?UEhySTZlUFJJc25pR0c2WlA5WXl4dGUxRVE0ekY4TVpUcGRNUEcyRVFzWHpE?=
 =?utf-8?B?NGdmaTZEdXQrbmxFWDR6OVZqTC9vQUJzd0xVZUF5VzJ0YjhrdHNTajlPWTl1?=
 =?utf-8?B?YVRuYjRBejBrd1J0OXRjVE9BSWJ6Zi8xbldjVlF0K01uaE43TWYyTU1JT0VW?=
 =?utf-8?B?U0dZa0tZM1Fwb1F1S0Z5YklLNlpuUUhLRDV1dFlZOFlNNXFzbEp6cWI1U0RJ?=
 =?utf-8?B?bm90UG13RXowd2VaaThEK245YXJGNG5MT3liZkJVMnc3eWZGYzZSTXZuekdl?=
 =?utf-8?B?bnRrcVNydFprK3dTUnBtUVRRVThHaWJRbWhtL2JnN1R5cEFZOFp2VVpsMFN2?=
 =?utf-8?B?SjBacktGUGZWYzdFaTcxUzQwWmEvMkZJcVZqKzBTTXlJVC92TS9iWENoYXBy?=
 =?utf-8?B?OWs2YmlLd2phVXB1OEdmVmtWT0ErM1ptcEFEaTlxcGpBU2prNzJ0aW9ZTlR5?=
 =?utf-8?B?VmIyR29ZaC9tYnNVdE9YUDVWQlF2RzdNZWNkVmVCUWFpck95aGNLenUwbFh2?=
 =?utf-8?B?UEEyMzBnSmZkTG9kV1Nvc2tNaGtncTloNTRRN1pyUm5sZWIxSWlOdWRsK2RR?=
 =?utf-8?B?MkVDMDYwWmxWb1RVdGtZdWJmSVRVZTJDbC9yS2NlZGEzT2VHWG12THpWQmlE?=
 =?utf-8?B?WCtoT0R6NERTUEdJMFhwOC9HaVQ3MWRuOXdCRnltOTUxWktVQzZsVndzNDhC?=
 =?utf-8?B?K1MwMGFhUHlBRjFxSVQ0N2hHOGhZNyt6VU8yR2ZWdEZwZExYdSt0SlFnYksz?=
 =?utf-8?B?QXhuZ0I5QWRtQ2ZoalB1SWNjMGNrVFNJb2F4VDBNb0cvYVFtZTlOdU5wVkVp?=
 =?utf-8?B?VDNZMVpKVVZQR1JBMEE3T0ZTeDVLanhJYVA3SjFCSERYTTVmaTZuOFVOWE1v?=
 =?utf-8?B?dy9ua2Q2dEFId2UrcStNaUJ5YlpFcldkalBBbkNmcDdTNVZramtFM1FyUEpv?=
 =?utf-8?B?L3E3cDVhQTdISmNZT3kzWUxVaFhpRXIwMHNvNFhIbDR0N20wMnhRdXcvZkU2?=
 =?utf-8?B?UGV5eDZhK1A1YkRtZGNpWURzYStoT0RMem9OaEFKa21SSnJKa1BSQWIxQ0JI?=
 =?utf-8?B?SHYvblU1UCt1UnNhM1pIRlloTE12V0NvZEcrRS9VbitnOVc0a1RVaEQrQktG?=
 =?utf-8?B?NXR1UE5tY05wbGN5aTFHUVBoTkptS2thaFV2WnZSRGpWNW83Ykl3S2ZqWjJz?=
 =?utf-8?B?OFRVTVNYb3JqY1Y2ek1UbkRYNmFBc3pWTWcrdXVKbFZVdmFwRC9RYi8ycGN4?=
 =?utf-8?B?NW9XVWUvUlBYNHJ3SGJXVTk5a0lWZ29RMWMzWnZZb0xKcmsrQ2dORGM3ejYx?=
 =?utf-8?Q?mjkyN+cLqODJh?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WnhYNnVoZlhadjBrSlZxTWxnUXpmRG04RnBWdXhteFMyWm1tQnFTSDFqS0xZ?=
 =?utf-8?B?YWxENVZRSy93R0FsR3E5YWZpVXdwNkN6MjZ2N1NXeVhGbnpwNWZGNWlrTkxB?=
 =?utf-8?B?ZEV5cHlYTFBrdHNTQjlDMVYwL2ZaQlBWbXhGcUZOa2hDTnV5TEpuZlhuSzJ3?=
 =?utf-8?B?M2c1RDhzQmNCZEhFbG9wZFpyVmFlSHgweFRaRmJ4aWUvaEthcG5iYWtWQWs0?=
 =?utf-8?B?b2lGdlJIaWVoUWNUaDNkNzFEdklzOG9GNjJwM0xGT1NQSXdhdnNVQmpMeFkr?=
 =?utf-8?B?OFByM0hSeUhQQVRSWk5OMmoyYWNGNjBYZnVXMkNoTnREMnNMWWpWb1plQUE5?=
 =?utf-8?B?T2llOVgvSSs0SnlzZFhwWEFVSS9Kc1Zoam9ob0JHMjkvMkFuVUREam9jKzI1?=
 =?utf-8?B?ekJCNUdzdFJJSmZyaDJnTEZPZnU4MEdlU2JkYTNBdTIrb2NiU1JVUTV4Z1lD?=
 =?utf-8?B?YjBqOG9ReVhCeFZTanhpV0RaT2RwdUYzd09oRjlsYzczS1ZKOHpMaXV6SXlK?=
 =?utf-8?B?ZDVmVzNudlV0ODdmcTdqR2lIdWNjQlZjZ3ZzSmF0eGZ2NUduU0VFTUlkRUVq?=
 =?utf-8?B?OFpCdlFtMXhSVEs1TjdDUTFtL2NkYVY5VnhzOVVMQUJSK3hsOW9TQlJQTHRU?=
 =?utf-8?B?Sll2NkkyOXppcDVwM0UvU2dtQTh6L2g2Z1AwT1RSTEpCWnpPa005Rk5CNHlK?=
 =?utf-8?B?NWRxMDF1V3VVaDQ4YVhyZ282aUEwMVVOMitJWktBaEU4WDd6cDBTWi9KeXN4?=
 =?utf-8?B?Wng5WGhwMTVVbUdiL04xVUJmbit3R09rN2pmditVbW9MNXpPYTdoaVVmUE84?=
 =?utf-8?B?KzJ3M0c5RmYxbnhnQUMramYwYU5OSTkzOXIzMnBWOVlTczE3S01Ib0IzSlQy?=
 =?utf-8?B?N003S0hPWS9KWXh3TEpLT1l2MHVGeTlKWXBSdUd4czF4Y3VZeGE3L0xQb28x?=
 =?utf-8?B?NUlZRmN3Rm9HK09vK2NMcTUxaUxPTUlCYlhqN3F5bU9NRVlINk1OZEZFTHR3?=
 =?utf-8?B?VkFuNFphOWQ0Nkcxa0xqTk5BbTFGYkw2bmRKWUR3ZThuUGpYUW9kbkxLTEtO?=
 =?utf-8?B?THlBMEdibUk5VkEvQXdYYlF4ZTNOVVNyVmU2cWxFRGZLaStYbXJHcUdRTWZ2?=
 =?utf-8?B?YTdJZm9rUTd1Ujg1VnF6VGNnWU1lU2ZRTnNHNWw1SXdsaHcvUlZ3WWM1aGR4?=
 =?utf-8?B?bmUza1E1WitEdzFQWUxvK25lcWRhUTZYOHFjenFOUitnbFJ3N3ZaUXg1Qjh0?=
 =?utf-8?B?WHNWQ3FNblh0OHlzMCtpNjJJZ2lUbjNVL0t0UElOWWFoa3psaDhtakZkUk5D?=
 =?utf-8?B?RWZMVVdlWXB2d0VwL2kveWlybWFzakMrMnpwZk41c09VV0xIWS9ycmRad1R4?=
 =?utf-8?B?NWJmWC9YLzJxRFRmd1Buek9seHRRaXpwUW8vK0FJZmd1Z3lEdngwNHRzNzc3?=
 =?utf-8?B?RXZJRnNqRVM4WHFZRFkrUkpPQnRKMkJja1AvVWZZMUF3akdoZTNxUHdYNXJX?=
 =?utf-8?B?UHlzWkg3ekE2THhVYWNxRjFubE82SWczZ01jTjBXUzl6cHoxUGJrVW5JL2JT?=
 =?utf-8?B?bzF3Zms4NEc4WW1ra0JIZ2xxYktGa0t5eVY3MUEyOXVxWWhKZWt1ZEJvbU1U?=
 =?utf-8?B?cG9YZTl6dW9HYmpXb2dSMGR4aU9EOVM3V0EwRVZFbGtjRy8wbkREREJrTHJQ?=
 =?utf-8?B?ajE0S2dlckJzeElyM05XVE42L0x1aXc2QzNHNFg2OE9JUmNFRjZJTWNRSDk5?=
 =?utf-8?B?SUFtRzVpQlFNK3pYa0lYWmtwVzQzOEtYMDhYa3hTdEcxTXJ2SThlbStCTmNW?=
 =?utf-8?B?cHl5bE5waTVJVmphT09ra3BRRDllbXdSdHcrUjN5VS9LMDVqdjllaytzVEc4?=
 =?utf-8?B?OTNHVkMrN0R5eXFzYUFVSFF0aUptNUgwTGlwNjgrUVBNSTNOTm5JVGozaExY?=
 =?utf-8?B?QUJEV1MwaUdQZXJ2VUtna3JWNGMzbHROSmdoUEk2d3hiU1dpOVF0RHhaL2hj?=
 =?utf-8?B?bklUa2wwS3A3VWFka0IyeUxNaUtVL3NnbUpIakpRMitaZGFJQTlYSVVtSFFT?=
 =?utf-8?B?NDNrelRvQndkQWpWMFZKWVh6Tkc1L0ZBSS91S084ci8wUDBjVTN0T3hFeW9P?=
 =?utf-8?B?QVViK01kcmlWZWNidE9iQkxVREZra1p0U3pUL0JZbTZQZzAzZDlyVFZUak9x?=
 =?utf-8?B?bUE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 6daadff3-ff9a-4abd-42af-08dd6e031b1b
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 14:16:17.7506
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E9UNGLmXdXksmkltav35jjOEyJWWpn+3Mb8Rakaspypr0uHxHyG3R9SMUPJRs1+VoY1oyIPyYSwTcugEoyWPUsLCnScep55++xDRik85mWI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8415
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 28 Mar 2025 14:16:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6675

Hi Antonin,

On 3/25/25 10:20 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Changes since 87d7341465f8 ("python3-iniparse: remove recipe") up to
> 9cd6b3ad8b9b ("cronie: Resolve build failure with GCC15") in Poky.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/migration-guides/migration-5.2.rst | 46 ++++++++++++++++++++++++
>   1 file changed, 46 insertions(+)
> 
> diff --git a/documentation/migration-guides/migration-5.2.rst b/documentation/migration-guides/migration-5.2.rst
> index c4ee3fadd..b5df4412e 100644
> --- a/documentation/migration-guides/migration-5.2.rst
> +++ b/documentation/migration-guides/migration-5.2.rst
> @@ -94,6 +94,11 @@ systemd changes
>      not for socket files).
>      Now all service files must be explicitly added to :term:`FILES`.
>   
> +-  Add ``create-log-dirs`` back to the configuration options. To enable
> +   persistent logging a user can now set the "Storage" option of
> +   ``journald.conf`` to "persistent". The ``/var/log/journal`` directory is now
> +   used for logging instead of ``/run/log``.
> +
>   Multiconfig changes
>   ~~~~~~~~~~~~~~~~~~~
>   
> @@ -151,9 +156,32 @@ c++/binutils)" </openembedded-core/commit/?id=4ccc3bc8266c>` in
>      find m4 macros, then usually the solution is to set ``EXTRA_AUTORECONF += "-I
>      path/to/m4"`` in the recipe.
>   
> +-  The :ref:`ref-classes-autotools` class now requires any recipe that inherits
> +   the class to have a ``configure`` script. The configuration script location
> +   is stored in the :term:`CONFIGURE_SCRIPT` variable. The
> +   :ref:`ref-tasks-configure` task will fail if the script is missing.
> +
> +:term:`UBOOT_ENTRYPOINT` changes
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +The :term:`UBOOT_ENTRYPOINT` variable should now be defined with a leading
> +``0x`` to its value. For example, consider the following assignment::
> +
> +   UBOOT_ENTRYPOINT ?= "20008000"
> +
> +This should now be replaced by::
> +
> +   UBOOT_ENTRYPOINT ?= "0x20008000"
> +
>   Recipe changes
>   ~~~~~~~~~~~~~~
>   
> +-  The ``libnss-mdns`` recipe is now renamed to ``avahi-libnss-mdns`` to avoid a
> +   conflict with meta-networking.
> +
> +-  :ref:`ref-classes-ptest` support for the ``valgrind`` recipe was removed, due
> +   to regressions occurring after updating Glibc to 2.41.
> +
>   Removed variables
>   ~~~~~~~~~~~~~~~~~
>   
> @@ -176,10 +204,19 @@ Removed recipes
>   The following recipes have been removed in this release:
>   
>   -  ``liburi-perl``: moved to :oe_git:`meta-perl </meta-openembedded/tree/meta-perl>`.
> +
>   -  ``python3-isodate``: moved to :oe_git:`meta-python </meta-openembedded/tree/meta-python>`.
> +
>   -  ``python3-iniparse``: removed as there are no consumers of this recipe in
>      :oe_git:`openembedded-core </openembedded-core>` or :oe_git:`meta-openembedded </meta-openembedded>`.
>   
> +-  ``blktool``: It was created in 2004 as an alternative to hdparm and never
> +   updated since (while :wikipedia:`hdparm <Hdparm>` remains in active.
> +

Missing closing parenthesis.

Cheers,
Quentin

