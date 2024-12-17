Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D959BE77184
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 14:32:28 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.63])
 by mx.groups.io with SMTP id smtpd.web10.82730.1734445943645827239
 for <docs@lists.yoctoproject.org>;
 Tue, 17 Dec 2024 06:32:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=FVsasIRt;
 spf=pass (domain: cherry.de, ip: 40.107.241.63, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LPHRmKwZtMX29Z4Nd9cNt4Hqe0yWTHIJOeVL+F1ikUhy50QDLOUm/0A5p8Pn+z4VebRmT5RqI/BEkm71zerBp1zS3YMrbdn+p74qmdzHOsK+QdiB0C7jGWQgxctNZyxrKoxrrNo4VuAtddX6Y4/MWKUD7bEV/Zuh/diWp/WYdjMXSjUCYY8YuXULK0hiTeHyRS2wazN0Ke8OukkKFVcvCGI13MutgoF/oZOjDYwq3PmUrkjDe7eVuMJzfcuIWbIdJq70qVb388bfs5mRUJsqIq0WhtfixTiVe3owQFa4Mjd8xAfQrzNmNjFB8XCDD0oiu0ekg/d/0smY/x67Rt5ooQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pyk3Nh+mw8xjvxKoDAYmou9kmuhB/H6Jbzd9DOY8fk0=;
 b=A9vnxcOmlZudHcEBnPQy+GwH6C5cerZaRmNF1OCqUjetexzaqI8rVgrWclAKpm5eI0Qam5Fo9uDzQiGUJxl6BAA0kJ8cGn1XPyi2CBBm++4D/ldS8/V/6ti4Ma/mtOiMifXoTOECo40driJhUCt3QVIntATaELo2CiA3FGOCO/M0cKJIxlJBS/Qu2GNvIZJvy+VVMPJkfolP4bfFTmUmiWQ4gtGfbyOb3Gm+9J112Ol9ppnX0mWjBGrygCJ1w/MrAIrXiM7m8X+4F+MVv8R5jVg2KWQzu6rke8kjHWZykldmoO7jtIqwmw9YcOKiKIuU14ndh17+19DQWEd85q8ptw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pyk3Nh+mw8xjvxKoDAYmou9kmuhB/H6Jbzd9DOY8fk0=;
 b=FVsasIRtMAd9O0wn+TqYbt1mpfiYeo5kvfkLTULvKi7zwNXaE1anPJS48YJEgqpkVI0hHXPVteZbPqZaAeHZASm9tbz7+QSh7jNAVzcpMo2R7Hcvx1zVd9EK+xIKosSw5qBTptc0wboRSxz1HLS+pMFPru0W1b99WN1iZ5ZWsX8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM9PR04MB7683.eurprd04.prod.outlook.com (2603:10a6:20b:2d7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Tue, 17 Dec
 2024 14:32:20 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8272.005; Tue, 17 Dec 2024
 14:32:20 +0000
Message-ID: <eaf97076-1044-4bc4-af35-423c017e78b1@cherry.de>
Date: Tue, 17 Dec 2024 15:32:18 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [yocto-docs PATCH 12/14] ref-manual/variables: document
 the CARGO_INSTALL_LIBRARIES variable
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241217-release-note-5-2-updates-v1-0-b189493b1b09@bootlin.com>
 <20241217-release-note-5-2-updates-v1-12-b189493b1b09@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241217-release-note-5-2-updates-v1-12-b189493b1b09@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0079.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::19) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM9PR04MB7683:EE_
X-MS-Office365-Filtering-Correlation-Id: 254debda-d53e-411f-0a9d-08dd1ea79d02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cVJlKzg3UzZZWktXbTdrNERYNm8rbmhwZDZIano2N1c2Ti9CcFVUaDBkV2c1?=
 =?utf-8?B?TTE0TlFiUW1EZ3cwZ2M2a3VzckJGVkdudFJOTytPNGhLVFlBS0dxSjRCMWZu?=
 =?utf-8?B?VmpFSlREbzA4M2MzeThkV3A1RnY4bEZKZU9SS3BrdWEwSzVMOXoxWlltczNU?=
 =?utf-8?B?V0dSb2dqOHZ5d3A4bWdkUnZSU1ErL0dNaCsyVzl4ckdoMzVOMEVvZ09nUHB3?=
 =?utf-8?B?RE1CSTh3b1RRVDhDRXlURXNQUkRObzJ1MS9RVkpMRGhramhXNHIxY28xRHhN?=
 =?utf-8?B?VC9yZ09renhvMXAyK05kUVFha25FUnhGSmh5aDAvbkZiTExKWm1JTkpwdHJh?=
 =?utf-8?B?Y0hHNzVocjIvb1dvanl4SWdaeGgxZ3lPNkZvdEx3Y1JNQ09yQ21XbmRHRCtP?=
 =?utf-8?B?WnBLb1FtUXkzdGltcWRER3NDdlV6UEIwS1NoRmF0NllsZDg4WDZ6VVR4aXBY?=
 =?utf-8?B?cUwrM0d6SnlXZU14c2g3bFcvMzhOVzZFTUs4VnVyMzRzUzdFL3NKMkcwczBi?=
 =?utf-8?B?bjFsWkJFcVFXeVlXYzVJdzFyR3ExQTFBNzd1OGlybFgwNnRPbDdkY1hHcm9N?=
 =?utf-8?B?MkdlMTdyckNmVzhJM2hTTDF5ZmJkRUJyUkNueVdHTzJTeXk3VU9yS1VMWE9q?=
 =?utf-8?B?QXIwMlRkdjRUcGRsaDR0L3d4TjRIMzB6UCtGOTZYdCtlSVk4eDlhb1Eya054?=
 =?utf-8?B?SHhlTFIzSm5ueUREZ2JzaHZ3Z0JuQm1KTk1sdDFGUDdvTXNsN0ZsaWZRcnlB?=
 =?utf-8?B?ejVieGZKUmJzbUFBSHNTNlpvV1JWdFhWK090ZmN0YmpXbFplZGVVN05VU2NT?=
 =?utf-8?B?QjQzRHhiQTVwSllOeUlxU01oV1NyTEFsMmIxcGtCWklFcmlOUGNsZGt2Q0lV?=
 =?utf-8?B?Tkgvb1cxRWVESmltSktzSUo0NUtIVXRwTXVmMmoxZmFuVVNSWmtOaEZLbjI4?=
 =?utf-8?B?QXFoRVhCYWsrWlduRlVVK1lLbU9MV09xWkNFU01KUXFJZVJ1VEtUMnFQNFV5?=
 =?utf-8?B?blFsVjk3RnJQdWZ1OGRESjVUb05FMjRIT3g2TUZnaEt4UlhvNjFhbmR5TC9G?=
 =?utf-8?B?NEh5RStjWlR0U2lpTUpqeWExZFpoSkxVVGp2T1lqa0o1OUEwUm5oRFpEa0FP?=
 =?utf-8?B?eE4wek1lN1VxN0lHYUVpWDdiVmdVeGU5U1dOSVgzMEtNWmsxSE80d1Mwb2Fk?=
 =?utf-8?B?WXkvcUdBU0xXM3psT0lkREUremV2dEVGd2VMc3BHTkU0bU02SHI3ZTQwUzg2?=
 =?utf-8?B?cE9UYTJ5b2xubWYwdGMyK013UU9LWm12WHRYNUl4QTVndkVMYTZpVXNEcXpR?=
 =?utf-8?B?QThWMzV0VDZMVGQrZVV4TWNneUZ2dnIxUmVqWVcyaVhKMGNuRDlYbWp2L3Qv?=
 =?utf-8?B?Wit2QzhKbU9XRExVN1k3UDA0Y1VQSGIxdndNUzNDczhRckxHZURsazQ0c0Vu?=
 =?utf-8?B?bmV3OW5yd2xkRkUxdHZFK1NaOW5EZTlhYlpEVjJOdkNTR00rNjh0UlUwRWx4?=
 =?utf-8?B?bS9mT3dpdjR0VFNKNlJTUFd3QXdQRXlzNkY3azBKWGlaS2drZm1rMkROMmZI?=
 =?utf-8?B?ZW1WaFBHcFl6cERPOUdwWDEyR3FNSG5XakYwSFJVRnVhRC9LVmNDTnRYMUFQ?=
 =?utf-8?B?OGsxNUhRdEM1ZlMrcVN5UXlCcmdVQTZNSkRQMGdYSWQ2dE9PNzR0MFJ1UkI0?=
 =?utf-8?B?L1VrZ2VFZFNmZzA0S0JLWHk4WVZVL0JlUzZ3TVU2d2Zndm00dzJEK2FtR05N?=
 =?utf-8?B?SFlsaER1R2lPY2xXbXdadWR3QkZZWTcvOWxvVjNzQk9MNmdTeDZiZDJLTXMx?=
 =?utf-8?B?c3JGL0pkejZla0Uyb3dhSDhDNHoyaUFlREFvWXBtT2JOUjQxNGlycnVqb0lY?=
 =?utf-8?Q?0pRlN6qqjQx95?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bzZXU1dyVmM4bU5xZGhPbURNaklRK00vbnp3eDh6cTVlQ1V5Rnh4aklnM0I5?=
 =?utf-8?B?OFRHdTdNQk5Zb0pERHdhQndscEp1Z2hsa3BMREpmS1VFZzdSUXNIVkg5VHNF?=
 =?utf-8?B?UHNJVjNKallTTTBkc2F4SmxEWDYwNUhCaVkvMSs5cmZTMzZPS0tHTW0zOVQ5?=
 =?utf-8?B?K2lyUWVxaFRKWGNsQ1VKZWoySGdPY3EyK0V3aGdvSmlZdHJ3aUVBbWJwR3hv?=
 =?utf-8?B?aVVISUZPVzN3VnEzcnFDYkJocnBWd21aL0NUcUg2dUluRDFla3FMejFLVEpi?=
 =?utf-8?B?QTM1UE1QelZ1d2NzRXpJSTF6SkEreHlGbEpLKzF1VWRuZnZML0lKVElhSFdi?=
 =?utf-8?B?TmJueEtsRVpTazA2VkRHaStKektFS3ovUkNEcWtPRVhPVUs5VTVwdzhpQU4x?=
 =?utf-8?B?a0FQU09ZRkE2TW50RFpRclJsaWY0NDRyTjJsWW54aEorOW9lU0E5dDFwbXRi?=
 =?utf-8?B?d2lveXJSRE0rVWM2SWhnZUFpRGpCdk9ldWZCVWtmOWs5YkhPcnpFZHN3aE5G?=
 =?utf-8?B?NlJlMGtES1N5UFBVVGwyLzNXMnhxNmxueHZ0Y1ovMkFHcnB5blVyN1ZnNkxR?=
 =?utf-8?B?Qm94M0NiaXk2OWFxc01yVFNadHlIc3ZDZk94akJodzlWdWMzQWpLZXRXR0VN?=
 =?utf-8?B?b3NwOXhJRWM4R3duREJGa1ZDdWFSZTdkY2NSVDRNbC9Ud2htR1NXeEl2eU1s?=
 =?utf-8?B?aHQremtaNE53aWNiMnVidituemxmZlArTGNEWTRPbVdmbnR6TkplK3lDUkxS?=
 =?utf-8?B?N2ZISVkwR0E1ZVg5UnQ3OVcxOHIxRHk4eFZZMVJoYjF6UlNJNjI3aFdOS1h6?=
 =?utf-8?B?OHdNdlZjWmxGbWFrbko5eEx5VXNrSmt3RnhBZHlIMUtpaXh2OUJ6RXpoOWhB?=
 =?utf-8?B?RG1XN1E0a2VZdUN4UFJtaCtjN0FnTXRTZWtTT0p6R0dWd1RZNmxKM2VmOCtW?=
 =?utf-8?B?MVJkSHZ4ZDFNZzdhTlh1REg4cGFmU1h2QmZBcFYwYXBjKzJkT003UzhYVFN5?=
 =?utf-8?B?aHlWTjRiNjhSR2VmdDVrNWZwQjVvU0ZFQ2k3RW1kRmFNUWdDVkJTMFhYeHkv?=
 =?utf-8?B?UlNSUEh6ZkNMS1M4SFArME1NMnJOcWlDeHpieVl5N0VQUmVSc213K2RTbHVp?=
 =?utf-8?B?RkIrV2lwYmxGMHRDV0crWVNMN29zRkdOQ3NaZ3VzOWVWSkZZSjErenZoRDJ4?=
 =?utf-8?B?S2I3WkcySmtQZFV5dFFpeVBBZ0VUNGNrMnBrUjcwa3h6SnFJSjk0Q3BJeXV5?=
 =?utf-8?B?R1lVcURBSDFQYUNwUnpXM1FUSnF6bE1TTE0wT2NOUnpXblg2WXVJYUlRbFVZ?=
 =?utf-8?B?N0w5WXptUEtLTUJ5TGk0QldFWkZ2MXZ4cGxRVnFUeG9pK2J3V2NyZnZDdFRI?=
 =?utf-8?B?enRHSVE5eHo5bWZhaFdFSGFhdWROMk1mWEFPQmNXVTcxOGFNTXBIcGZmaGtN?=
 =?utf-8?B?T0FhbzRtL3pKTFF4bXkrOXJDYkZJS2FIY0lZaUYwbzk1TzJJU1dUS0tmelRY?=
 =?utf-8?B?dTEzWThhSHVSOUFKZG9hZ2ZoeUNLQWlSaTlLYklMU1p5WDB4RnZJT0IvRFVY?=
 =?utf-8?B?VWEzUlNXRWFVR0x3SGhuR3ZsWlA4RDVhUW5tZTdqUHNJNjNGVTZlU1NSSTNs?=
 =?utf-8?B?a0tNSzVvOU8xSmNWelZKQXUweE4vOVVnR1lVcXhzUUdGMjdaVklacDBFZ1Y4?=
 =?utf-8?B?UWNMZkpSS3Y5QWlLYnZXWnVya2tiS0FpSUsyVnpVM2grcnZtMVI2NWIwdjJV?=
 =?utf-8?B?V216VVZMSG1WdGpvbVhXejlmYlZDempOeFAxQi95NEVvNDZ0eXVVUTFtV0s1?=
 =?utf-8?B?RGFHME1qeDZBdWJGaC9MeUNIWXFhUTY4TkZjZStNa0pzd0tXdE9KakVKaG1u?=
 =?utf-8?B?TDN2d1VLU1RGSldZa3ZBSVlEbWpGNU9aN2psaWRReks5YTd3alcxTzNPSS82?=
 =?utf-8?B?RnkrTzZTelhZdDVQdzF6VU5jNnpscnVvdHdhYjlLRkJtak16RVg5N2hmWTBB?=
 =?utf-8?B?Zmp5eUI0WDFuWDUyaERHRjRTcUZyRnNRamZlYjBvRkI2L3dtK1ZPT0RmNnIr?=
 =?utf-8?B?SUpqZllPL0pzYVcycFozNFp4bjBncEdnQnVYdSsydVY2dnhxRGxVcVo5VTN2?=
 =?utf-8?B?c20yS0JGeFdMV0srUDJOeXJyR3dDNm0yY1c5ck1BckFjZW02bjdibDRsalo5?=
 =?utf-8?B?NFE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 254debda-d53e-411f-0a9d-08dd1ea79d02
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 14:32:20.0614
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nHl7AP4VAlpcfOK9h81Lw9CaIPdrMXuo018EhcW9FReT8NpnwnISMeXRXSVdTdfFLxusF292GuKZukjALLtw8wptOq+eTyx9OHtKAODPYts=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7683
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 17 Dec 2024 14:32:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5968

Hi Antonin,

On 12/17/24 10:27 AM, Antonin Godard via lists.yoctoproject.org wrote:
> This variable controls whether libraries compiled by recipes inheriting
> cargo are installed or not.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/ref-manual/variables.rst | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 66ecece8b2658b304e17c9c4a1492e42a8a313d4..50cd8948b35f381414837acc9b9e925dc5110779 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -1231,6 +1231,14 @@ system and gives an overview of their function and contents.
>         :term:`Metadata` so it does not need to be parsed every time
>         BitBake is started.
>   
> +   :term:`CARGO_INSTALL_LIBRARIES`
> +      When inheriting the :ref:`ref-classes-cargo` class, the variable
> +      :term:`CARGO_INSTALL_LIBRARIES` can be set to a non-empty value by
> +      individual recipes to enable or disable installation of the libraries the

If I understood correctly the code, any non-empty value will enable the 
installation, so I suggest to remove "or disable" here.

> +      recipe has built in ``${B}/target`` (files ending with ``.so`` or

actually in ${B}/target/${CARGO_TARGET_SUBDIR} according to the code?

> +      ``.rlib``). By default this variable is not defined and libraries are not
> +      installed, to replicate the behavior of the ``cargo install`` command.
> +

Otherwise, looks good to me.

Cheers,
Quentin

