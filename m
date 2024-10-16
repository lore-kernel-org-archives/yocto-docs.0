Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8917ED206B5
	for <webhook@archiver.kernel.org>; Wed, 16 Oct 2024 14:21:17 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.57])
 by mx.groups.io with SMTP id smtpd.web11.24487.1729088467981117773
 for <docs@lists.yoctoproject.org>;
 Wed, 16 Oct 2024 07:21:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=afv8WDfw;
 spf=pass (domain: cherry.de, ip: 40.107.20.57, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rwnGCgmnVWdly+P7BwILH6KVUzKQSAz8NOuZmF79f1oDaXpBnu5vT+3zABCdcvORXucfkfq3JUvQ8nQa5tkO8TEBpzcrOxpqhtDqoEUkZunjk4RDIz8tXQnkfYY+wsdIIoj6Hf5BztT4HlZ8H0dTJkiUDgBuul/fnucEnkAdRQCcvt7IscUlkW14i2LQHn4lPNKjZapI8EuYfqDdtRL5YYjrjZocA6k57E/BbQABACvNnIP4OxX8fPziI398HkTV+5UBPI4Uz18xVcXTqvrDQvRCuIKz4541hPv8IROunuIU+ew/PLX2SQSm/maSSUiZchsqgnwaFzRN28fC0e6CKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cIhwo7PRJINBpfdX7NiUn3VAImwbYS664jurS3Pp/rU=;
 b=En1pgXPYZlm8nVzCUVgLV9RDFjJITuRyBQNCKFwMfAC44jguEUPyJIrMvDDoQ4TPiu1eqrq3TTO5lJWe12HD2NN5M2JJWVSQXTWMkrqmTxxkEsmBU+bWqQhisVuMLBli0o1xhsTck81h+1YIU9eDMxK5/hvced5ZeLnRTqzRCYpDELrlHxkQRvJfLoAne8ZeqEUoJBcgYyt+YRgiMXkQkA+IvGrppL+djcqbur44k/0KJ/UKcI9wKeR8CKRTY7vWtBvf+yNsAKUoGsQVj2ztNeX8jw2pyQFUm2Nzqa/W85rKX4FBvp3RVmIngRp2T1Cruj++hzFoLyIdM+VGbOBBxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cIhwo7PRJINBpfdX7NiUn3VAImwbYS664jurS3Pp/rU=;
 b=afv8WDfwHBlgb/CwdCKxiUY6yhNJvxaE8LbDORqyGbs39Rx5w6yB3/epYYzKz6CutOWBaSZhMsa6QXf5k8XU3cPDaMSri44rIGVNm1m9aRbNt0TX/b5bP4/rPu8behEnKCfI3eiF35F4NrvMuumrdSHhwZXmcyms62U36L8AkcM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS8PR04MB8197.eurprd04.prod.outlook.com (2603:10a6:20b:3fd::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Wed, 16 Oct
 2024 14:20:59 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%7]) with mapi id 15.20.8048.020; Wed, 16 Oct 2024
 14:20:59 +0000
Message-ID: <00a6a241-b146-4de1-b091-9bce7cc01091@cherry.de>
Date: Wed, 16 Oct 2024 16:20:58 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] release-notes-5.1: add beaglebone-yocto parselogs test
 oeqa failure
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Ross Burton <Ross.Burton@arm.com>
References: <20241016-5-1-parselogs-beagle-v2-1-9568ac00907f@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241016-5-1-parselogs-beagle-v2-1-9568ac00907f@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR4P281CA0417.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d0::8) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS8PR04MB8197:EE_
X-MS-Office365-Filtering-Correlation-Id: fbefe98f-a093-44a5-36c3-08dcededc1e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|10070799003|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NzJUMEdUVkVKdXBjNzFsS2x2bkwrV0c5bm9RMkI0ZWtmdjZtRHFzaUJIcXBS?=
 =?utf-8?B?Q3hnSE0wZTNzQXNUbHAzQTRxamU4L3BNcllaMFA2M1puSHlBQUVNSmFoK0FB?=
 =?utf-8?B?MnRFS1dHd1VnS21FNE9yYXVNdFMva3ZxZ0doSjRIa1BLMlJ5ZEhpSHdQejhL?=
 =?utf-8?B?T2d0Vk1QcmdLUVhCSzluMWh2Z1YvVWNaTTltRGljV29LU2cyczZKbS9keFNU?=
 =?utf-8?B?dXZkR3kvR3oxdlBqMTRrdWh3My9mT2kwWEpDUmRpSHpmSXdLMWRqZVEwS3NZ?=
 =?utf-8?B?OE8zdjVqeHIrWnlBQW9JMndJWkJLeG9lREFZamZUUnZrNGl4bFBLbU5NUVFR?=
 =?utf-8?B?VGVPdnpqRFQzKzQ0VGtuWUc1L09udk5wUHNSK1dqNzViYU5LRDlmbVhhZWd5?=
 =?utf-8?B?SlRmV0FHQWQ0V0dIMmRqRDcyYlpFRDdQUmh1S0FxVFlPd0dCTHVjVFVIRVZN?=
 =?utf-8?B?bTlsNjV1MisvUExOTXRqZ0tndVZuLy9ROEFrRVpsUGZzNVlHU2dIZlZQZ1J3?=
 =?utf-8?B?NEhiNk8xd1RPTGF3UG1RSGZzUDcxc3VnRWg0dGtzVlZoZnYxS04zNU04S24x?=
 =?utf-8?B?bHY4elQwNkpCS3hQbzBHeXQrM0xDUlVrd0FlTTAzMjVoRTJGUlR2ZEtmU1Jt?=
 =?utf-8?B?VmszVUxHckZMNExCelY4aFVHN0ZEUkJUSlVLc2lwdEJwdGZ3VUZEN2hMbWFh?=
 =?utf-8?B?dkhaQTRaU2JrUFVsRTU4MkphM3JFU2E5VkpVcFlOenQrMlRxbGhZMDBhN2FB?=
 =?utf-8?B?ZEJZVVFLZk15bnpsOGtZODVyUEh5ZXh4NXpwWXNKajBOTEk1cUxlUnVwK0Nn?=
 =?utf-8?B?TmVNV0dTWDE3MEozL3RFM21CSWJKeC9KcWFtRFpJT0IvS0wrRW1oL05UVGJl?=
 =?utf-8?B?R0pUYkdmQWNEQ0dVVFlLMEJHZmJyUmovSHRvdWsrYWpKNWpQT2RUREdaMmQ1?=
 =?utf-8?B?YVhYKzVMQk1HN0crcDhONENsTG5YT1hzUC9SeXhJcWxYenZSMTFZWldLMjEy?=
 =?utf-8?B?SFQ3dzNwdkZ1aGRQNGQ0bThYcTdISkRjNHNTY0JzaDVHVVFqUm0wWGRhb1d4?=
 =?utf-8?B?RWdEN1BHWFZ2K0lhVEROSTdQSDBySU53ZWRkdThyTXl0ZU85Y0tVd3N2NjZp?=
 =?utf-8?B?M3NKOXlHRHVLOVF3SURxUVcwN1ZnZXlYaWxSUzBiUlc2NCtQNEFPMktLNjUy?=
 =?utf-8?B?UzZEQWR6aWszbTgzbVg3SjJvbEtLMjdmOWZYVFhKQjBudzBUMlEvUlVidmJO?=
 =?utf-8?B?S0JuZWdLS0h2T0pKNXEvQlY3UFlWV1ZPVFJ5ZHVvYm1TMXhPVU8wK0YrYVM3?=
 =?utf-8?B?bmtkWG15MFJDSFU3U1BWOTlzYnVJa2tkeDlIV2pRUlRzN1NMRFgyMkhDVEl0?=
 =?utf-8?B?bmlEcUcwSEk4Y2thNzZqNjQya2UwTEZ5NXhOOUFGbHhNWEsxVk0xMEZMdStz?=
 =?utf-8?B?U0VFMGxBQzVBZmdieWJPcGlVVmxGS1BzYWhWKzg4VVJkZmVWdnludms2ZEpp?=
 =?utf-8?B?RUczdUlCdjg4N01UeEU3SjdGMGhRWVZxRHU5MnIyZjgvc3FWOCt2WG9pZmNx?=
 =?utf-8?B?MVcvNVhuZFlHbDNvaFZTeWVncDdsdUk2dVlmcE1IMUdqa01IWUVVT2pMejlC?=
 =?utf-8?Q?6xdMXCX7/k6f6dI14MlmTSeDz2H7aNVoTPdI2AAezLr0=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TXJSSzJsSzhDcWgyUVR6NXZCWnFzaFBOTUhKaGR3eU9nM0lXTmNhSVJDT0lV?=
 =?utf-8?B?anVsZWp0VC9xRGpZellKalliMUw0SnlWc0dMR0lSRVZSWlJCQ2FpeTB5Skhr?=
 =?utf-8?B?VmFmUFlBRmJ2UWFqSmNXM0pWaE9POW9DdmNmZGxFdEYwNnpuNFZHcmU4ZU1U?=
 =?utf-8?B?QnVvME4yTXB4bWlkQzM3SlNHNUFET1g5VG9zNjVaTHRoaXZIaG9VK0hmcDE3?=
 =?utf-8?B?eWMwMGZkOEVLaGgrNzU5NVkxS01oUm9sL1RsNjdkSDRlekxxczRHNUVHT2VB?=
 =?utf-8?B?eTloUGdxdGJmVjVjQTZaTjFQUWhoQTYwUVo3di80dmF6YjBhL0V2SXA0ZlQz?=
 =?utf-8?B?Z2J5Nmd2VmRUbTlOVlBLdHdzZ1RNK2lRcjA2bXRTcms4RVpYUDNNNWhZLzNa?=
 =?utf-8?B?aXhnbXJkRFlRejBKamVTTFdYRWRxUk9SVWM0RUxZYytMWFVOUTJxaHAyRHNy?=
 =?utf-8?B?K0FpK3BHSWV5MzVUbEU5em1yMHpWS1RtRklqNUdoM005WG1Vc016WERTeFpj?=
 =?utf-8?B?YmJBdmM2WmhneTRFeWU2dDhnTGFzTTRVUHlhd0JFWjNFa0JZVk9MdXh6MHhU?=
 =?utf-8?B?L1VoQUk1UDBIR3pINE50Sm4vM2JtZURab1ZFdUdOSmRQMzRYK1ZmWlJkeGh1?=
 =?utf-8?B?MkR2TlhxS1dXTlB4SkdiRlE2YWFhYmgwMWdkRTRxbEhJNTFreHFtYzFJajAx?=
 =?utf-8?B?aEthT3NlTHhCMkkvL3Q3NEYrUUFkdVZuMHNrMnpZdWtJOUpQTVlZVlI0disv?=
 =?utf-8?B?c0VaYXMrS0RDQ0I1bGJndFY5OGpXaURteEVsS0RqVjVBOW9MZ01vSEN1NG9Q?=
 =?utf-8?B?UHExUmdRamlzNFFPQUlYOVZTM2cwSW5LUW0xU3Rrd2NWZTBPMUJBZ21SbERH?=
 =?utf-8?B?ZnVHTDFCaXBnbzRuSUV4cVNIZVFZVHBiUC9jU3I5RFYzUjR3QWZZdjQvMUIr?=
 =?utf-8?B?eml2SG9KblY2OE5VU0ZTRFRQRnpyWnJ6bGw0WUh4Wm15Ykp3OWhoVkN4M2o1?=
 =?utf-8?B?bUQ3VjRDVXNhaGZtUVZQL1E2OWE5R0FNK0tIeVRzSE9ldHc2b1d4VStTZkhQ?=
 =?utf-8?B?Wmd1ZU5xaHRoNWR4M0dHZC9LdllJTWlTM0ZRY0ZJWHY3ekhpWEFsazdGNWFW?=
 =?utf-8?B?RU5LZXJLTVRqZXdqdjhvTkQ5Mk1pRWJWeVZPZnVIem9IVy9aV0MyeHJ5VnlV?=
 =?utf-8?B?MlFqdmovZFcwWFYyczExUm9xR3duaVRVdkZVMW5pakZXTVdJUURUN28rdFU1?=
 =?utf-8?B?UVhaU2VBNTdyRHRGem05MUlxc01FVTloZ1VUem9vcEZybHZMN1hlVDhmRC9Q?=
 =?utf-8?B?WE1ZeHgwTDR2MmEyTHNBU3d2M09ncEFUaEhXcmtJY1dBMUxtdDB2RGR3T1Qx?=
 =?utf-8?B?U1NuZzk3SWlGUGRDQUJxUkJnWVY0S0libjJzTktXVTNRSndOVTdnUXdkODJD?=
 =?utf-8?B?UzVoelExeE1jNWNCOUExQVVjZzJvMDhHbFVpWm9VRE5NaTJ6WGJVRGVWT2FQ?=
 =?utf-8?B?dmdrU3Q0VUxxSDZjNzBQTlhjTWtOaWp3eEZYNEVnWnVjUEhKYUhLd2g1WDRl?=
 =?utf-8?B?VStHeE10cWJnQlpkUTFDaDJTYkRhU3JDK0tudk90Y2RvRHEvOWc2Z25yRXcr?=
 =?utf-8?B?Wk9VZmVnS3FUdlVpRU80RWlEK2F5SUpOckthaktRenZRSmJEbGJmMzNERDNo?=
 =?utf-8?B?MnZXeVZFN3pKc0o1V0xLQ1ZuWU5EU2FDQTYzSmtZYnVROGEzQVBNQkFlQWtN?=
 =?utf-8?B?c0VxTGsrUUkyUTQxR0VlbGtFVDkvcU91c00rSXFBekNlTDF1SDhXd0NRVENy?=
 =?utf-8?B?ZVB3RFB2ZG1jSlRoNE4xeXhYb0s2aWg4VWNrMzF1ckFiWlBrY2hXNFo1d0ZD?=
 =?utf-8?B?ZU92R0dNQUlMcVZuVHFnblNXVEdJdmM1aVQzZTMxSm91OG92bEoyU25OUGpC?=
 =?utf-8?B?LzRuTlJDRXBkS1lwR1AzV2VIeHQ4RDhEMWtDZ0hxUlJVSTIvQ1VxYldUa05K?=
 =?utf-8?B?Z0pYTkRqMVZyb3lZNGtRYkNsZ3djQ2d3NHIzcGd4bmpvZ3Fwa0pscnd5Zkpk?=
 =?utf-8?B?WkVmb1N5UTVvUEFLYkVvUUxteVJaSS9wNFU4YUNkL0txdEd6OXRVVnVQUkxt?=
 =?utf-8?B?TzVHOW5ZMXJZUm14cWVjSTdBSmgranVqMEk3U0RYMEtuZG9sSUlYbm84aTdp?=
 =?utf-8?Q?GlRMJ9GSsuohrHr4PYQ0bXU=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: fbefe98f-a093-44a5-36c3-08dcededc1e4
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 14:20:59.7088
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1JPCBFId1CahG67MitfTLEA+k0DWytw5mBJCwonRO4Wl7/AVYnLQpXNiPoM1dkqpame4jmDAsKvFeI3YbNwTkGGt3YN1Exnx7OpclvEd7vQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8197
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 16 Oct 2024 14:21:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5520

Hi Antonin,

On 10/16/24 4:18 PM, Antonin Godard wrote:
> The beaglebone-yocto currently fails the parselogs runtime test. For
> details see: https://bugzilla.yoctoproject.org/show_bug.cgi?id=15624
> 
> Reported-by: Ross Burton <Ross.Burton@arm.com>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
> Changes in v2:
> - Add link to Bugzilla with `:yocto_bugs:`.
> - Link to v1: https://lore.kernel.org/r/20241016-5-1-parselogs-beagle-v1-1-ade903beb18a@bootlin.com
> ---
>   documentation/migration-guides/release-notes-5.1.rst | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/documentation/migration-guides/release-notes-5.1.rst b/documentation/migration-guides/release-notes-5.1.rst
> index 0f1cb5312e1a59fdfff2df57e98b6c4a27bd589d..d6e284c1e8fef2c7dada3f15ffe3c0cecf21a981 100644
> --- a/documentation/migration-guides/release-notes-5.1.rst
> +++ b/documentation/migration-guides/release-notes-5.1.rst
> @@ -402,6 +402,13 @@ New Features / Enhancements in 5.1
>         scripts, fixing some issues seen when :term:`PACKAGECONFIG` would
>         conditionally modify it.
>   
> +Known Issues in 5.1
> +~~~~~~~~~~~~~~~~~~~
> +
> +-  ``oeqa/runtime``: the ``beaglebone-yocto`` target fails the ``parselogs``
> +   runtime test due to unexpected kernel error messages in the log (see
> +   :yocto_bugs:`bug 15624 </show_bug.cgi?id=15624>` on Bugzilla).
> +

Provided you tested what I wrote before sending the patch ( :) ),

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

