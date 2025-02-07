Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04B92C02192
	for <webhook@archiver.kernel.org>; Fri,  7 Feb 2025 08:54:01 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.78])
 by mx.groups.io with SMTP id smtpd.web10.65041.1738918437961605508
 for <docs@lists.yoctoproject.org>;
 Fri, 07 Feb 2025 00:53:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=ZcQIdE8j;
 spf=pass (domain: cherry.de, ip: 40.107.105.78, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RLvE5xMt9OogRNlgFpqw45lb2n/hQIskdeR64PbGiMPEJ7jIqUKTfd6qdh5z9onXXZOsgzJohRdmul1a1K83uKdZ1F1TFiehVDSJKbzBK/lGcmTh+zE4qv5nLq8Fk5AootqspdNC1MwF9nNoluzDuCMt6SPjpgkJwXh4NSiSAeMXB+FZ0P/PEsxH6RaVyFKC32yH1aj/cd4ZbTlmT4PLyJaO1Oc7dZhw6A9tuSdqrSTI9iwt49BH8fJEwzIMI9rYn4934hUCoHLnAu2wLZbRQ6Na+JjUUIdempIhyBsZZqFoN/8umYTZKz7tESy2ccYeKHBS+eBIW+eHDN72MAUJ/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xtLQmUBss/4t7YLZpQt8xbd3HWa5oNsP3o9v085ugAw=;
 b=m1BMHeWqDQqI9DTYVwmvLufvU11hjZ7sN0B7wenCwpDqeu/VKcCXX7Be6/3VlmrjD29c1tJYGHe1yia62xc2wiPliRHqFxHCV+cZIf50fC4YIBbtGcYsHdBXlRLgv5j5tlhaO5uMzW50om9mtJrzOWnwBU0n1odbtmHDQrk1ud7TM4WwQ54IZgSXztaCke8SLmoUmpWPGIxVEu0nKPcdFPviY9Ftav1hEa1ZxP4e31Xg3tRsiHAR+Et/qncH59LxmU5YtvwMD2APO9J1Il+UBOy+j1ze+gVOP24izNK0a7kEzgMolO3Z1gt83XGLQmMmbnf9F9n0yTu8r+0nvdva5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xtLQmUBss/4t7YLZpQt8xbd3HWa5oNsP3o9v085ugAw=;
 b=ZcQIdE8jFmc3fmNy2cBPHNERydpfmjMG7riX7DjVdHulrM1cNODWpTzcAQW74aAqtXoqGvKd1tmkZf4Xkk2wChPHfEZUMvcWygc39+IDk0phxV8EyTdxyZhv+Rk1rhGxJABdSI9kk68NqPLDzNqplbX433bKqZQITn89J4NU4cg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DB9PR04MB9792.eurprd04.prod.outlook.com (2603:10a6:10:4c2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Fri, 7 Feb
 2025 08:53:54 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8398.021; Fri, 7 Feb 2025
 08:53:54 +0000
Message-ID: <6aa53e6c-a08e-4021-8da2-a14cf47afc28@cherry.de>
Date: Fri, 7 Feb 2025 09:53:52 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 1/3] ref-manual/variables: document
 OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS
To: yoann.congal@smile.fr, docs@lists.yoctoproject.org
Cc: Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
References: <20250206215711.154194-1-yoann.congal@smile.fr>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250206215711.154194-1-yoann.congal@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P195CA0055.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:5a::44) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DB9PR04MB9792:EE_
X-MS-Office365-Filtering-Correlation-Id: b165f39a-ad28-41de-504d-08dd4754f346
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|10070799003|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ekN5bnI4UnVRVHVLejdtWjVqWXFUSlZiUXlKZUlYbFlqRnFTRVN5VjFnMzhE?=
 =?utf-8?B?cUJDcVJ3dkhWdy83eGYzRGZ5dVhQUnhUdjdJVGd2d2VhTDE2YTE4VHkvTEE4?=
 =?utf-8?B?UkRVNTF2YnhTa0dMSnhhTjZzVE1IdGNvUUc4N1Z0dHZZVmVqcDE1MjBJL2lS?=
 =?utf-8?B?TjhwVDZvZFIyNHB1cDA2U2dBcE9lS2N5dVIwRWRSOHJNRTBkMkxXSklSSnJ0?=
 =?utf-8?B?cU1iMFZHK2VtMGhEU0NEdWdXVitLRGFpTFF3QmJMU3Z2Z3JzMVFYUFJodXh3?=
 =?utf-8?B?RzNodUlMaS9qSURXQ21FaCticThMMjFwcVBwanU1TmxMQnRuMWFtWUdscDdv?=
 =?utf-8?B?ZHo1UDZIeWZpbEs5d0RKNGxEMVdMbkEyaDRiVld3U2hvM0lwSiszS3I4bktL?=
 =?utf-8?B?M3dCenMxNVpjdGd5QTNXUnlsdG1CZloyMVhFYkR5aEs4YUxYRkVobGorbjdQ?=
 =?utf-8?B?eCtMMDVyZUV0WUd6M2NjNGh4VnkwVHJpSnZFNjluQXBaR2tlK1BmdGN0Tkty?=
 =?utf-8?B?czlwUjdVUWQ1WTlXcEFrWDB1TUtYMnlMYXZ4WW5JbXVLc29PMGVKMVl3SVFS?=
 =?utf-8?B?Y1IwTUYvS3I5UEU0M241ejV3VWVyclI3RTcwZTc3MmZmQXBvYnI3N3hIbFRu?=
 =?utf-8?B?cklNQlZodnRLWVdZNi9DNitmQ1BlUVpWeDBlRTA0K3R3RVdiVzFBRFM1VEVr?=
 =?utf-8?B?ZVAyM2ZpQkxhMkNScXBkUXZFTVI2Z2xtTkdkTkVCMXVhZm93Y2pOT3crQVNF?=
 =?utf-8?B?cEdHVFdicWNqamMvUHBKb3M2QU9MTEp5a09Ea01pWk1GTEkvNHRENkRzYlNU?=
 =?utf-8?B?SkFSOWFCZzZIdnNDQjJDcVYxV0h5c3FwK1Z4eU1YRmRnMGd6WWxETjByR3g5?=
 =?utf-8?B?TzFydFZnUFA0TWhvY1pjVFplYUNGTzFSRmhYQlpyb2Z1eXBwUEJwM2R5UmZR?=
 =?utf-8?B?a0xuMFJaRXN2SkczQXhVTlBXQUEweXBQVTZqRVAyQW8wOXNCQ3hGdStsek0w?=
 =?utf-8?B?N3JLQkV3dFBuMkhBWWRpS1cwUWhjS3I5Rk9ZaDlWQU91YXRJcTI5UEVVRWs1?=
 =?utf-8?B?MS9XN1YxbHlaTEtQWVRzY0ZrWmhLR3pPaXJaSWlYazVBOVNoZXl0bDU0NTZU?=
 =?utf-8?B?ZjZROHVIY1BPcXZOZnVIblh3ZmlPQmYwTU5CVFhUSVpGQ3NsN00zRGN3NkRQ?=
 =?utf-8?B?eG5hdzJaWnJBTW9PVnIyYW9WaGl2djNMMXA4MGt2NWxuZXZzbmhSUDNWcnNE?=
 =?utf-8?B?OHZNVTA5TllaK0k0RjV1cjdkbm1Rb2NjdWVZd2NXOTUwN0QvV1VGenVYREMv?=
 =?utf-8?B?WnI4NGRZdXRtVE4zeURMZ1Ayam5vOEZlMDhsdFAxSGVsTFlhTWtXejhTaExH?=
 =?utf-8?B?eVRIeWc3S21RcE5PMktESG1UVXpVcVh1QUliVGF0Qkl6ZDR6bFh4UVlVbnhy?=
 =?utf-8?B?SFZndk9uclhEZzFuWHBtL3Y0RkxXWnJ0aGh0aGRrNlRibU5yRVhMUTIvVldm?=
 =?utf-8?B?bVh5S2hVaEVzcksxMGJRbkFXRWt5OUpmNlArTEZDeVFKTk9BdE5FbEVuQ1E1?=
 =?utf-8?B?UDE4K3M4MU91Zk40Y0NuMVJmT3hmdjFLZ2JZRFozZUdUTEtvOUt4My9GUlJq?=
 =?utf-8?B?T1NmNWlhYzVGMWszem1MbXV4bFh5R1FRQWFKVFl1SmdncDRqdWxjUytLYjhl?=
 =?utf-8?B?d3V5bEdQSDJTTVc1dDViTHF0R2pwY0ZVSjJiMm41NEVPSGU0QjlRV1RoeXpj?=
 =?utf-8?B?L0JNSWdBVHZuK015MzM1SDNTR2J3WWRGYU15MVhFRzlqUnc0azBIVEZPbkds?=
 =?utf-8?B?eitKL3ZTMUdOVlRkSC9HYS9XaFNxYWFMa29xbVVJMTdISm5mZ2NweFF0bHRZ?=
 =?utf-8?Q?l16K19eOz865S?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(10070799003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Z0xmWDNCcXRHaThnOHJGMURLY0txRVlRSEoycFJtSS9JbWpUcTh5VjRDQlAz?=
 =?utf-8?B?YzhSNmlDdlVaZHpQaEpoRUNSNTk0NmhUL1FpcDZXVEs1RjdQK1Zzby9CQUEz?=
 =?utf-8?B?N2l4RkFRbVRYUHl3K3JOeFJrc3FVRkZuRFRaUU8wS1ZDQ3NVSmtVOU5haXBL?=
 =?utf-8?B?M0w2ZU9uc25TeUduKzFPejBhbkw1b2EwTCtPS09JU0lGL0ZnQ0grRzhOR04x?=
 =?utf-8?B?Tk5oTklFY21GM1M0OFNYTlRkY29ZUlZ1Sy9GSlRtS3VpTWhOSDhJN3haeXFS?=
 =?utf-8?B?Y0RWWU9tK1NDeGpUUUo1em5NMGpJdzAwV2FMN3NRdEpPVzhXazFMLy9UcFlF?=
 =?utf-8?B?RzhwbkxjSVFvd1V1Skx3TklxZGtIZmtmMlV1UjBtWWsvUDg0Y2daZHI3UWZo?=
 =?utf-8?B?UzhBSittWlpLOXRjWTB4K1pUTTlMektmUFJVMGhkYXhQeXhWelBWMmNQNWVE?=
 =?utf-8?B?UURrYUZYQlZxM0xEV3l4dlVoK0RWeGhQVUhYOGdZczZwLy9kL3RDT3IrOCts?=
 =?utf-8?B?M09FWGxFSjlZREV6OXJNZlhrTCtrZ1dtVEF0aGNLNHh0OHh0K05uU2hTOUJV?=
 =?utf-8?B?YVRhQ1B5emF2Y1ZjQnZ1RE0ydWxXYTZpQ3pKS3pLTzBocWNQMHp0Q1czcFFL?=
 =?utf-8?B?YnFUV0JQRTJ2R3JPS0xySHlldUJ4R2FGaHVVUC9MNVNXZmxjVGhjT0NsUVlH?=
 =?utf-8?B?U0d3bHpsNWpjYjNGcjVUMVBvWVVnQ2FlZCtqdXhtVjFkSFRhMitiVnVZT2Zj?=
 =?utf-8?B?THpRS0o1Y0RyeFBFNU5sckhua255L1ZTTUNOTkg4MTlXZEpSWEw3SE9TQVVZ?=
 =?utf-8?B?bmh6SU1YZGJIdVE3Y0J4SGJHQnQ1SVBLeU9YZjl2S2VWRkVHa0dMY215ZmNo?=
 =?utf-8?B?MW9QaUtUYzJtY1d5d1ZRYUs5cnZmaWZCWlZOUE4vdlJEOHlrMVhPMGpiYloy?=
 =?utf-8?B?ZlZWbll4UmRjNUVpYzZESktKS3VzTjlaaEdnTEdWeWdTa3FCeGFRTW1HN2NY?=
 =?utf-8?B?MVQvR2c5L0oyUHZFeCtheS9MeC9kWVhkZkFQdjFVUEw1ZkdpbkZNaVY3dzFG?=
 =?utf-8?B?RElsVHlQTG5zQ2lIS3hrcmtyNEsyNjhtRVFTK1lHd1VsangzdmF1NGVkUnlK?=
 =?utf-8?B?YUwyVHp2Q1J0azY2alJsaUdNWHVpcHFOVGd1Q3c0OUpiNWhDcEI1UUxWQU1H?=
 =?utf-8?B?SnNZUVp6aVBaT3QrODQ2Z3d6RjZtOUZROXJ5SVJDQVkwMXRsTC9tcUJIczlT?=
 =?utf-8?B?WGRPYUhBMjZDSzk4TitaejhaMWYyK2pyWlJuZXJnV2Vkb0VjRFJmdVdNbmZZ?=
 =?utf-8?B?blkxT1FVRzVxaWxicGhIZFJXOWdBVHVWMW9kQ2hIWlRWSnJkaXpQdUUvQ2x2?=
 =?utf-8?B?YXlPRVVqWkZPM3RqaVR4dVFjaDl1STBESW9OVGNFbng2V1RNYm9hRmxuZzZo?=
 =?utf-8?B?WFZYYTdmQXYrYlFhclNTWFU3d0ZQZC9GKyt3YUQvYjMzVTZMRkdRVGYva3pY?=
 =?utf-8?B?d3RaT2pxdUZSWTRyRnAvaEt2d2hneSs0c2hucWlQZlkzdDJUMzRZdHF5OTM4?=
 =?utf-8?B?SFpaNThLN1I2ajNYbzNxN2Y5YWk3VEk2U2FVN2FGRGtlQ20yYkM0UTFrdFhL?=
 =?utf-8?B?cVdrRWQ2c3RvWFN2N3UyOUJBYU0zQ0RCOUMzTXBKMEN4SFdPQTBxSjRtSm0x?=
 =?utf-8?B?YVRSYUgxWXhWTkFWelQyMStqK2tnK0xpMnp3aG04STBlMit5TVhiS0JYK3RY?=
 =?utf-8?B?ZmQ2M1B1L0FiYW9BVzFHUVQ0OUpHSkY5dm5JTlppcmgyZy8vcThFeGFzWm1u?=
 =?utf-8?B?WkU3ekJZbkZzdFVkbGYrRVlDVkxDVjgwZHI0TzFjRkY2b05IYmVyZWszS3BK?=
 =?utf-8?B?MGYwaEpTNEhGTjE4UFB2UU9OWGhzTU1sOFFWTlo5anJuRlNwZzA2eE5zRU40?=
 =?utf-8?B?eFduTmhORjVYQXM5NW9vTmE4UmZnZmxYMktJR2RrYXhNb3pqT2JyRFZTbGxz?=
 =?utf-8?B?VUFqMW15ZVVCWGxKdjR2b2xjQ3l4dGJReTNUZnkyNFN5Tkkrc3BhdEVlWUx2?=
 =?utf-8?B?NXB0SzcxRGJZUDRWUnJBZnR4Ny9nbVlJc0NaT2RUSk1xWWpLOGJuYTZvY0NL?=
 =?utf-8?B?TjJaeFVKYTRBc1BsTXFacTh4bnpoeGJZSkh2bjhoSUk2WDUvVTBhOHlYVUNr?=
 =?utf-8?Q?nylylv/EKtP8KFbK5ZWX2Fk=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b165f39a-ad28-41de-504d-08dd4754f346
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 08:53:54.2268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I/O1W3lcYB/EWVt0jswgkA3/hCZTe1Ln7AotBahU3TRD2b4TypUYoMAMFeUGbOU4bpgZcgPv97WcVxkoZxX0V9l5ymxqBmvillFFlXJBaGE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9792
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 07 Feb 2025 08:54:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6277

Hi Yoann,

On 2/6/25 10:57 PM, Yoann Congal via lists.yoctoproject.org wrote:
> From: Yoann Congal <yoann.congal@smile.fr>
> 
> This documents the variable used in the "automate testing a single
> recipe's reproducibility" feature [YOCTO #15701]
> 
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> Reviewed-by: Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
> ---
>   documentation/ref-manual/variables.rst | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 47d4e814f..32e91b6db 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -5802,6 +5802,11 @@ system and gives an overview of their function and contents.
>         For additional information on how this variable is used, see the
>         initialization script.
>   
> +   :term:`OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS`
> +      Set build target for build reproducibility testing but activate

s/target/target(s)/

based on the code that uses it in OE-Core and also the name which is in 
plural :)

Is this correct?

Cheers,
Quentin

