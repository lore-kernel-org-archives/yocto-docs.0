Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE1DDE77173
	for <webhook@archiver.kernel.org>; Fri,  6 Dec 2024 14:23:51 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.13])
 by mx.groups.io with SMTP id smtpd.web10.38060.1733495026424580996
 for <docs@lists.yoctoproject.org>;
 Fri, 06 Dec 2024 06:23:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=WK/idDWc;
 spf=pass (domain: cherry.de, ip: 52.101.70.13, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HBJVRnuvVuwq35N8p8NjtKyOthJjuoqQdy/iWljTnnfif22C3z1iyGN/6zS+aRQFZefpOKElU+4NdQtxbcYJULwsjyGW3xYTLUmIu3ssmdAfwtuYErd/FtZV6bMAdoZSbSlbJmpUs2bRl0337pUUX9kiJkKSZLuA92gVNxlZ/QmdEHFbT8gjoIGctjiauTGhcdKILmbJybb2i5bCE0mZCildg8YCi41WUQwWeFx4NsJYAgaG5Ba/kE2BoKnGoGUZkm1RcLGk8nzZLhn/0zr4d86ltwkyB5cMegD+ZlWtGIQxHWsFoIPxDqc9ei5S0fpuwxA6mvsqrhE5TMSVXdKdRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oLeKqGAiGACss57WcwqlLCNsmw9EsnIW1IdZPV8YhVs=;
 b=etr4MxzJQOmWq/Jf16fecyhEGxR14kjgGWYmOqB2OfA3yo9W0RZ0z92HsfyEBQBIR9UZ7wwljWqGwaS0SL08zaC9OTNLSz7UzC6W9A1A8mWt+Ohe8oQL9BOm7DLDtivHzNAzvdCMCvoX7JQbYFPPsGqI1GHWJ+TXqustdDHxtX014C/MvKmeom+d6sOGNywvlBViT/NSZEKTg1ovmbFhRsIn10uHKVzEsjP8ZzGgIgEj6a3zTysWlKFEbfkcRelAfeKsjtBUCNWwB2p3W+JO1VFwJ2RWhaeYUndwwoJgsZw6mHTx/XwJJtLNT5hDNuojYYpi2puNHNuZ6Y/ZsyGRPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oLeKqGAiGACss57WcwqlLCNsmw9EsnIW1IdZPV8YhVs=;
 b=WK/idDWcsnVNV3sAOvKFFCsQ8mqIVuNK+USAfigtx8ajgc3nlDOFHEzmTa4pn9gdksPrD3m8neMLaovK+JF9quwpwLh/jYxyyNhp9wrsvE/t9gOE7mtTBItI67+VKT0rnYqwR9g5CRlPmKGn2VcxBAPtOoFe3Byi3oSI3y5OMlA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
 by GV1PR04MB10330.eurprd04.prod.outlook.com (2603:10a6:150:1cf::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.12; Fri, 6 Dec
 2024 14:23:41 +0000
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea]) by AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea%5]) with mapi id 15.20.8230.010; Fri, 6 Dec 2024
 14:23:40 +0000
Message-ID: <fd8bce6e-155f-4c95-8061-bfef0d5784dc@cherry.de>
Date: Fri, 6 Dec 2024 15:23:40 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [yocto-docs PATCH v2] Add scripts to build the docs in containers
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241205-docs-build-dockerfiles-v2-1-047cb3245adf@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241205-docs-build-dockerfiles-v2-1-047cb3245adf@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR2P281CA0185.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::18) To AM9PR04MB8906.eurprd04.prod.outlook.com
 (2603:10a6:20b:409::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8906:EE_|GV1PR04MB10330:EE_
X-MS-Office365-Filtering-Correlation-Id: 57090c74-9846-4ffd-a44f-08dd16019507
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SERNbkgzQjdnREdYb3IrVVF3SFVZaDNwWUhORFp5NXFwZ0Z0SDJGWGpMVFR6?=
 =?utf-8?B?SWJ1VXF3K003OHZRM2xGTkNCSGxZeWtHT0I0TkFMdXhKYmNoVW5aMXdZdGVX?=
 =?utf-8?B?dVdNNGp1ZUtzMmp4TjZRV3hHUlhqMWNocGExeUxOeVRQSUJnQzBiZmpzZDVo?=
 =?utf-8?B?UGdXeTdNVnhIUlozOTFremVlMzZWdHcrRHZUUWZCUml3NVhCVVZWN1VHT2hv?=
 =?utf-8?B?aXFVekFSUVF1Um14dm50Ylg2NHNZdVNHazd6YlU0TWx4eWt5bWt5WGswVSs1?=
 =?utf-8?B?UW1mNGhScm1LaUcxTmthTDZuN2UrZ0lmMHpNSWc0TUxKUUEraHhGMjVaRkVH?=
 =?utf-8?B?L3BTcW5wWmdFL2ltTkQ3QUJJMmZZcGF6SlhaUXk5anZjd1BwV0M3dXFTZmk3?=
 =?utf-8?B?NEVpZERvQjVKSmtkTm4vaFJON2RrbXhjTW50RGwzNlFSclo5YnJXSS9YMEtZ?=
 =?utf-8?B?OHM4ZStFYmMzNEdDbVJoZFc0djZoVnRYQjQ2WW1Wc3JrSDNhV2NnMGw0dm5x?=
 =?utf-8?B?SmRnem0rYVFjbUpITWwvQisyN2pYaWl3ZnR5SFZKM0dpdVVnR01BMUIrK1do?=
 =?utf-8?B?bmVYeVE0VmtmVWIxV080VmtpMW5pVWs0RHIzNXk0dHA4ODllb2hEYnpvS2xp?=
 =?utf-8?B?bzB0Y2F5UG5oTkoyckgyTHJPclllNTNpNytGNnNyb1NXQ1BHNUp5bk1UYnNq?=
 =?utf-8?B?b216U1B0dkRUdUZKVU8yR25OdWhNREorSUdUR0tpaWVTc2dHcUd5QmxoL003?=
 =?utf-8?B?MGNTSlFZd2FQTndUZHhUdEZuZUJTQVJnTDFYeC9icE1iRjNQUFpnL2ZNYVBM?=
 =?utf-8?B?SUlCSGJqQUNZcktybW04OGFFK1lreUFySG81VFM4MHFXSWdpdGY4TnBMa3dx?=
 =?utf-8?B?NllKSkJNTmg0Vk1lcmpvWDZDWjdmNzF0NkNSQ2JSTHQ5WmZabDJJS2dIb2w0?=
 =?utf-8?B?QzZZVm05M1BwSEZrdVY2aXArbUNZZjE4RkNjeXVqbVR1Y3VQVlRIS0FaNGgx?=
 =?utf-8?B?YnZoK1dSWC8xeHBvWGFhRjd4Y2VkYWVrYm5XTFJzakJVR2xhRFlzakpZOXlR?=
 =?utf-8?B?bWluMjVNWGxNeXptOG9ocmZ5SnhURjNPN3NaMUIxTWZGbklJRUlnaSthMVkz?=
 =?utf-8?B?VVFCVFgzQ3hCdXpWMVFldTR3TXhDWk9wWHhMR2R0aTQ5NEg5VE5WRGRGQ2N3?=
 =?utf-8?B?VHVkaWYvSjNMSXA2QXJjTU5NUkJtNWhCRkwzUjBhSW9GcXc5VnhmNDBxdmgy?=
 =?utf-8?B?Y1ZPNkhaWXdFSnBGTENhMDRrZnNHUTMwQ3dxOTNuRDdBeDZNTVpUaHZYU09F?=
 =?utf-8?B?aFVSVFZYbm1Va01JanpqQmw5SmZHRTIxaUxYMkU1Vm9QOGlSUEdjTmM4UmhC?=
 =?utf-8?B?KzQ3WlpIb2pJQjhaeVducHg4M1pzckhNQVRQMGdyaDVXMEUwR0VDSTY1aWts?=
 =?utf-8?B?aGxJTG83b1VnVGJVcG10U1phMm9XSS9CTVhlNkxkeXBxcStmV29nTU9ad1Nj?=
 =?utf-8?B?OEdLYWRMNjVPZi9Kb28xZjl0anZsQ2FlVTlUbDdxZEliNlBpSTJGb2hPVzVh?=
 =?utf-8?B?cHEvOTdabzF6M2tTcUswcnNKOTIvaGx6TkVQc1ZHTzVYY3IwMU1JYlhKQmIw?=
 =?utf-8?B?N3dMYm84ellOOHU1UlF4M2l2Q3psNEo0UkhyZVR6WER1d1NzQ0ZqVmI3RkJ0?=
 =?utf-8?B?REUrd1k5NkRUR0YrMlpYOWFrNkpJRkJWSWxwbzg3bjc5UVo3VTMzdld2QUZG?=
 =?utf-8?B?ZzFYM3RNelBNRmlEUWtOVTRJOTk2MUkxWmlMbU5UNTFCazR2VXBPeHdxbnE0?=
 =?utf-8?Q?/+HHZTSBXaD0VlMyz42Cnx/Gra7+jk81jYXmM=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8906.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?R1MzVjZBdEtkYTdzc3VnK0ZEWU5iYldtQ2NWNzRRZmhnYS93eklwQ0NvcGVZ?=
 =?utf-8?B?Zm5paW12RGtMZ0Y4K21KOWtPenFCK255Y0hUaFp4MFlvd3kxYXVhV3ArUzc4?=
 =?utf-8?B?ZzlVM2VCdHZUejM3N1ZjTXFhb0pOM3hXN3lkalF2SGFaSFIrdm5MendiS2Fa?=
 =?utf-8?B?SElEaVZuOUQ5SFRUdzRwTU1ORlptZzVSMXdEUXZ5MGdPTHdWU3lnZDRwRVl2?=
 =?utf-8?B?WmhXQXpYVzFPNWlIN1huUVBqSk1XNmRpNSthclMyVTQ2c21rVVJDRWMvczNV?=
 =?utf-8?B?NktXMWNEWEFYekNhVTlpZDExTVFhRm1NSUJnamlFUzZJVTB6RTcvSWZOYnlG?=
 =?utf-8?B?d29xaEo5MjlHcUpDcU1ZY3drODNJcTNUektQM0ptbmlmei9QRkFJQUxSU0lJ?=
 =?utf-8?B?QXJFZERUNzR1VWR5TFlraTF3VlBtS3JpUmo4bXA2cDRFVlV1VHdPd1FVd2xu?=
 =?utf-8?B?KysvUFg4SkI3aDh5YXduek1CTHkzcFNHM1hrN2ZKWDJlYjZKYU1ERWt1Sk1a?=
 =?utf-8?B?K1ArdkRDY29nbDNiOEdjU3NuODlYNkJTRGlleGdvNzVMblMvSGJYUHM1LzVx?=
 =?utf-8?B?SVY1c0ltempOM29YN3NlU1Z3RlQrMjFMdkdqeUs1NytJVFpRSWhGTlE0bE80?=
 =?utf-8?B?TDJXZ3VhbDgrRXIwRXhpdnU2RUx0RElsUzNpc3dLRUlBOWNPWDd6bFUraHA2?=
 =?utf-8?B?anhqeGhJQVZBdENYZllXcmpEUXFlaE9VL0V6RjdKdlNEUkIxZHhWaE02cGRy?=
 =?utf-8?B?UCtXa2tvVHJTanljUjdZT1VMNjZQVVFzRWRhaVF1SXRCQ2Exdi9DZ0o2Ykh4?=
 =?utf-8?B?N1p2Y0JyWFNUckwvQnNUNDZJa2NhYUhPbUFsT2M3NGMvcHFqQktGNnA3WlhE?=
 =?utf-8?B?aWtCUmpoV2JwVSswRVBDeDFVNW92QVpFcDVka3pPc1dIR2xOQmEyVCtOVWRI?=
 =?utf-8?B?dVk1eVZySTc2K3Rhbm1xM0JzRk8rZGdJcitEeVN4ci9mdkswcVpHakR0ck9p?=
 =?utf-8?B?c0pxa2ovWUYyUThCSDUxMEF4NTJDY01PMktXeWxRNVlhdUh0NkRaWW9zZ2w4?=
 =?utf-8?B?Ykx1NWhLZ2tGMEl3ZmFsaWd0RXdjdC9UQ1FCeHc0bXlvWDVmVlRlQWZXb2RJ?=
 =?utf-8?B?VEZRUmRUWTJ4cUlvOGhYZjZTbkRPbVdmbXY1anNVVmQxSk40b2RSUWhWb0NN?=
 =?utf-8?B?RE1JUTFvUnBuV1dxZlJkRHV0Z0ROWHFXVVc3WjZ5d0dWbngwN3ljN2QvQ1pP?=
 =?utf-8?B?UVRnQmlRNFpYSVRaWnFxSGU5NlVUd1BiR0sxY0dmRG84UDE3bHA2R3VWOEJL?=
 =?utf-8?B?RWx1NldWdTJvcTU3NFNHMDJUSFRYR2VuZDQxNE42bFRNY3ZwSHNscjVLRUVD?=
 =?utf-8?B?VGdvYjZXTHFnR0xhS0o3Y3JwUFF5RjNtZmJoVnZWVkVkdFU2NEJkRlduL25G?=
 =?utf-8?B?VHVVSWk4YzVLVlRGRWQzOXNGM213Ky8rWlRnbjZHdWJ0UGlvakd5cHkyL1dk?=
 =?utf-8?B?NEpTek94Sm5jVkw0dk1OeWZRQTNzYURsb1NycFdzU2FlOFMwK2Q1d0FMaC9l?=
 =?utf-8?B?cHBoQmtNK01BTXVYMzFkVEFMNjdOeW8yWnlmRVVPZkZJMEg2Rk54V1BoUDVP?=
 =?utf-8?B?US81QlR2c0ZVTGRwTTZYOHlMWEFLWWxaN2xla2ZDb09wcE0xSXJNUmt2L2Vt?=
 =?utf-8?B?TUl1a28rOVhBSnBkSlgxSUJLYWVtTlMxdzlHbWYwd29MT3JsaEdFaDhTdDRX?=
 =?utf-8?B?RURFVkwvNUpnb00yTTU3UUwycnVzN096bkx6a091d1JiTXJjWlhjSzY2T3Fs?=
 =?utf-8?B?aFFZcTdBWVh0M29xTDJOK0ZBeGVaVUdmRzQ2ZHFYSGVjUjdiWjhGaGdwTnIw?=
 =?utf-8?B?TEVNQXpuYmtmNHBWK1VGL2tJQXFCamJ1dmJUZ2s4QnhGdzFnZWVQMks4Vk5D?=
 =?utf-8?B?UmgyTzNqODhPZDdoL3pENTAyWThiSWN4ZjBwNnZrVU5sMjk3UXRDdUs3K0Nt?=
 =?utf-8?B?aUFqKzEydUlGYTM0d0l6dnBUYVNOMUJWNzZiY1JRL3NVUUxFVng5VVU5ZUF0?=
 =?utf-8?B?SmtvblBwNVRDL0IvTjNZeHBGUjRHTTRxenZKUmJ5VUt6dzdRQ09oc3cxLzdj?=
 =?utf-8?B?SW5WOFdWb1Z0blRMUkdqRVZQemVRYVZwMysrSUQrNHJndzJZdlRmbFl0bHph?=
 =?utf-8?B?MFE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 57090c74-9846-4ffd-a44f-08dd16019507
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8906.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2024 14:23:40.8808
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hIGLIivjIVSbt8Ws/gjRhr77oN9qsaBzWtTbbwDGDSNAE1/Vi5p1d8rtscPjueQjyreuX9AFcw15djXDOvC3w44KerEH5hv0B40RrUb6RII=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10330
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 06 Dec 2024 14:23:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5893

Hi Antonin,

On 12/5/24 12:06 PM, Antonin Godard wrote:
> Add two scripts for building a container image and building the
> documentation in that image: build-docs-container and
> container-build-docs.
> 

Yet there's only one left now :) (also in your commit title).

> For now, the documentation/tools/dockerfiles directory contains a
> Dockerfile for building with Ubuntu or Debian, but we could extend this
> to the supported distros.
> 
> It should be possible to build the full documentation with two commands:
> 
>    ./documentation/tools/build-docs-container ubuntu:24.04
> 
> CONTAINERCMD can be replaced by "podman" to build with podman.
> 

I assume installing podman-docker package could help with that too. Not 
sure it's recommended, but I do have it installed :)

> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---

It'd be nice to explicit the dependency on your other patch series here. 
You're the maintainer so you'll get the order right when merging but 
it's a good habit to take as a contributor so maintainers are aware of 
specific inter-series dependencies.

> Changes in v2:
> - Merge the scripts to build a container and run the container into a
>    single script.
> - Parametrize the FROM dockerfile instruction from the script, allowing
>    to use a single dockerfile for multiple distros.
> - Add a paragraph on this in the README.
> - Copy the dependency list in a file in the container, instead of
>    passing them in a variable (to be future-proof on command line
>    lengths).
> - Fix the locale-gen command in the Ubuntu/Debian dockerfile.
> - Link to v1: https://lore.kernel.org/r/20241121-docs-build-dockerfiles-v1-1-3b54e1237bf5@bootlin.com
> ---
>   documentation/README                               |  27 +++++
>   documentation/tools/build-docs-container           | 119 +++++++++++++++++++++
>   .../tools/dockerfiles/Dockerfile.ubuntu-debian     |  18 ++++
>   3 files changed, 164 insertions(+)
> 
> diff --git a/documentation/README b/documentation/README
> index 8a47fd4a3fd07d41d61a7d681d82bd13ac74527d..aebece13758005a8b913b4570fee6118256f6f9b 100644
> --- a/documentation/README
> +++ b/documentation/README
> @@ -128,6 +128,33 @@ dependencies in a virtual environment:
>    $ pipenv install
>    $ pipenv run make html
>   
> +Building the documentation in a container
> +=========================================
> +
> +The documentation can be built in a container with the build-docs-container
> +scripts in the tools/ directory. The default container command used by the
> +script is docker, but the script also supports podman by setting the
> +CONTAINERCMD variable in your environment:
> +
> +  $ export CONTAINERCMD=podman
> +
> +A basic usage of the script would be:
> +
> +  $ ./tools/build-docs-container debian:12
> +
> +This will the entire documentation in an Debian 12 container.
> +

+build?

s/an/a/

> +The documentation can be built in other distributions. This list can be obtained
> +by running:
> +
> +  $ ./tools/build-docs-container list
> +
> +The make target can optionally be provided to build a single documentation type
> +(these targets are listed in the documentation Makefile). For example, to build

s;the documentation Makefile;documentation/Makefike; ?

> +the documentation in HTML and EPub formats, the following command can be used:
> +
> +  $ ./tools/build-docs-container ubuntu:24.04 epub html
> +
>   Style checking the Yocto Project documentation
>   ==============================================
>   
> diff --git a/documentation/tools/build-docs-container b/documentation/tools/build-docs-container
> new file mode 100755
> index 0000000000000000000000000000000000000000..b9578d6da49b707c4de215866b6396cfeff3d08b
> --- /dev/null
> +++ b/documentation/tools/build-docs-container
> @@ -0,0 +1,119 @@
> +#!/usr/bin/env bash
> +#
> +# Build a container ready to build the documentation be reading the dependencies
> +# listed in poky.yaml.in, and start a documentation build in this container.
> +#
> +# Usage:
> +#
> +#   ./documentation/tools/build-docs-container <image> [<make target>]
> +#
> +# Where <image> is one of the keys in YQ_KEYS. E.g.:
> +#
> +#   ./documentation/tools/build-docs-container ubuntu:24.04 html
> +#
> +# Will build the docs in an Ubuntu 24.04 container in html.
> +#
> +# The container commands can be used by exporting CONTAINERCMD in the
> +# environment. The default is docker, but podman can also be used.
> +

I would move "set" commands here.

> +SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
> +CONTAINERCMD=${CONTAINERCMD:-docker}
> +DOCS_DIR="$SCRIPT_DIR/../.."
> +POKY_YAML_IN="$SCRIPT_DIR/../poky.yaml.in"
> +
> +# This lists the different images we can build and the keys we pass to yq to
> +# find packages in poky.yaml.in.
> +# The keys should be in the form of "<image>:<version>", as this will be passed
> +# to FROM in the selected Dockerfile below.
> +# These are common yq keys used for multiple distros.
> +_UBUNTU_DEBIAN_YQ_KEYS=".UBUNTU_DEBIAN_HOST_PACKAGES_DOC .UBUNTU_DEBIAN_HOST_PACKAGES_DOC_PDF"
> +declare -A YQ_KEYS=(
> +  [ubuntu:22.04]="$_UBUNTU_DEBIAN_YQ_KEYS"
> +  [ubuntu:24.04]="$_UBUNTU_DEBIAN_YQ_KEYS"
> +  [debian:12]="$_UBUNTU_DEBIAN_YQ_KEYS"
> +)
> +
> +# This lists the dockerfile to use for each of the distro listed in YQ_KEYS
> +# above. There should be a 1 to 1 match between the keys listed in YQ_KEYS above
> +# and the keys listed in DOCKERFILES below.
> +declare -A DOCKERFILES=(
> +  [ubuntu:22.04]="Dockerfile.ubuntu-debian"
> +  [ubuntu:24.04]="Dockerfile.ubuntu-debian"
> +  [debian:12]="Dockerfile.ubuntu-debian"
> +)
> +
> +main ()
> +{
> +  if [ "$#" -lt 1 ]; then
> +    echo "No image provided. Provide one of: ${!YQ_KEYS[*]}"
> +    exit 1
> +  elif [ "$1" = "list" ]; then
> +    echo -e "Available container images:\n\n${!YQ_KEYS[*]}"
> +    exit 0
> +  fi
> +
> +  local image="$1"
> +  shift
> +  local make_targets="${*:-publish}"
> +
> +  for cmd in $CONTAINERCMD yq; do
> +    if ! which "$cmd" >/dev/null 2>&1; then
> +      echo "The $cmd command was not found. Make sure you have $cmd installed."
> +      exit 1
> +    fi
> +  done
> +
> +  # Get the appropriate dockerfile from DOCKERFILES
> +  dockerfile="${DOCKERFILES[$image]}"
> +
> +  local temporary_dep_file="$SCRIPT_DIR/dockerfiles/deps"
> +  echo -n > "$temporary_dep_file" # empty the file
> +  for dep_key in ${YQ_KEYS[$image]}; do
> +    yq --raw-output --join-output "$dep_key" "$POKY_YAML_IN" >> "$temporary_dep_file"
> +    # add a white space after last element of yq command
> +    echo -n " " >> "$temporary_dep_file"
> +  done
> +

Just use a temporary file, this would allow to run builds from two 
different distros at the same time. mktemp should help you with that.

> +  # docker build doesn't accept 2 colons, so "sanitize" the name
> +  local sanitized_dockername
> +  sanitized_dockername=$(echo "$image" | tr ':.' '-')
> +
> +  $CONTAINERCMD build \
> +    --tag yocto-docs-$sanitized_dockername:latest \
> +    --build-arg ARG_FROM="$image" \
> +    --file "$SCRIPT_DIR/dockerfiles/$dockerfile" \
> +    "$SCRIPT_DIR/dockerfiles"
> +
> +  # We can remove the deps file, we no longer need it
> +  rm -f "$temporary_dep_file"
> +
> +  local -a args_run=(
> +    --rm
> +    --interactive
> +    --tty
> +    --volume="$DOCS_DIR:/docs:rw"
> +    --workdir=/docs
> +    --security-opt label=disable
> +  )
> +
> +  if [ "$CONTAINERCMD" = "docker" ]; then
> +    args_run+=(
> +      --user="$(id -u)":"$(id -g)"
> +    )
> +  elif [ "$CONTAINERCMD" = "podman" ]; then
> +    # we need net access to fetch bitbake terms
> +    args_run+=(
> +      --cap-add=NET_RAW
> +      --userns=keep-id
> +    )
> +  fi
> +
> +  $CONTAINERCMD run \
> +    "${args_run[@]}" \
> +    yocto-docs-$sanitized_dockername \
> +    make -C documentation $make_targets
> +}
> +
> +set -eu -o pipefail
> +
> +main "$@"
> diff --git a/documentation/tools/dockerfiles/Dockerfile.ubuntu-debian b/documentation/tools/dockerfiles/Dockerfile.ubuntu-debian
> new file mode 100644
> index 0000000000000000000000000000000000000000..3c543dc4b0e96dc9c00b201558e2ed00847339fa
> --- /dev/null
> +++ b/documentation/tools/dockerfiles/Dockerfile.ubuntu-debian
> @@ -0,0 +1,18 @@
> +ARG ARG_FROM=debian:12 # default value to avoid warning
> +FROM $ARG_FROM
> +
> +ENV DEBIAN_FRONTEND=noninteractive
> +
> +# relative to the location of the dockerfile
> +COPY deps /deps
> +
> +RUN apt-get update \
> + && apt-get --yes --no-install-recommends install $(cat /deps) \
> + && apt-get --yes autoremove \
> + && apt-get clean \
> + && rm /deps
> +
> +RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && locale-gen
> +
> +RUN git config --global --add safe.directory /docs
> +
> 

So... I've had another idea.

Parsing yaml in shell, not fun.

But I don't think we **need** the instructions to be in the YAML file.

So I think we could drastically simplify all this by storing the setup 
instructions in shell scripts which are included in sphinx AND use those 
shell scripts in the Containerfile. We actually do this for our product 
user manuals :)

Essentially, we would have:

$ cat documentation/host-packages-ubuntu.sh
sudo apt install gawk wget git diffstat unzip texinfo gcc \ [...]

In Sphinx:

.. literalinclude:: 50.literalinclude.apt.sh
    :language: bash

In the appropriate place.

How we generate the Containerfile internally:
"""
cat <<EOF > $WORKDIR/merged.sh
#!/bin/bash
set -eux
export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get -y install sudo
EOF

# Merge bash snippets we want to run (in the right order)
cat ../source/50.literalinclude.{apt,atf,uboot,linux,debos-prepare,\ 
debos-build-bookworm}.sh >> $WORKDIR/merged.sh

chmod +x $WORKDIR/merged.sh

podman run --rm --tmpfs=/tmp -v=$WORKDIR:$WORKDIR --security-opt 
label=disable \  --annotation -w $WORKDIR debian:bookworm ./merged.sh
"""

I assume we could simply use COPY in the Containerfile and include the 
shell script in there and run the shell script in a single RUN. You 
could then do the cleanup step in a separate layer, not optimal since 
the layer will be unnecessarily big but I assume the end image is going 
to be smaller anyway?

The benefit is that you test **exactly** what's in the documentation. 
And also you don't have to parse YAML. And it should be relatively easy 
to add support for new distros.

What do you think?

Cheers,
Quentin

