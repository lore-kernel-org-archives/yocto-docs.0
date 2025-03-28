Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C52DC36011
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 13:58:27 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.42])
 by mx.groups.io with SMTP id smtpd.web10.11867.1743170300517275318
 for <docs@lists.yoctoproject.org>;
 Fri, 28 Mar 2025 06:58:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=lne8mbTO;
 spf=pass (domain: cherry.de, ip: 40.107.105.42, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rY4FSA0QajqtCoF3YQmLDQQiMNsjn70sDF7xAeSZO45qv6lJOisnj/Q5MZqMucB3DzoxKd4CEHj6GCVXdlVuAP6FrigsVdDfEVwHgzQEfFpP7QtWVGVwDFxSSqQFhJfXTFuepeb/9MAvLgq3vNcdc+hNYz4gH2AtwdHmUPua2okeXMpxOXGVsvO4TYVpTVVwaS1LrztN4JbQ/Y6sAS6he7TK8cdQolhu+qzDk+ccSsEfqMs58sJFPOMNvf7vdidz4cz1dKQfF7ow2Mg2OihDMu5iji0rmIEmnNzU3c6n2Fj5kNV1NSAtLdUiD8zYwSyyXebrNTtqaJuIqX/EoVB73A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TUjEhZc+0rTS49JvUJ++uas1itAX86kn/+cip6NelQ4=;
 b=YuRbuFamjh7jCxgdiC8mGG7OzUHHgtayJINXPg30WcfnD4+X8vZdAN08tBzRMrEaZq/LwPh8RWFMyp0uChoAvB+c2IWGB1nnBTxEtJFAoM7vt5irod27SOyzgnkFolDoCZv34dSxkXkaCamlQODoRkYZWEAdRQGkU3kU/JFRfjOfiKyscKKV3xWZxbWELnBFSs0NmpYyEEG/xrnKme6c+QiQc5eLyjQiooNkc8fX+XGbkhdZWYH43of3LBlLkVRpJT7O9Oqt7mOK0I7MbkNXEsE3i9erErtbo8unqZ+S502V8SzOCmrx9MrVz/LtuoEvivo/7nmz/6z5VnNsImrnSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TUjEhZc+0rTS49JvUJ++uas1itAX86kn/+cip6NelQ4=;
 b=lne8mbTOppd0hXvmZcvxQx2mhUUg3T5KixRKJ7LGcOEI/rdWEdtq1TUPBIQ6AJfncLLgUzsnabert+V7Kiw/PhwTfev7wLDoUSMVr0DsM7wF3+MS3OFlvEUGRmXaM3+A+MJoT+uGR+7YJXiOW2eWJUzXBLPp4K+MJsFtFnGfgPs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS8PR04MB8562.eurprd04.prod.outlook.com (2603:10a6:20b:421::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 13:58:16 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 13:58:16 +0000
Message-ID: <d4c01a9b-fdb1-4f83-8ff1-1ac55f0db1fd@cherry.de>
Date: Fri, 28 Mar 2025 14:58:15 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 01/12] ref-manual/classes.rst: document the
 ptest-python-pytest class and variables
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250325-release-note-5-2-updates-v2-0-19f050d61da3@bootlin.com>
 <20250325-release-note-5-2-updates-v2-1-19f050d61da3@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250325-release-note-5-2-updates-v2-1-19f050d61da3@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR3P281CA0013.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::18) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS8PR04MB8562:EE_
X-MS-Office365-Filtering-Correlation-Id: 6994fef9-40e4-45ef-040b-08dd6e0096b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?aFFXbWUxTHJPTkFEVEV0MUI5d2FpRGxIbWF3QVRTUXhQekUrS2dtV1JKWmpZ?=
 =?utf-8?B?SGlvcUFxYjdiUHVnOGZ1R1o4Qlg5Q2tkYzFrMSt4bnE3RjhHd0ExOGMzbDZ6?=
 =?utf-8?B?V29VcnY4L0UveS9ua1FQUjRZNWM5dzFRbzY4NFNRSDVkcjBsTDNRSTlnNzJP?=
 =?utf-8?B?bGRVaGNSS3gyVU45SVVhVUNTeWJUNHZoUHlSSGZOMWxuK2ZRSmJJKzRVMlNO?=
 =?utf-8?B?cEUyMVFqaXhOaFZ3alE2aWpVTm1LVVZIVlVLYlA3NWw1UGdsNlNNQWJOcGwy?=
 =?utf-8?B?RVpsWGNaRHZlRDdGU2pDbDlhZEljS05ubStpam53alNwd0o5UlpkRFQ3cE0z?=
 =?utf-8?B?NElhUHc2cXQ5Ynp0aExaZTBnR1k4QWNyL2lTb3liRlppMjVvOFhnS3lZajNw?=
 =?utf-8?B?QndpcG5ZTlZtcU1GTTlNYkc3Yk5RL3JTSVc1ak9JVVgrL1ZVaTd4eDAra3dV?=
 =?utf-8?B?TGFPV2lOR21aSG42TjA4bUNlaDZFdHJLTmVnTHVveGRRc0xmS1JHUlpxaDBh?=
 =?utf-8?B?NVh4RUV5N2kwSXlmZEhRTlh5MEhQSnFFVkFMS2xxNDVSL2lnQ0x4WndzRGxj?=
 =?utf-8?B?NnNXcFVqZHk2dmh5aVFWZWtKbVdiS0VVeXNXQUNOc0dleU01MWVEVXhMVXlU?=
 =?utf-8?B?OGhJYmFpaHVTMlJoODBhczNhdHJQY1RHUmpLLzVNMjl0ZTdtbzJpaGN5Yk0z?=
 =?utf-8?B?NWNybFNzbmQyN1JnSVpVanhmY2pyY1dHdHZlS2dVUVpjeFZKSG9DaWU1bGo4?=
 =?utf-8?B?YzcyLzEyL0VtR3N5REZ3UytlT3ltaGlNQlJMeW9RdlNvRmxSUkJMNjRyUDVn?=
 =?utf-8?B?MExYaFpBRnVIT0IrM0tmamxvbkhjM0hEUnd2UnhrUE1vbGNJUW0xNnkxMHZl?=
 =?utf-8?B?WnhDalFrTVFJalBsbUJEMHA3eG4wNDlyMzhQUnlSWlVVeUFHZDRWN281d0VW?=
 =?utf-8?B?bmEzM05zcThscjIxUS9WTTVUVUcvOElqdzgyZG5hUFVzbWU0SENEMW5GMlB6?=
 =?utf-8?B?SVd5N0xGWXNPblVkSUZ5bkRHR0JDTG1FcjJOT04xdnRFQWd3Snd6dGhhZkpr?=
 =?utf-8?B?Y0grWm9LSU9ON1VleEowSTNNbDY5Tzh0WVVCUTN0dkNWN3hJZ2VaVG5jUUcw?=
 =?utf-8?B?cjFYM3ZGMnRCYnRtbUZ0bjR3eGVsaWY4TDR3YXNVbjA3WUVreE9ySitJa0dl?=
 =?utf-8?B?ck5yNkNrUlFSdUxqdjNxTk1VNXhuVExBWk45dW9rWUNJaDVET0ZDWi9FSVRG?=
 =?utf-8?B?NE5VSmx4Z1lFdE5BR1ptVVN1bHJGMlNnWm1aM05mTUxuODJPTzRWR2ZsK2tw?=
 =?utf-8?B?Wk9KSzF4eEgrRHB2N283dWI5QTFUMFZkL0Y0R2xBQ3E0Uy9HVlhrRjF0b3ZD?=
 =?utf-8?B?ZkRZRU5JS1pJMGkvRTNkamdKRFRwRWQ1dDJTM1BRbVRER0QzWFBoOUh2Um4r?=
 =?utf-8?B?NWxuRmpxdVV5UHZQZGhESkVIMlhvZllpUnYxNVQ1NlY1cU9KeUlaMEhiTHFp?=
 =?utf-8?B?Nm41NklNME5LSU8ydFdGMWdJL21FaHArdHMzNWRlOEh6dzBBVS9MV20vZDVn?=
 =?utf-8?B?SGJxYnBwcnR5MWMrT3k1YzZ5Y0JCbzVmL0lOWjBZSHMya0pVVFphMUs1ZDNx?=
 =?utf-8?B?a1c1SlZrMENxeWJURm1wbFBxTlM2aXJ2Z3U3OGZmL1dDcmYxeHdsZlZFeFYx?=
 =?utf-8?B?VWtDREpGcS9HdmxsUWRjbnovSGJkbHQrdVZDN3BSZi9zQ01Pa2xPUDFUd2xm?=
 =?utf-8?Q?INxeSMpXpI8Jpf7WbZuIASAU3WQQ5i/jNuNmTUD?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MENYYWVsYW5jMkNIVWtYam9yVmFKTEJJZGV4K2orSFRnZG5xeWdZckxZL1Nt?=
 =?utf-8?B?RmI4MndZbnRnUDhLdjBTTkNqT2hXQWpXYUJIRFJPOWlyUjFmQ2xtN2hPQ2l1?=
 =?utf-8?B?RVZITzY1akIwYnc3RDI5V1lGKzRFb2R0a0Y4S0JWTHVHZW0zcmd0UHc4Wndx?=
 =?utf-8?B?a2pMeGpwV29PYU5CU2tlWVkya3JpSW9NUW1vMENXNGpCSjdIV2Z6L1Q0WEdQ?=
 =?utf-8?B?RitCekIyM3V4SzNJWG5uQ3ExYXE2MWdndHRiQWdSUjNTQ2NWQ1lvQUdFSExH?=
 =?utf-8?B?d0VuQmY1cG1vUjZtQ1A1VE9ud0NpK3MvR3Q0Q0EwWHdBRHNOQ3hJVldscjd3?=
 =?utf-8?B?TVdEcG5WbGNVajVJcUJNMStuZ1hSL0VyVWRkZ1hBK005MCtGSlJWcjRISmFI?=
 =?utf-8?B?REVSVDVDODBRODNwUmc4R2VmTElUN05YalVEb0FDbUk3WUZJY2VXZThNa25Q?=
 =?utf-8?B?V08xdy82d3VURmFhM3QwQnhIeHZyV1c2UExBaDV1WURKK3l3ZENvRStSVTQz?=
 =?utf-8?B?b0hYazZPRzBwK1lGL3g2V3FDZW4xcXBCV0U1Z2hXNWFSSjJSQUpsUGVDeW93?=
 =?utf-8?B?K0ZMSFhtek55UFk5VFVBbjliU1NwbENmK2hHeWlKclNKV1MzSGxQdlAreUd4?=
 =?utf-8?B?TUN6dGNWNjRNRU5hZGdTK3dyVjBqTU5wSFBTRXl5REhsaVNGSlRNYkRPdFFB?=
 =?utf-8?B?bW9OaXBaM1NXbTY2S0FacEQyMmhJeFJDSVJlNFdBL1lMeU9SenNhWHNqSkNR?=
 =?utf-8?B?dnZXTTBkd1g5Nis1L0g4NjJZdlVNRDN3bWluNks3dm5nc3R2dE55NCs4alUz?=
 =?utf-8?B?aUtnU3JjaitUTGY1eU1rN09qSE1VMmt6VEtNekQxU21rQ0Z3N3VZU1FvY3dN?=
 =?utf-8?B?cklkdlc5ci80VDBFM3A3ZHZrQmlhYU9kTzZ6VTdycitaUXlQYmVQUlpJR3Fz?=
 =?utf-8?B?cTRqbFZxR3gyOXlXV29QRG14aXEvd2hQZ2J3cmdWa0JQbWpSWmJxNXRDbkly?=
 =?utf-8?B?UlJTU0cvL0RhUGZTMHJ5OHJlR3hDZk9FQzlydm5ZVCtoV05RbkFKUWlDODli?=
 =?utf-8?B?bHVFeTM1M1Z2anNrbno2V2tSbTFDbERldmNkbHVrUURiRjk3OGRXYVdFZjNv?=
 =?utf-8?B?TzhWbU1GWlQza2ExSXpBQnRKcVdBUDA0dzhCWGRXWW55VTRFaXJMT0lCVWdT?=
 =?utf-8?B?VGxGak5BTGdPUU9WR3Z0U1QrMUZNOWJ4MVNxYldEcklnVFJtZ0NQTzgrdmZy?=
 =?utf-8?B?a2EzQ2ZsM01Qa2RQNTdFWHoyTWFpRml5YjAyN29ZMzNCMVAyaWIvTUIwTHdT?=
 =?utf-8?B?RDQ5SzkzRzA0cVJoa1NRYUd5bXo0RDN3NEQwcFFkSkZia0FWa25UWDloK1My?=
 =?utf-8?B?c2RtWnFNbDAwWlI5b29MZVEyOUNtRmlMbEc4bUp6Qmx5aG1lbm9nWVRmUzNz?=
 =?utf-8?B?MHJRb2FWOWNsR0IybUZhWFRXWGNRQVNmZi8xRWx4b0F6RVVpQ2NZSU93bzBG?=
 =?utf-8?B?bldpRG5weWo1RTVLbU1TTTBHSVYvWUNVb205TkpyZVhScUc5ZXdLSCt6YWRE?=
 =?utf-8?B?T3ZqRnZORXUvQmg1M2FNVzhkeE5PMzF3dzdqQUNKQUtYblNJMDdSRnBUK1k1?=
 =?utf-8?B?YlJwSnpLTUxoVlhFZmlRNzVNQkUyalZZaVdNWUVYVkNQSnpqRmxtSmlzRFY3?=
 =?utf-8?B?c3laWElaRjcxc3JWMVk2MlNJd2JHYXJhMUxkVlF5b0cwZzd2bFBqdlRPUldI?=
 =?utf-8?B?N2ZoRFkwT2xEeEJyZHU5SlRGS28wdHhYZHVwSjR6UWJ5VERIdW5IQ2dtR0xv?=
 =?utf-8?B?WkRnemQvR3ZtVmZVSHc2YnpqbTB1aXplYTVXUmZJdnN2RVY4L0xaOCtwcWtB?=
 =?utf-8?B?RkpYUXg2RWJ0YnRLNnNKc1g3eU10TXNNSnFuSWZVK3ZKQ0FVRTJKbzl4d2hF?=
 =?utf-8?B?TnlKMWEwcWhVaVFoMzV1TTQxU0pvS2VhRzh1UDdacjd2Vm5zYUxRVU00djRa?=
 =?utf-8?B?a01WblVCL2h2OVM3WHAxUlRtSDdFWTJjU3JZUjdIOFJPNGh4ZXZ6RDJ3dkov?=
 =?utf-8?B?U1hGbGI4YU83N0hIdHlLT0tmOWxzS2VacHpNQmNJcmE5TWpvRTZOdklnNE84?=
 =?utf-8?B?d20vbEJ4VFEyc2c5WEhVN0xGanQxZloyZTdEaXlnTmQyUXNpdTdNSEV1ZDV1?=
 =?utf-8?B?VHc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 6994fef9-40e4-45ef-040b-08dd6e0096b9
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 13:58:16.6138
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XVaxkdLYT0E3loY7/0tlF11kE8WACIksPkgdDfA/19a+MEH8MiXpuoYY/NufrWg2BqWs5knCEMJ6Fark9KiLYYpsit1afzCPBgcJbB994U0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8562
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 28 Mar 2025 13:58:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6670

Hi Antonin,

On 3/25/25 10:20 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Add documentation for the ptest-python-pytest class, and the
> PTEST_PYTEST_DIR variable which can be overriden.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/ref-manual/classes.rst   | 15 +++++++++++++++
>   documentation/ref-manual/variables.rst | 10 ++++++++++
>   2 files changed, 25 insertions(+)
> 
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> index 6797927fe..8b930fe3d 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -2707,6 +2707,21 @@ For information on setting up and running ptests, see the
>   ":ref:`test-manual/ptest:testing packages with ptest`"
>   section in the Yocto Project Development Tasks Manual.
>   
> +.. _ref-classes-ptest-python-pytest:
> +
> +``ptest-python-pytest``
> +=======================
> +
> +The :ref:`ref-classes-ptest-python-pytest` class can be used in Python-based

s/used/inherited/ ?

> +recipes to automatically configure the :ref:`ref-classes-ptest` class for Python
> +packages leveraging the `pytest <https://docs.pytest.org/>`__ unit test framework.
> +
> +Within the recipe, the :term:`PTEST_PYTEST_DIR` variable can be overridden to
> +specify the path to the directory containing the tests (default value:
> +``tests``). Test contained in this directory are installed in :term:`D` by the

"""
Within the recipe, the :term:`PTEST_PYTEST_DIR` variable specifies the 
path to the directory containing the tests that will be installed in 
:term:`D` by the [...].
"""

1) Try to avoid having a default in multiple locations in the docs, so 
we only need to change it in one place if it ever changes.
2) No need to say overridden, it's a variable, it's implied it can be 
overridden.

> +:ref:`ref-tasks-install_ptest_base` task, as well as a specific ``run-ptest``
> +script for this task.
> +
>   .. _ref-classes-python3-dir:
>   
>   ``python3-dir``
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 41bda5d0d..8e0833bff 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -7110,6 +7110,16 @@ system and gives an overview of their function and contents.
>         at build time should be done by adding "ptest" to (or removing it
>         from) :term:`DISTRO_FEATURES`.
>   
> +   :term:`PTEST_PYTEST_DIR`
> +      Within the :ref:`ref-classes-ptest-python-pytest` class, the
> +      :term:`PTEST_PYTEST_DIR` variable represents the path within the source
> +      tree of a Python package holding the unit tests to be tested with the

s/tested/run/ ?

Looks good otherwise.

Cheers,
Quentin

