Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43CCFCAC592
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 12:45:17 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.64])
 by mx.groups.io with SMTP id smtpd.web10.15514.1758285908711241871
 for <docs@lists.yoctoproject.org>;
 Fri, 19 Sep 2025 05:45:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=SjO4bemh;
 spf=pass (domain: cherry.de, ip: 52.101.83.64, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XoihH3hXey4N52+deJpdcIkUVdaXknBtI8nyRPV/Nz6wdkWvjJqAs/IR4jSI95KnP8PI144cHRiL+9Ap5mxL5sjw+TCeyj90uuV1L1BwyCDO2sUlW7FysDVxa8/aP6Do4O51eLTp3x2jdXBH2fj/bstvTwVJ6pOCiFgOnxBIKdcF+ESpNVrZV/zrqao4njn22LR/avImjiNGkJs6Tt9LOTXP2wCqTbDPA/lkboF/UMKErwTnIeViOQpA819TNjWOlt7/VhFG4i4qysUHiBZJtNhmvfQSfeLyCfcBYE+if1UGcbwZwlHcO/buQM/krbPj9SV+s+e5ti07vaAkHxf1Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hUL3CA840d+zEGs7Yx2qgmHJTISaGVKqr3pGNWHir60=;
 b=idf4gjd0vZ95SCNmADvJN2KsoTjDDKc0wi+epQqdXSas4HoR6KUJZRnTSFcwlAIKwNpzE/OAuRU7tRttQlCwr1Yo4YxVMCspl22LYH7qZMheETEzS4YGJU/aNv1R+uCcL14WLj/ILFGYQojBNssJ7AFAEMIHkSRoe1GNq3Tj9d5EvvwOKmbg2JQnZVnib20gR6J5qmJ6V7tB24azyL+L9ofes7GDgZtRUlOLH9ru9dOdyQ6tinQlZ1zNG86KhA2QD81Q06AmkitfuXa6IiRtify98zPkirZBGXt59YK8ka69UUHhG0SoBDMpANwYex0tt0BR8Us56bdY18Eke5/PXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hUL3CA840d+zEGs7Yx2qgmHJTISaGVKqr3pGNWHir60=;
 b=SjO4bemhIRqAlWEV/ZA6lGFuIRsLLISZjPocDKX6FUHv6COF+re2G6IhBh+w1fwz4TiQ8zEE2SXxT3GYyvg2HQiZpJPW00FdUv6+pFfQ01vZjm+WRizcmyBp5cwJX/qHK9aWEB6nMRn6cmtnd089/ynCTqytEDj4FK6tDZuiA8w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
 by GVXPR04MB10045.eurprd04.prod.outlook.com (2603:10a6:150:11a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Fri, 19 Sep
 2025 12:45:02 +0000
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea]) by AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea%4]) with mapi id 15.20.9137.015; Fri, 19 Sep 2025
 12:45:02 +0000
Message-ID: <2689006d-9e2e-45b1-893c-22f472d2057b@cherry.de>
Date: Fri, 19 Sep 2025 14:45:01 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dev-manual/layers.rst: yocto-check-layer: mention
 --machines and --dependency
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250919-update-compatible-doc-v2-0-c428da260487@bootlin.com>
 <20250919-update-compatible-doc-v2-1-c428da260487@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250919-update-compatible-doc-v2-1-c428da260487@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0313.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f6::7) To AM9PR04MB8906.eurprd04.prod.outlook.com
 (2603:10a6:20b:409::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8906:EE_|GVXPR04MB10045:EE_
X-MS-Office365-Filtering-Correlation-Id: 930be7db-19ef-4c4f-aa00-08ddf77a59a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?c2JlWC9INjZkZk1ETmFVOU92Qk1DZWV5UUtVTm9UdytQaFVTd1JsSGFvMUdk?=
 =?utf-8?B?R3poWFE2TE1sYW5PQVpsQlFMVDJTbEpnWmR1QVBoRHhQbVBKTVN2ZnltWCtB?=
 =?utf-8?B?RTNsTUtVVDUrVCtOdUhQVHM2Z1pmOHh3aGxSUGRnZ0dVWWVuS0FNRGNGcDlG?=
 =?utf-8?B?L0FnMzV3VkRVOWMzTm9rci9HeVR0bzY4ekI4Q3JHYUZYM0V2bWhqd3U3c1h6?=
 =?utf-8?B?ZVVlOGxWNnlZNWNBOFljMWxtM0RXZytxRWR0SDJkZXR0NWJoSjdmZDByTElY?=
 =?utf-8?B?bXhDaloyakRPVCtPVWc3b2traVlFRGdQenJkNElONjFKYXFESHFnaVQ0dVcx?=
 =?utf-8?B?dDVmNloyNjFsTFhSVVRqNElsQWtwcFloVEZVcW5XWU0wR213ZWU5bzk1L3Rr?=
 =?utf-8?B?ZDExK0tRODgxN3F4dHRzbC9lajR4b2ZucEtmOVVqN0NIY0hObHpFR3FXTTFq?=
 =?utf-8?B?cEFkYjZHekh4SEp1dktaUWZFTXF3UWg2WmhDRkw4bms2OFFoRThqUzRyd1Nv?=
 =?utf-8?B?VkFvMG1hc0pNWmJ5Q284MDdFREpEd1htQlF2R0VGa1VQazhCdk9sMWx3ZHhr?=
 =?utf-8?B?U01hZGRqcnJ1azZBK1lGdmkyQzdKVmV2OUpFY2dxWWtqdWNzRGNwcjZZQ0JP?=
 =?utf-8?B?UHl0VTlsRlYrTDhvNTFobEljZU1aRWJZM201NU9pSFZEVVlDcXpWV1hLRC9w?=
 =?utf-8?B?ZFh3dEYwT21xdmlSdEs2dy9kU0NEb2Q0ekk3TjNZTzVsLzJHaVBqSVNvbUkw?=
 =?utf-8?B?TnBKd204ZDViNy80eHF4N091aG5lWXlhMUJ0VVNKZlRIdEVMV1BtMnI5dHVP?=
 =?utf-8?B?bTI2WlU3MG1pQlpIcTlTVzNWNDEyMUdIUzU4RTh3b2J6Q1R0TXRPemU5cFVh?=
 =?utf-8?B?QmU5YjZHMHA3Q0ZzNFp0VUVvN094MmFHd0FVRXVUekZQVE8wYVorWUhvSWEz?=
 =?utf-8?B?dmVEL0NoRWFHN01iUVpsMWJ5ZVB6ZG43Z0NFY3hGdlBzTDJYa1NzbGRoTGZB?=
 =?utf-8?B?NGl1STZSbmJzYTYzNEFmTlNpNDR2ZlQ1YTVPMUdDNFBROUpHMzBYZENYVUVk?=
 =?utf-8?B?VzNaVmxpekQ0OStQTWE5aWdmVHZJVU1DaWdDV0t0R0dSRm4zR1FyTnh6RTlL?=
 =?utf-8?B?bGEwS2NtN1M2TWtMY1JmeEZhcEkxbGtxaFhnR1NiTkNIdkp0TzE2RkpHNWxn?=
 =?utf-8?B?OTdDRS9uNTM5RVYvQ2pmWFJ1SmdHeHUzN2t1cStIRmltUndlck5FMjRkeDJz?=
 =?utf-8?B?S1NRNmtXdXVvajYvNXBLaWNzWG5INDRkbEZ4VCtFKzFUcU1rdndhdTM4SHI3?=
 =?utf-8?B?MW1Ob3dHTU1zcGVyMDNzbjYyRjFRZytuRXMxMjVvTXlFanFmSlBWdE1zUlhl?=
 =?utf-8?B?c2liQnJ0N01CUzBXVXhCakZ3T3BtSHhzZFgrdlFmRWMxUFNKdkJFY2RIa3du?=
 =?utf-8?B?N1FwSlBsVjJocUJxN05zK3crQmpBWXozV0hXd1pnUVlkTW1WTkdNVDVxUzl0?=
 =?utf-8?B?Nkc0VktYQTRjTGhsQ2hSRWovY013UG0zb0MyNUJ1eFViUExHa0RJTUNMNFM2?=
 =?utf-8?B?MHFSbnl1Z2o0TWdRY2FkM0xhTjN6akF4VDJ3c2QxOEcwZE5rZDNuaWZhekJE?=
 =?utf-8?B?YkxPdUVvLzRzeTBNK0JIeTJLeTVsNVVxczhudzVJVms3dDBVR0NJMXZwNEtp?=
 =?utf-8?B?ZHIrVXhadVhoWUMwODJuVStWVkpaUUQycUV1Z2JxU0h4d3diVUh1K1g0dFlx?=
 =?utf-8?B?UitseTg1VlBMQXdUTzJVZ1cydmtvdlBYbTI3SXFDMGZCUEh4WTFzdkMvclpW?=
 =?utf-8?B?VzJCT0twOFNLNU1KWCtSbW1saVdqckxrUHpzcDBhMnowdGxUSTBXUXRuSlZa?=
 =?utf-8?B?N1lIUGJuT2tnbnk2aXdyUTJIZmpoQ0FLSGFyWEE1b2RZYXhCR2N3QVhqR1V1?=
 =?utf-8?Q?cJtGjC6aWU4=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8906.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?R04xL2VBNHFBazhJcDNWQjJDcjBNdHpQNXdLaWo4N0ZkWFNyS1FnbmdleUdl?=
 =?utf-8?B?S0JRbHpzTW9ENWtMR2xocHYvTFFDclAvZGJUVUJaOThSTjhiZk1jVGc2bEZB?=
 =?utf-8?B?eUxwbUE5S2dPaTd4azEwUyszbjlPcFhwYkh6Tlp5MTErK2NDcmVlL0JSSGxX?=
 =?utf-8?B?OVlud3g2YnlhSzl1WXowVXp2RERzMDZmcVRndHVaWkxwVnBqTE1zWmhaVmFn?=
 =?utf-8?B?WlNZNWJLdTZIQmNuSGNiaTRwMExVd3dLQ2Vtb1ZKaGxuSXc3d0ZUWVpkR20x?=
 =?utf-8?B?aUY4SVp1bVBQRXA4NzRCTUdHTnJvWENyS2RIZSt0MzRWWW1JOUQ0M1E1cTIr?=
 =?utf-8?B?dlRTRFpPVmlodkRUL2hFcGVGUXdxTjZLK29KaHNROGZXNlB0Ynl0WllrbDh5?=
 =?utf-8?B?d1NMTkhvYzNzODVXaWQ0aDd4RWV4dkhTMDFSVU1FdFg0UE1ycmhkcGNkeVpj?=
 =?utf-8?B?NVlzTWhXZFRvWndKZzhtWFpyWHFqdSs5Z20rYnFsYXk1Z1FxZjl1dS9zNFpG?=
 =?utf-8?B?amFJS25KbVp6NjBEcHFnYXdPQkVJWUQ5Q0lmU3ZSYTFmNGQzaFBQRU4waXhH?=
 =?utf-8?B?WW5mQitJOWw3OVM1L2pqNUdZaG1YWGphenhWaTBsTnJBQmIxejI1SDRrT3ZS?=
 =?utf-8?B?a3NHQlpjNVlrQkFXVlNnM3RaaVpDYjNPNVVmU2F4R2ZsTjNFaVFvbzFOOTJl?=
 =?utf-8?B?WitvTmlreXQyK2xPSHNkTVhhWXpxanIyMW1aeGNSejZLWWxxb0NpS2lPUUwr?=
 =?utf-8?B?OVJUbzNqTUNwSE4xTGt4OFR6aTcrbmdraGMvU2oxL1dkbzlBbVVhVXZTNllC?=
 =?utf-8?B?TEVEbVlGSTNCdVRDYmdyMTlOZWY4OUcvTmhoTkVTenFmNnJGNlF1VlNJWGgr?=
 =?utf-8?B?R3diQ0pWY3gycDNJckxFSUNnWEFiWlBzM3UwOXYwc0VEaGdpdFU3Tmt3YU8r?=
 =?utf-8?B?aXJaMllzYm5MbXNibnI3dGo1M2ZwVWM3V0UrMThEelIvbE81d1lsN0dRNWlj?=
 =?utf-8?B?NW9HTUZRQ0VBelhXbHZzZDBKUWs2a3JQSXBzWVpiTHZBVVJUQ0ZHeXAxNVU4?=
 =?utf-8?B?cHNEclovUDdjNnBYYlBNNjR2T0dBTEtaQmh4WEhwS2drRlpxQ0psZ3JjREFj?=
 =?utf-8?B?ZTlCdEdmMVdIWU52UEczREJVRUEvcjE1OTNnYXpGNmVNOWp6ekxzYWhocS8w?=
 =?utf-8?B?OGdzOHA5YkpPUU5YMCtVaDcxelJxRnhJRC9wR2lhNllWcVFnZGR6Y0JnWnhT?=
 =?utf-8?B?dE5EVG5PZjViVEZsZndDdUpnT1pBZlhvNnlFUi9NWFVHVVhCR0FwKzVIaWRs?=
 =?utf-8?B?OTl6Sy9TY1ZsR0dWV3AxU0VDNWxneVgxSVdRV0oydzJXWk5INFVNVHp0SE80?=
 =?utf-8?B?N1BWUmNqNG1lZUl6NXlXajhwN0tkSUV3emZhSnFKYkEyN0p4SFBNdVR1SmVJ?=
 =?utf-8?B?REdOeUltOXN6MkZzWmNkRDNlRDFZSTZzTXJoUVNvNFFDV2tzVnoyZ05WQk1O?=
 =?utf-8?B?eXM2NWVaWVpSNjFpSjA4MDQxemdQejRId2tQMkVYbytHVFBQU3ZPTnM3Mk1O?=
 =?utf-8?B?MDNCUmNvc3Nna3UwYUsveGJ5OFRlSFBCMjFtNzJuWVhNS2tQTm5PbVlweDhz?=
 =?utf-8?B?aWFMSnhZTHpZTnlEYkdxVUlmbTBRSjhjK3hoZEFVMEJpWjVENGovTU1JOVBP?=
 =?utf-8?B?ZFp3YTcyRkp2RENDQllUSVNwb2Jkd0p2TDA2UWhmRy92U3lsK2xEK3UvZnhG?=
 =?utf-8?B?RGtPbGtxOUVFSSt5d2NEZFlNUEtmMjhYZnpvWmwxTXRNWUFEbnU5c1Bxdi9C?=
 =?utf-8?B?OXA0Vm83a0hObzNNcTF2UHBUZnIyQ0dtZGN4UmxjZXZwNkE4dkhHcXAwekVz?=
 =?utf-8?B?TG5JV08yN1lFZWxSUjhPdDFxcEllcGJScTRTWmJDSEd6RGRXSDA4cXFqK0lo?=
 =?utf-8?B?WlRad0diQXFWcVU0WmlNZFRBZVZBdi9tVVFNNzJwd1dvaU4yUllRUnhBbTNo?=
 =?utf-8?B?cjdUdWZ3aHIxemxEeWV4T2Q1b1ROVThPVVhwc2l4cm5kU29Zek5PaUFJU05r?=
 =?utf-8?B?UFNYSGh2T2hsaytWTVFnT2JHU25XQWtob2pBZWJJWS9kOG15N0kxNDJxWWRG?=
 =?utf-8?B?ZTUzWlVUTHpjYStTb0U0Tmp1M0grU2dEQS9hR05yUkozNEUrM2M5elBHV0ZI?=
 =?utf-8?B?Y3c9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 930be7db-19ef-4c4f-aa00-08ddf77a59a0
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8906.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 12:45:02.1846
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JtAMI8Fi7qK9qxmPpsaBl6KAsjLy5mxSljCwCPISwqbOh2YP0GcEhehX18HZaTG7/yeRDondF5g+srVlb2w2KiyBF2sw2jJ0/m2Zs65RPGU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10045
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 19 Sep 2025 12:45:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7564



On 9/19/25 2:18 PM, Antonin Godard wrote:
> The yocto-check-layer script should be run with the --machines arguments
> to test the different machines present in a BSP layer. Mention it in the
> documentation. The --dependency can also be used so also mention that.
> 
> [YOCTO #15974]
> 
> Cc: Mark Hatle <mark.hatle@kernel.crashing.org>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/dev-manual/layers.rst | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/documentation/dev-manual/layers.rst b/documentation/dev-manual/layers.rst
> index fbf3f1a33..bba46b1d6 100644
> --- a/documentation/dev-manual/layers.rst
> +++ b/documentation/dev-manual/layers.rst
> @@ -376,6 +376,21 @@ directory::
>   Be sure to provide the actual directory for your
>   layer as part of the command.
>   
> +For :term:`BSP <Board Support Package (BSP)>` layers, the ``--machines``
> +argument should be passed as part of the command::
> +
> +   $ source oe-init-build-env
> +   $ yocto-check-layer --machines <machine1> <machine2> ... -- your_layer_directory
> +
> +These machines are the ones present in your BSP layer, in the ``conf/machine/``
> +directory.
> +
> +You should also pass the dependencies of your layer using the ``--dependency``
> +argument::
> +
> +   $ source oe-init-build-env
> +   $ yocto-check-layer --dependency <layer1_directory> <layer2_directory> ... -- your_layer_directory
> +

question: relevant for other kind of layers?

I guess it is also relevant for other layers (distro and "common")? If 
that's the case (it seems to be, I removed --dependency and --machines 
and it still complained about missing dependencies), then maybe we 
should put the --dependencies "example" above the BSP one?



I'm also wondering why we don't automatically include all files in 
conf/machine as options to --machines instead of having to include them 
by hand? But that's not a question for the docs people to answer :)

Finally, it seems we're missing a few tests in the list of tests, e.g. I 
could quickly identify test_world, test_security, 
test_world_inherit_class, test_patches_upstream_status for example.

Cheers,
Quentin

