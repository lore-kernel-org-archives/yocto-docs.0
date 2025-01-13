Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB3E1C02180
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 17:21:47 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.44])
 by mx.groups.io with SMTP id smtpd.web10.23201.1736788903462008784
 for <docs@lists.yoctoproject.org>;
 Mon, 13 Jan 2025 09:21:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=ak3lfIsY;
 spf=pass (domain: cherry.de, ip: 40.107.22.44, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vHIE5tc6EvZbnCGuSvj1Ny83l2XHHQ94K2oHhsvYgE/pUahZkB8XYQPJ3Nnsbd883uvLV+YtZo1n2T9LB6azCCaC6I/14brImsTHuTdUY0JM4qIVerp3Sy8r1g49H5wvQl0w2OgedRjuaXS0OA8F+XLEEtky4oXtgwuzQWUC1E0QSWSnhGm25s76l8MfbwUrpd3wS3R55ZpVSKmFde/cD2NPaEBYEU+/28W+4LFXiyfOWc/A6tzIDM4knIRks8SoNpstVgcK218gobDhwk72ekTGNbB793u+3/4IrE9e0kXHz40Urv65PJgoaHDwH49pGCVY8gexjNXcnrQOK+arjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w+PCgz0GKGjHrNF664Jkk/XwiE+T8E0slG4z0vEK4zA=;
 b=anrnAevKrd+9fv2TDma5nsD2RLBbfEwX2lMzYJiNN27Y2zMdHjCAsIkRzZb8fHBrjBvB0nQvu0fCzSghPtzdfQB66izDdDuUdLXKcnwKMN+75I8kyXFA16DMx94katR+24Hpiw/CQVtVQ1h+jYgeGAWjmClL5vdAdAeQkpzavuoKFwc5WMR86w6794IYiLFLhnsqL7lpL32ho/OACUk3OVKGgBFze/rlhf1u2Z87SEbwOymyBQLnqp5rGHDmSXC/+BYE/WYabH1hjLwDf+gIrv8Xyo0ZmDlVOfbhjNL8RzkgMMp49DcbpSQOste1iUS06V3kqN9FHsm3TQCi79WVPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w+PCgz0GKGjHrNF664Jkk/XwiE+T8E0slG4z0vEK4zA=;
 b=ak3lfIsY5auq7GQCf/gGiUQwHxM6poPH7T+/WdERKKN7PLw365vjmJ+eMD4DExkw4CImeqX3awag6orrmqUxAuJwJB5YAAPVUTFdGQLOD1h9c6h8ui1pnlpfL1LurpUemx4+wA47+F4rzvXv1Zf2lYlgvOLeSsJ5mBd4xNXwGiU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DU4PR04MB10837.eurprd04.prod.outlook.com (2603:10a6:10:58f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Mon, 13 Jan
 2025 17:21:40 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8335.015; Mon, 13 Jan 2025
 17:21:39 +0000
Message-ID: <3a811ecf-d2ee-4389-bd50-0ffe8a1a6d94@cherry.de>
Date: Mon, 13 Jan 2025 18:21:39 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 1/3] migration-guides: systemd.bbclass do not
 add Also services for 5.2
To: adrian.freihofer@gmail.com, docs@lists.yoctoproject.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
References: <20250109222015.12658-1-adrian.freihofer@siemens.com>
 <20250109222015.12658-2-adrian.freihofer@siemens.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250109222015.12658-2-adrian.freihofer@siemens.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0337.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ea::14) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DU4PR04MB10837:EE_
X-MS-Office365-Filtering-Correlation-Id: 61a859aa-3ada-4c8b-299b-08dd33f6bdd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RHJxYUJBT2Z1bTlEVkNQaTVBdVE3N1JNTHAxaVVjOWk3czlmT3dkUVBrd0RG?=
 =?utf-8?B?RlJMUFhoeU52d0pPSDR3SGw2UzlqKzloN1BMVlhjSklHTS9oSVBCdlp6aTRW?=
 =?utf-8?B?UjFVMzBaMHI0WUo1d1d3Qk5BVld2dzNBWVEvMVJ0WW1sMGJ2UWdlNVVSSTdB?=
 =?utf-8?B?YnZBdzdTS2xKeHZ2TFRwcnV0eHdkdmY2VmFsb2hOZjU3SHdmaklheWVEejc0?=
 =?utf-8?B?TW83bHdCV2lJcWhGemFPTXYzSFNudGs4T200dWQ1c3lLMEVPUC9PSVR2TzlE?=
 =?utf-8?B?WkNFTjVOKzBnR3RneFkzNWNjcWdNYnlNNnIzaWhvNlFqNVFEYVh1WWozdm5Y?=
 =?utf-8?B?NmQxNkp1WjU4YXF5eWtyd05tWXcrMGQ3VDlIS3V5cmt5cC9ra2ZyTUkwSHhB?=
 =?utf-8?B?THVmTkZ1YzN3b1dCNGo5aG42Zloralk3Vko2UWFoRUR3aFRtWjA5Y1NZczdG?=
 =?utf-8?B?NW5zQXFNL3RWVzV3NUxiK01jTjNxTUQyUFpZNXMvalJwZk8wNWdQSXNKL203?=
 =?utf-8?B?UGlPT0hXbmtHU1Zza0NrMnVpSWZvWWtGc0pkTW9MaXMvKzZBYW5uMUpqREFt?=
 =?utf-8?B?N2NYUXZUTzhGWXdmNDY2dnEzeGdJUkRQMjY4SHJGam5MOFZ2S0JoSGZlRzIx?=
 =?utf-8?B?Sm5neGZRS0ExeG1hZUtxdVhodlpCVTVkTTZtUFV0YWNUSGVMUDZnd3FhS0V4?=
 =?utf-8?B?L0QzcW9Cc3l3b2NvYk1JU2RQazVYZS84R2lucE1IU2Yyd2NqQko0NSt5Wm1j?=
 =?utf-8?B?dm5sMG9YaVllcXhENFZpSnNLNWpCR0RtNjN2L3NabnA2elhFRldHZ3BLRWgx?=
 =?utf-8?B?RzJxbGJxVXV3b056NFpBWmZHeDZPY3dJOGJTQXJ3MlRuekdTSjYxUEowQ3Iw?=
 =?utf-8?B?NjhYTG5YblVLb0xaUjRZdG9YMU1xa28xbE1KaVFNV21yZVdkeFQ0LysxUEpu?=
 =?utf-8?B?SmFleDV0UEYydjF1aHZwL2RTTkVrMjhVbWczRzZBSXlwTG43OVliY09OaVV6?=
 =?utf-8?B?Yzd2c1hsZ0I0dmVxSzdwUllJOC9LM0NxUUdpVWxXNkZISm94RkFhaTBJWmd3?=
 =?utf-8?B?OFpkYVE2U0ZpTk95YmJ4cTF6bmlrL1Vrdmg1WDlvejlhMmRvcUFIV0xlenpv?=
 =?utf-8?B?bHpnelBieEtYQVBxUmtaNkhzaTFWWjBFMmpMTElBTCtUMVNodEp6MXdXZTV2?=
 =?utf-8?B?RlJuK05KT2JBYlQwVUh4MU5NTWNmaStmeXFEdzk4dE9oM1NhWkJtekExSXln?=
 =?utf-8?B?RkRsL2V4WlNpY0haTmRZY2phWmN6aTRRMmdxY1NHNGFDa3lIV1lCM0JsK1cr?=
 =?utf-8?B?d2haS05mcDN2R25GMFlQQXJiOTVVeURhWjBjYXlRTUJmUlJVWHRzT21RR2tt?=
 =?utf-8?B?UWFOMTYzMzVaQ28xb2lUK245WWhLTmJyQUZmeU9zbFBjS2lkQ241WkNUT3Zy?=
 =?utf-8?B?ZDVkR202OHFuTTBkQ0FZT3ZzWU1WcVFSZWpQT2RhMTh5aVhaOWJaUFNjVFVO?=
 =?utf-8?B?MjFWSW9ORHdlSEN1YWJSVHYxN1crWk5QUlhvUVhkdGJkQ1ZpcGNqNG5TRU5G?=
 =?utf-8?B?Z01va3RYZUFDOEVOZXJUZ1VLeFJmRnBkYnBEZ0E5d0tEZlJiS0FVVlM1ZmdN?=
 =?utf-8?B?OUJITFhiODBsNG5lb3lvcnpaeTlSeFNlZitaNENNam1sWko5RnZYaTFEaUtE?=
 =?utf-8?B?aUo4SmtwSzF3VTZkaU1hQUlwd0pZRzFZVDhXVmVzUThyVGp6VFQwSVdaRnVR?=
 =?utf-8?Q?zUC/Pwg4N78dKUkvvHVPDWfcC15EVVwumEZXOxI?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?d1lQRWJtcjNKMjlhUkpXbkE0SDl3dklsaE51d2xVUjJ1ZlVvTHJSV0RIcXlE?=
 =?utf-8?B?STQ5bDdaWERrOXY3a04vS2hMUzJRRElNMzZmVGFJUjd2SXFMUkdaenRiRStG?=
 =?utf-8?B?VnpENnBwZ0ZmdU54VmU3S2lhOGlNZVJPOXdYaUloMHZRU3BjVWNaRDF3cU9J?=
 =?utf-8?B?Rkd1ZXVWdkhlZ2JFeUVBb25iM1hxT1Z4czR0S0VQZDVPUEk1R3pHWXNSTGJx?=
 =?utf-8?B?RUFHMHJEWGhDbS9MMUhnYkhVeW9LUldwcmhNVkkyZEVFQW1GU2FIcFh6RVNk?=
 =?utf-8?B?ekwwdmVoN3hrRnJtY0dqbXpYcnlrblYzKzYzQmUyeTF1MXNvSGFOb0ttKzFw?=
 =?utf-8?B?Z0JLWFJwR3YwL3BPUUY2VG9EZmF4eHBxMElESE5IeDZ1ampidzFWWnFqOFVN?=
 =?utf-8?B?VmdNNHZHbkFwTDRRNVdEVnVia3pSUzdIN3Q3S0pEVzN5c0wvQVgxQWUvcVlT?=
 =?utf-8?B?QkY5VzMxMmVQZW8rMHRscVMvcytSdzJGTDlnbmRyeXAzeTd1TjhmaUxRR1Nt?=
 =?utf-8?B?UnRJU0pJeWVpZVNjSTJxdnFLaEpWYjFHOUQ0VXBnbVZTdFNMT3k4SHpUdTZp?=
 =?utf-8?B?cTdKUm5TcE50bFJPK3ZTd3ZBZUozbFlSc3Q2SVZDR2dJSVFyL21HT1lkWVYy?=
 =?utf-8?B?cG9KL0REUkdoeE04dkhTR2hrVG9EaU9XcTNhdlgvbG12RGYyajB4SURGL0VY?=
 =?utf-8?B?cHJGSFZ4SzE2VkFvOFdseFZRNlRsbWR4MjhwbnRnMXJ4WVQ0cEdCYXN1cGQv?=
 =?utf-8?B?RW9IK2h3clRPZ09wcTQrVWxqR0RKSERBVlNDUUMxY0lsNC9RVXZaMmVnVnl6?=
 =?utf-8?B?TUhYMjFvN3FaZWUyWVRvZ0tmaHRSQ2hSalkrWDRudXI2a1FrT2IvM1lqb2tQ?=
 =?utf-8?B?YUVxL1NuVVlsVHlQR1Exams5OTI5Y3lrYXZlVFQ4Wm1DR3YzNStXRVF5T3Mz?=
 =?utf-8?B?WVNkWTVLK1pSNVFIS1hOU01kZWNzQVYwWUwwNGx3c2ViNzU5azllQ2Y0eTBI?=
 =?utf-8?B?eTlHdGdVdXdQMkFWRytTUkczd2pGNXJRZVJaYXNXUzhlVlFqbXNhNmE4SkNl?=
 =?utf-8?B?aW11clhaT01UcW5jVzZZQVFjaFo5U0lSWTBqZCswUVMwYzVNME5KZEU5a0tL?=
 =?utf-8?B?QklpQmxoakZ4TEh6YURiVGlLaFp5YzFaMG9RTS9nNlRUQ3d4c0VYT21MVWIz?=
 =?utf-8?B?R1dyNGZGNUFKY28xZktYREhQZHFsWkVjTGJPQXBiT1BNS1lUL2c1VDQ5Nldn?=
 =?utf-8?B?VG5WSWZtbXFrSnRORm9ERmk4ZGZpT0F0cXJBZzh5V3VDSHRRalpYQ1d4cjVY?=
 =?utf-8?B?YlM1RVp6NXZwYWF2U1RVWldVUnhZc1VEVGtWbFpGRnJjdnZPc1NRaWJPUVRL?=
 =?utf-8?B?S1JDZ0g1a1ZIQmR1d2VDNytVeVZxd1ZBcGs3SnFabE5mR2t4L0R0R3BmZFY0?=
 =?utf-8?B?b0JrNmZlSnhrbTMxTjROa3d4d09rNUtWYit4SUw5d1RYb1dFQmhnSm5JNEY2?=
 =?utf-8?B?eXo3YkNGdUJXa2VIeDlyZW1YcTlSMVY0aXZwMnNRT2JTeS9ybDJ4dW9jM0dm?=
 =?utf-8?B?R285OHBzSnEycFo3MEk3R3J5R3ErYjJYdmEwWlp6M0ZjRlp3SzBoMitvVEVr?=
 =?utf-8?B?bnAwVnBJWDRmNUNBRzd3bTQ4S2Z5anJwWlo3aGZZdW1vVURqT2ZOcHJadTFx?=
 =?utf-8?B?MEM5cjdLTURDT2dOTHpJaTViZzdrbFhkc3M1d285MlNXcXZaRk5sSVZ1VEhG?=
 =?utf-8?B?OVdTbTlsc3Q3Tk16ekE1WWZaMWZVRmNucldNcjM3c1JCeWZXaWFlWjAyc2ZZ?=
 =?utf-8?B?S3NENUlYWVlqNkgzdy9xZjc0ZnNTMWlJTE16RDNPTHhBYmFSb1NLVHJ6LzBy?=
 =?utf-8?B?cTFTcFpLWGFtMGY3WnU2d2s1TGtFUXdaNUp0K2hzb2VvU1grS28zcWEvemFm?=
 =?utf-8?B?RzVrU1B2bTN4YTFGUmM4R3dpUTlZTjRxdW9CSytFLzlHeXhFNDUyUmYrUGN1?=
 =?utf-8?B?OCs3cm5MM00rVVJjNTRObm0vOEpuczdhbzVRaGxWbVNVZkZLMHF3d2syOHhy?=
 =?utf-8?B?TUQwQVBoT1JGcjhPTVBCUHdrc3NJTndEVWRaRExXMDNraGZpSDEySTlTVWxB?=
 =?utf-8?B?SHJKZkNNNlZpR1p6R0FtT0tNZWZhUVJPb000VTJ1WC94a2hIdWs0T2V5endo?=
 =?utf-8?B?NHc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 61a859aa-3ada-4c8b-299b-08dd33f6bdd5
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 17:21:39.8775
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DOTV9AEw8j3jHtLRwlHcN0ClihY87vPpog5UpYA1JudD1s7b8JSxkSCAVyqal/HUkKtCAxmEMSObOzftU/4rLnJQnI2Gpe98Cj3EuuMcHps=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10837
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 13 Jan 2025 17:21:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6091

Hi Adrian,

On 1/9/25 11:17 PM, Adrian Freihofer via lists.yoctoproject.org wrote:
> Covers the chagnes introduced by commit
> https://git.yoctoproject.org/poky/commit/?id=efa5f65c2214239ed7aaf7bd8998683e755c5660
> 
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>   .../migration-guides/migration-5.2.rst        | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
> 
> diff --git a/documentation/migration-guides/migration-5.2.rst b/documentation/migration-guides/migration-5.2.rst
> index cb70e19da..b18ae30d9 100644
> --- a/documentation/migration-guides/migration-5.2.rst
> +++ b/documentation/migration-guides/migration-5.2.rst
> @@ -74,6 +74,25 @@ systemd changes
>      As a consequence, the ``systemd`` recipe no longer contains the ``usrmerge``
>      :term:`PACKAGECONFIG` option as it is now implied by default.
>   
> +-  ``systemd.bbclass``: If a systemd service file had referred to other service

``systemd`` ?

> +   files by starting them as
> +   `Also <https://www.freedesktop.org/software/systemd/man/latest/systemd.unit.html#Also=>`__,
> +   the other service files were automatically added to the :term:`FILES` variable of
> +   the same package. Example:
> +
> +   a.service contains::
> +
> +      [Install]
> +      Also=b.service
> +
> +   If a.service is packaged in package A, b.service is automatically packaged
> +   into package A as well. This happens even if b.service is explicitly added
> +   to package B using FILES and :term:`SYSTEMD_SERVICE` variables.

s/FILES/:term:`FILES`/

For all the above, probably ``a.service``, ``A``, ``b.service``, ``B``, 
for words that aren't English.

Looks good otherwise.

Cheers,
Quentin

