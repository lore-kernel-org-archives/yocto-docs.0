Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5908C021AA
	for <webhook@archiver.kernel.org>; Mon, 17 Feb 2025 12:43:09 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.66.38])
 by mx.groups.io with SMTP id smtpd.web11.50209.1739796179192696910
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Feb 2025 04:42:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=diHAusV4;
 spf=pass (domain: cherry.de, ip: 52.101.66.38, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mwus3URb89zpOKUKPdozJkjCN3KOk6hftBHOhQEq5F//QT31XdkEJnccoHOOAC8Q6t31GFuuHGt+tIGT+jnbcCI/IaLzWHj4MUlK6l4yQEW9IuBJ/WIhLQ3lhjzKvCVJeSFsSfPTi03mNewdr0wADbpba5yfu8cf/0yZiSJ5pmEHRv883VZIJMdOMV+yA/6jrXIZRuizn2Ewg3bTBRdSYbGMgPzW7lm+6h7iFaFLy881laiFcr7PTjKCB2fN3fLPO0zXQcn73l7AXuUJhf14m4wDjZ89xqQl4THF8lKszv3f5/q/C1KiEuk5VV3mB7o/VRpoON5UM/S5F9/jcvU61Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XEDkVrbCtQPg1DFLGhvTgzdewo0n6/GVoBrt9QfMmvI=;
 b=vE8UiqI548S7w3/G3r0I0FKnLyTg5PDVkQ50BdH0ddZVlPwUFqeTQd/Sgzl7GMT8WclPi9nXkTcF+vvkQ9vEfC4J+l26HjiMRtAw/jJepLaOsG7Peoj1zqxhKn0clPGLWBrwpZ6QCdNGEM4nTFzcfBt3shtSAcW231qvciVRFjpwSYgI66ExkyPEoptRAhuKtuE5CWFZ9bNRL7x0qfdy+iFttsUvirkPeIIMY2OPWA1vf0Bb6QAtXDXix3B3w9QfpjWtY9U9K0qv5HkfXT0Nf1WymXw64PZfD+0zGBbgDRiNPQf1FJjGKCN7zjjlEW6Mvsg4k3nrOKom7QI+cXOUxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XEDkVrbCtQPg1DFLGhvTgzdewo0n6/GVoBrt9QfMmvI=;
 b=diHAusV4halIWpeu6GDtJ7cHPr4kQUSatpu8Ydl4WfYHSyxm3u1XLBU1aV6AcXcTlLPgU9uOV4G2tD9OEde0sw+n4ESBCYKTSgJfZNU3j1z7yBlbWGpoqTo7IwZubaP7yrrhxz08XdaPBtVaPNadIprtmOk7BFfWg4nBAhr4V3Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PAXPR04MB9350.eurprd04.prod.outlook.com (2603:10a6:102:2b7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.17; Mon, 17 Feb
 2025 12:42:47 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8445.016; Mon, 17 Feb 2025
 12:42:47 +0000
Message-ID: <094154ae-b6cd-40db-ac06-6357da7c769c@cherry.de>
Date: Mon, 17 Feb 2025 13:42:46 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 6/6] dev-manual/multiconfig: add suggested best
 practices and baremetal sections
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mark Hatle <mark.hatle@kernel.crashing.org>
References: <20250213-multiconfig-doc-v2-0-f2bd35115cb7@bootlin.com>
 <20250213-multiconfig-doc-v2-6-f2bd35115cb7@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250213-multiconfig-doc-v2-6-f2bd35115cb7@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR2P281CA0130.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::11) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PAXPR04MB9350:EE_
X-MS-Office365-Filtering-Correlation-Id: f62eaf46-f35c-47dc-4e29-08dd4f50953e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RVlMRHF0Ynlsb29CMnJUTU9Xcm1aR210Qzg5T1ltNTJ1VlJRSGFURFRYNTRM?=
 =?utf-8?B?VXlhMzBJWjh3NmgwTjEyQnhGUE16S0hZMWl1MlNvUE9SZXF2eVB4cy9xcEl0?=
 =?utf-8?B?blRtSmNWK2ZoTG1oMHVRODIwZ2duTXUzVHRuUjRuR1NMQ050eFkrWE1YcTNn?=
 =?utf-8?B?SE5CemgwTkR4QVBRNWltRTh4SU9ob1I2c0F0MTBlWjFMc0xWaVNqMGtBUXRB?=
 =?utf-8?B?YWtkTCtUYzdLRGpjZkptMDE5RzkyNjNxK00yckNJZlNPaDN4bDBEbHdBdVQ3?=
 =?utf-8?B?N0RQOEpESnhzZWtFcTVCM2tQQlhZakRBdmVYMnE1SmlWZHNMZkg3QTUrZU92?=
 =?utf-8?B?aFUzY0NNTHZDYVFjdjZMQy80Rm1TbzlDQzF4WGNMMlh2Q3RLRXdIL0FVSjYy?=
 =?utf-8?B?WXowdDlGN29CNTJXRXpGMkRWN1A1Y2tTMVdlU0tJUFhpQkNWemx3eGlaMXB0?=
 =?utf-8?B?dWVGM0JudTArN092SFJvMmVmd0htenMvbEZUNk82SlM0TkFVS0tZdjZpZmFv?=
 =?utf-8?B?YzZJYlQ5OFR0YUJkR2tITENEcWZiR0NpeFV0QnU4Ums2KzlLQ0ZEek9mckM3?=
 =?utf-8?B?VFo4WmJSbDJHSXFoNUJnWVp2aFR3dW84Z2NBSEF0cXVmY1ZqYTc2bTFwV2NI?=
 =?utf-8?B?cXhUV01OUWhWUk84cnpCVnpFK2RVSzZ5QktuR3VNcEZaMTN1amxmeFNBc3RF?=
 =?utf-8?B?WVNQaG42disveWU5QjBOMG1vS3VJOUdUaGdPNUtzV0pNak5hMmw4QXRrNDhi?=
 =?utf-8?B?MEEvTVpKT1Z4Z0diQjhIUEhYbmkrNnFFTmZuNitxZGNjbXJXbE94eWxpMVYr?=
 =?utf-8?B?MDA1M1VxRjVUZHBqUU04SFZvNHd2UDB0MHFoRzBPc3I4UXpKRXp3cncvd1pm?=
 =?utf-8?B?dHR2TmEzMllrWDdiMTA5SFR5YW1nUUFGTnRueVJkMEFLZkoxcUNQTEM4YUp5?=
 =?utf-8?B?cGdnSGdaODJtUWIrNmY0NjBOQldHRVhhYjJWZk9nY3Bmc3VmYVVLOG12djJZ?=
 =?utf-8?B?dnJ6c2phZnNwYTM3RER2aGtBSTVlTDJBR2Jpa3cwQzlzU1hLUXd5U2xCVlZ1?=
 =?utf-8?B?SDJIVUUrVzhaWjNqazUyNlplQm93cXB3bHpUa2V4NmJiVmQzUDdxTW1xNDdE?=
 =?utf-8?B?dXc2UFU0cDJxZmRDMGxuOUJlREFBYjA2M2Z0N2lhSEtvOUhJZFVxOHI0RW04?=
 =?utf-8?B?dWV4MzhMSmZTTHJEaHBadEVncm1mNFFnRDdYbXBKaTdPSzk1TjhDTEQwb0Fz?=
 =?utf-8?B?WWxWZnZ0R1NyazFreFI5WlIxa1RGVXZnZlpZeDVHMGhJMHVYQTZzdXdhcUJt?=
 =?utf-8?B?em9SVzVzSHA4aE42RHBFMk0vSHM5di9oQnUvaTZ0bWN5ci9nS3N2Zm5hRTJ2?=
 =?utf-8?B?MFJSaFA4T3VKdHF6NHA2ZHVRSURJckJCTGZwNm1XOUJJVm5sTnhzOHhsT0tk?=
 =?utf-8?B?NWptcldPSTVQbnFJaDR1UHVtc1JJYlRkQ0Z3VDdHNjNMa0VYZENZVlZWQ2FB?=
 =?utf-8?B?Q2pSUU85TUFpUm5FR0tub1AxZzMxNWR6dmxTSlhhakl2SUp4UmFzdHJkSXlz?=
 =?utf-8?B?NFRUK211NWorcDBUVTdZQlZiejljbzNZYjl1RG1RR0hHSFZuNCtzeEZiNW94?=
 =?utf-8?B?YWpCUWpKTEg4emR6MzF5YjExelhmb3NJVDVZWjJWTDNPME5nVEhEcU1WT3VE?=
 =?utf-8?B?VllVQlFRS1duUVBIUWt0T0dOdDJCU0d0RGwwdjlMQXgvdWY1T0xkQUgyWTVl?=
 =?utf-8?B?V3phamlYM002L1VvdDRBYkdIVko4cEg3d1R6L0hoZUh6RVltZEFTdUhqRnpU?=
 =?utf-8?B?Rk1jRkwwSVJyclZxU3oxUT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZHRVYXZzYWcwUEdCN3JJMDl6bWFJbmVlUk1oM0l1V2RYWk9xbjZyOFlWYTlY?=
 =?utf-8?B?aXgyU0w0OU9ZdEprMUF1Nkg1RlBCV0FKaFFlSWZCOEFxbU94OGRxUVpYWmJ6?=
 =?utf-8?B?MDg5U0NIQjBQTlJibFdpNitvU2ZIMVZXL1p1b2I3cWdubCs4MmtlVXFJQ3Ba?=
 =?utf-8?B?WkFhOEtHd1ZpcDZvdUQ2NVE4VGRSWU03WUtQc0ppL3JIaXZaL1NjbXM5U0N4?=
 =?utf-8?B?dEZjdHNBUEFBZUo4NDVUeUZ1TnNGeEFJSTc4dzlGc2ZGOVR3WkdTSGlDTmh3?=
 =?utf-8?B?aitlK3pzeUZORW9OWFpEbmFhMEQ5OHVJQ2o3MHZFbXMxZUlmT0hGRk9TdkVQ?=
 =?utf-8?B?RU5JWGtoNWRVWUZISXV1cHgxOFUzeFFHb3ZmOTRaN255Y1pEaW8yOWtQeHpJ?=
 =?utf-8?B?cGdQdkcvRkZqNjAxZmF5NkFZTU9oMDF6S1cxQkdLVTZuWEo2M1FqREFUOUpE?=
 =?utf-8?B?N3B4RU94Ri9OWHJUbnF4M3hSWTRhbFlPQmJuZ1g2TWttOWduYm9Jb205eDB1?=
 =?utf-8?B?T2djbndIdmdMNi9qZ01tOGFNeXRsMVJMaTU5TlYwR0F5ZU90RTcxQmswRmpk?=
 =?utf-8?B?d1pFVXhKeTJOUmJ3L3BiOVNRNC80TFNXcTErUHBPdjhRMTJQUXc0cmhyeGJU?=
 =?utf-8?B?NVk3cTJiMlJXTXRmVktNeVBaYWZSWHFVQ2ZlNjdLbi83TmhNRWk5OHlvQVlo?=
 =?utf-8?B?VSs5cHErS2FMZUxYTy93RVJUV2hGWlRmWFdPdzJEdGtTOEFweGZ2Sk5mcGxo?=
 =?utf-8?B?YmtOY0c3S3dlYWdTQmxkMHhUaDNGUGhNV3FOUXY4eUZKZG9WbmllcFo4WEYr?=
 =?utf-8?B?M1VaUitlWitkbFRwQittWTRPYm0xRlVUL040b0NWMkkrMDA2YnRXRnlQa294?=
 =?utf-8?B?UXFzOXN0WjhsU2t5OWxVQWhpTlo1UVYrWTNxcFA1OHB6QVFqUWo5NzZLVFgv?=
 =?utf-8?B?akxNQzNmVmY1ZFNVUlllYTBCQ0NMdGRWTDFkVjVZcCsveUVxTDA0MmVCRjN1?=
 =?utf-8?B?NWZ4OU1iTDY1TW5NK2dGdXl2RnNxK0JIRDcrNVVFM3Z1QldISEtyK3NjQnBI?=
 =?utf-8?B?cjlGRjgrN1Yxb2Npa2lrYkNKL1Z1NHZoUGh4amIxTVMxajE1ZlVxaURDdzZZ?=
 =?utf-8?B?aHBnam9RMXVRK2ZBMEdvYzVLUHcrUHZHeTdOdVUyTGNrdERFRXFvM09jM3gw?=
 =?utf-8?B?b0o4V2RSNElSS2NsOWxzRVJ3bURnNlJnMk5uSmxnWjBZU3ZlK0VyR2NUMmp4?=
 =?utf-8?B?VnQ5ZUFpYVhVSy8wcExKVDlqRUpMQ3lKaHZzTC95alAyZnAxSUo2VDZ0Y29D?=
 =?utf-8?B?TkszZ21nWXNRbHdDN2s0dGdxM3VydUlmM0N6b1BmV241TDNrM0ZiVG1XZUVN?=
 =?utf-8?B?T2RWaHVNRy8za2M4b1RuWS9sTDRZWmxrVzEyWHAxWVpMQzU2WFZ6blczZUdT?=
 =?utf-8?B?cVU3anNNNFRCcUlkM0M5c1R3bXZFMVAxdGZpQXNwekM1ckJjQWdGZk9qRTNw?=
 =?utf-8?B?MG1oTWZyWU8vWHpVL1BwNldaS2NhQm9vQ1B3VndmZUFaeXFvZEUzUHVJdjBn?=
 =?utf-8?B?Q0lpdkJrNmJUeDZIZUVVVzNEZ0ZtMzVPS0FoclJZbkNmaFMvNitjcFZCTnli?=
 =?utf-8?B?aENrdXgrWVJWdUxhRUZWY1o1T1ZRYWhHU2dxL3djamwzY1Z2cTN3NTQ2SnAz?=
 =?utf-8?B?L0tpRy9Db0VSWi9vblBrK1FCaDZKU1c3eXpaTFlMbXV3SXdZbkZVRVV6bEU5?=
 =?utf-8?B?OXd6cWV6MXRtNG9Md0NMRDFnL2Z1Z2pta1VNR1FCTWZOV1JqREVDZ0hxUmR6?=
 =?utf-8?B?ZHRsUkpKaUVpeGI4NEgzcDNQUHRiemhhZjBpdHVTYXAyaW1VOEliWTJMV0Fa?=
 =?utf-8?B?UXAvSThvQUdDaHBTdVlNWWlKTTkxb3hkRmxKRUcyQ256Vzk3bUZpalAyKzlh?=
 =?utf-8?B?Q3dEVnZDT2NjTHowdGZhN3dmWERheWlmdlQ2UmxYdEYxd2xpeDBjNnFLaHhP?=
 =?utf-8?B?MW9sOCtNZ0NpVGUxaHdQWTcrRWxISkNiWG1rS2psOWNPeDAzSisvUHBYc2d5?=
 =?utf-8?B?SlZ3WXdLZlNhTmt4a1pYZkZHR3F6MVFoK1RhUjhYOEU4d2Zrd25ZN0VqZXNy?=
 =?utf-8?B?dU9iZS9wdUFncHpWM3FveW1pZzdtODV4UTc0YlRaUDlDRmw0V3hxWTBIc09Y?=
 =?utf-8?B?K3c9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: f62eaf46-f35c-47dc-4e29-08dd4f50953e
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2025 12:42:47.7654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: twHE1YwNUqQ/DiwhdC8vR4IBZwv+tM7H4JOm/v2KJPkIIsZPpHjw4v9hrNG2Xn0JSWC5ngDNqIbgF85YMJXyCfDiJFe1ZumYrSJ53Yq+0ao=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9350
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 17 Feb 2025 12:43:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6387

Hi Antonin,

On 2/13/25 9:23 AM, Antonin Godard via lists.yoctoproject.org wrote:
> After the suggestions from Mark Hatle on the list
> (https://lists.yoctoproject.org/g/docs/topic/110487932), add two
> sections to the multiconfig doc:
> 
> - Suggested best practices: suggestion for better design of multiconfig
>    builds.
> 
> - Common use case: baremetal build.
> 
>    This section applies the guidelines from the first sections and apply
>    it to a real-life example of how to use multiconfig. This one to build
>    some baremetal firmware alongside a regular Linux build.
> 
> Suggested-by: Mark Hatle <mark.hatle@kernel.crashing.org>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/dev-manual/multiconfig.rst | 136 +++++++++++++++++++++++++++++++
>   1 file changed, 136 insertions(+)
> 
> diff --git a/documentation/dev-manual/multiconfig.rst b/documentation/dev-manual/multiconfig.rst
> index 49e32b04a..cdf06d2ca 100644
> --- a/documentation/dev-manual/multiconfig.rst
> +++ b/documentation/dev-manual/multiconfig.rst
> @@ -171,3 +171,139 @@ and have separate configuration files, BitBake places the artifacts for
>   each build in the respective temporary build directories (i.e.
>   :term:`TMPDIR`).
>   
> +Suggested best practices
> +========================
> +
> +-  :term:`TMPDIR` (other than the default set in bitbake.conf) is only set in
> +   ``local.conf`` by the user. This means that we should **not** manipulate
> +   :term:`TMPDIR` in any way within the Machine or Distro :term:`configuration
> +   file`.
> +
> +-  A multiconfig should specify a :term:`TMPDIR`, and should specify it by
> +   appending the multiconfig name via :term:`BB_CURRENT_MC`.

s/via/with/

> +
> +-  Recipes that are used to transfer the output from a multiconfig build to
> +   another should use ``do_task[mcdepends]`` to trigger the build of the
> +   component, and then transfer the item to the current configuration in
> +   :ref:`ref-tasks-install` and :ref:`ref-tasks-deploy`, assuming the value of
> +   the deployed item based on :term:`TMPDIR`.
> +
> +   The :ref:`ref-tasks-install` and :ref:`ref-tasks-deploy` tasks should look
> +   like this::
> +
> +      do_install() {
> +          install -m 0644 ${TMPDIR}-<multiconfig>/tmp/deploy/images/<machine>/somefile ${D}/some/path
> +      }
> +
> +      do_deploy() {
> +          install -m 0644 ${TMPDIR}-<multiconfig>/tmp/deploy/images/<machine>/somefile ${DEPLOYDIR}/somefile
> +      }
> +
> +   In the examples above:
> +

s/examples/example/

> +   -  ``<multiconfig>`` is the multiconfig name as set by the multiconfig
> +      :term:`configuration file` (see the :ref:`dev-manual/multiconfig:Setting
> +      Up and Running a Multiple Configuration Build` section above).
> +
> +   -  ``<machine>`` must be the :term:`MACHINE` for which ``somefile`` was built
> +      and deployed. This value depends on whether the multiconfig
> +      :term:`configuration file` is overriding the :term:`MACHINE` value or not.
> +

I can suggest:

"""
This value may differ from the current :term:`MACHINE` if the 
multiconfig :term:`configuration file` overrides it.
"""

> +-  Firmware recipes can set the :term:`INHIBIT_DEFAULT_DEPS` variable to ``1``
> +   if they don't rely on default dependencies such as the standard C library.
> +
> +Common use case: building baremetal firmware alongside a Linux build
> +====================================================================
> +
> +A common use for multiconfig is to use the default configuration as the regular

s/use/use case/ ?

> +Linux build, while one or more multiconfigs can be used to build special
> +components, such as baremetal firmware. It would also apply to a scenario where
> +a microcontroller, for example, is companion to a main processor where Linux is
> +running. This section details how one can achieve these kinds of scenarios with
> +a multiconfig build.
> +
> +Adding a multiconfig configuration file and recipe for a baremetal firmware
> +---------------------------------------------------------------------------
> +
> +As described in :ref:`dev-manual/multiconfig:Setting Up and Running a Multiple
> +Configuration Build`, each multiconfig will require a separate
> +:term:`Configuration File`. In our case, we will make a separate temporary
> +directory for our baremetal firmware build configuration.
> +

Mmmm not sure what "separate temporary directory" should mean here? Are 
you talking about the conf/multiconfig/ directory or TMPDIR?

> +For example, we will define a new ``conf/multiconfig/baremetal-firmware.conf``
> +as follows::
> +
> +   TMPDIR .= "-${BB_CURRENT_MC}"
> +   TCLIBC = "newlib"
> +
> +The ``baremetal-firmware.conf`` configure a separate :term:`TMPDIR` for holding

s/configure/configures/

> +binaries compiled with the `newlib <https://sourceware.org/newlib/>`__ toolchain
> +(see :term:`TCLIBC`).
> +
> +.. note::
> +
> +   Here, the default :term:`MACHINE` is not overriden by the multiconfig

s/overriden/overridden/

> +   configuration file. As a consequence, the architecture of the built baremetal
> +   binaries will be the same. In other cases, where the firmware runs on a

s/the same/the same as the one for the Linux build/

> +   completely different architecture, the :term:`MACHINE` may be overriden.

s/may/must/

s/overriden/overridden/

> +
> +We then create a recipe ``my-firmware.bb`` that defines how the baremetal
> +firmware is built. The recipe should contain enough information for the
> +:term:`OpenEmbedded build system` to properly compile the firmware with our
> +toolchain. The building tasks may vary depending on the nature of the firmware.
> +However, the recipe should define a :ref:`ref-classes-deploy` task that deploys
> +the output into the :term:`DEPLOYDIR` directory. We will consider in the
> +following that the file is named ``my-firmware.elf``.
> +
> +Building the firmware
> +---------------------
> +
> +The firmware can be built with BitBake with the following command::
> +
> +   $ bitbake mc:baremetal-firmware:my-firmware
> +
> +However, we would prefer for ``my-firmware`` to be automatically built when
> +triggering a normal Linux build.
> +
> +Using an ``mcdepend``, a recipe belonging to the Linux build can trigger the

I read mcdepend as multiconfigdepend or macdepend, and not 
em-see-depend. So I would use "a" and not "an" but no strong opinion.

> +build of ``my-firmware``. For example, let's consider that our Linux build needs
> +to assemble a "special" firmware that uses the output of our ``my-firmware``
> +recipe - let's call it ``my-parent-firmware.bb``. Then, we should specify this
> +dependency in ``my-parent-firmware.bb`` with::
> +
> +   do_compile[mcdepends] = "mc::baremetal-firmware:my-firmware:do_deploy"
> +
> +The above will ensure that when the :ref:`ref-tasks-compile` task of
> +``my-parent-firmware`` is triggered, the :ref:`ref-tasks-deploy` task of
> +``my-firmware`` will already have run successfully.
> +
> +Using the output of ``my-firmware``
> +-----------------------------------
> +
> +After we have deployed ``my-firmware`` by using ``mcdepends``, we need to use

I can suggest:

"""
After ``my-firmware`` recipe has deployed `my-firmware.elf`, we need to use
"""

otherwise it may imply that mcdepends it what deployed my-firmware which 
isn't the case, it just made sure my-firmware:do_deploy is finished 
before my-parent-firmware:do_compile starts.

> +the output in some way. We can make a series of assumptions, based on the
> +default Yocto Project variables in order to get the binary for packaging.
> +
> +First, we can set the following in ``my-parent-firmware.bb``::
> +
> +   FIRMWARE_FILE ??= "${TMPDIR}-baremetal-firmware/deploy/images/<machine>/my-firmware.elf"
> +   FIRMWARE_FILE[vardepsexclude] += "TMPDIR"
> +
> +The first assignment stores the value of the path to the firmware built and
> +deployed by the ``my-firmware.bb`` recipe. The second assignment excludes the
> +:term:`TMPDIR` variable from being part of ``FIRMWARE_FILE``'s dependencies -

Michael really wanted to use em-dashes, so maybe use it here?

i.e.

---

c.f. c29a1bf4dd52 ("profile-manual: usage.rst: formatting fixes")

Cheers,
Quentin

