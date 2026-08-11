Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 252CCC5CFCF
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 09:09:02 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.35])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50714.1786439333531583875
 for <docs@lists.yoctoproject.org>;
 Tue, 11 Aug 2026 02:08:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=IkJEUf4j;
 spf=pass (domain: cherry.de, ip: 52.101.70.35, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H+vEUDV1GNECydKLrRxsy2xorg7WWIyZkMFL6zw/2AyjA+gBlclhDb+4cmIBk2zidGnaavNb5RR4u1nFgANvFEDyOtEpHC/QMPMd1xVbHpwcBTxWd7k4En50oKXmLJ47L3cxE0bJ1qgVUFPU55vYOw1zSemVQouFMbzeeX4oTu6qFoQcGAo7rl1fpY9JNcL1ShjNKI35MnErDpW6JKQbygcAC4RaWK5egQuMANkmF131vqDS+ZYjkNACvSUsHEXM7lIkE3uGe7O8ipm+6QyH1If7BLYJMjV2CN15Yy807fxwO31IvrbMxItoshUCKZblnuE6sYT1Vit4DGHIRH8aVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bT0rHI831Q+Och91KgW82DTti/OGxZFjYFU5h80QdYY=;
 b=zFDy1cfuq5RgB8GnyrHBvrOH1ES5sS2So5g5M0Eux7aQILLz0/B9iMSgRhORKIQiNwx/83c41ZUojPddqnn+ymo1/QYsmJwhkmv47p5XisTdn+rxbw3kpxxUi4N8yCXYEvoL6SnLDukHkQUVTecYa24np7plcJmk7ESk5JRtrdkCY5JOv9RLXYvjB8RwBDc3MTtTz+JfRw0TrsyiZfbpWMUp0dnx/tZ2YL2tkjMa8FcrO+xd7TFops+C8n5GkLzFwMIPU0fje4nIoJ1DaX7+RiDlddcrWlFmIv+7BzWX+VzmMgK2j7AjYapF5SMLxS52w3uSbBBtYnsXQqE+0jdwmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bT0rHI831Q+Och91KgW82DTti/OGxZFjYFU5h80QdYY=;
 b=IkJEUf4jz6cEFA95TxHRF6Jl0vwtjHhlnJQh8B/SFbbwg0Q1sYX6FlcfWe1kbT0RPRFsKmJxc+7BZ/078sEvmS8tFigYJtyPdcYAbQVFDRcW92JKqDNegzJJmQgn10qHAMzjOPhL/jPS6fLE5F9K6dCFF3UKue4d/X/8YGEmCZ8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com (2603:10a6:102:b8::20)
 by AS5PR04MB11419.eurprd04.prod.outlook.com (2603:10a6:20b:6c4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Tue, 11 Aug
 2026 09:08:48 +0000
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7]) by PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7%6]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 09:08:47 +0000
Message-ID: <1bde5db8-15d5-49c0-938b-92ec0efb14b6@cherry.de>
Date: Tue, 11 Aug 2026 11:08:46 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v3] security-manual: Add information about how
 security is handled in builds
To: richard.purdie@linuxfoundation.org, docs@lists.yoctoproject.org
References: <20260811090254.3611885-1-richard.purdie@linuxfoundation.org>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260811090254.3611885-1-richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIVP296CA0013.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:357::6) To PA4PR04MB7743.eurprd04.prod.outlook.com
 (2603:10a6:102:b8::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7743:EE_|AS5PR04MB11419:EE_
X-MS-Office365-Filtering-Correlation-Id: 802544c7-b422-4970-71da-08def7882706
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|376014|1800799024|366016|23010399003|6133799003|3023799007|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	bm+sDJrA3uD5ZTL1SXXZoFLicoJma0JuSL0IfZ+XFvAGPT+xWDkiTAa04giueJ7lR7bPFtUcaOEeIN+NFk+5wNhF98CNX2RDBAPQIIht4nSAsdrPdFKn7i+KwFn9f7VEZHQM/a9ZaLepXqw7DfZGS6PEBnvrElaErQSxoTymF56wDkZCaYmSrvHkBzOiY85GTLllC16VtswKOpXBSSEBYuXsXU7dWxU99no5kOfXxJ9mB+MugQ5gra/QJgwosvqjXtxZByXiymwFreg11N7mD6v/eBzic5RzL5pNeFUIrZU68NgF7YYfEJTeuWjxU6O6kF2c6wcKfmgOhEJXIVV1XbX7JJ51BMpaRjblBqZ5FHODTfE4BFX29yUmy0j95uw0C9uBNXXl9GMIHXbqkjgrgTCkfJFleBR+90r/zN9KXVB4pxdm0zREzR+bIG5aBS3/iCrKG/ezc8knTNwedxVW/1UCCKfgOFVHLjOourE8roUQiBo0pMTBVnYM3VpOSDU5+0FIWkI0FW771GKboTj1jHMngTpwQ4Pw/pAcx0FA8TlSoGsQ/A64LoHLgqIw267Xk/et2X30RifimuZEq4+/SDJL12xiEmHtts5OAsyGW3+6rViY3Q9F2O8Eq6xrIGiIRf4UCDtSlr/ppbsBj+4ATKTDRaIKJeTly67jv1MN5O0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7743.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(1800799024)(366016)(23010399003)(6133799003)(3023799007)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dFVxc2VqaEZEUmp3NFFkbGZ0b2orSExiKy9UWXQ4NU1zS3VtcGRBTkgyZmV0?=
 =?utf-8?B?VmRxUGhSSk1lMVZMa2ExQ1lSWXZMbHFWODBMSklPVko3Vktzb2ZHa0ZwRnQ2?=
 =?utf-8?B?YlFIenZodjRRdk0yQi9jbG9ibXJjUG9ucytwTks0dHp0ZHRTVzlTWU9KMmdo?=
 =?utf-8?B?RElXZWZyYi9ZU2Z4U3QvUmVMNkZ5enFGQ0U0d3Q1ZUt1TFV5akUrNWwzOXRm?=
 =?utf-8?B?R0FDaTZ2VTdXZlQ2dzhaVXhyWFdJdnRFRnJqbHBjR3ovT1hDL1NJQXA2Mkxy?=
 =?utf-8?B?WkwwdVFyUHZOVHJRVFdXK3Y5U2NGN1dDallqQm5JVG9tOVZvODlxd0JacUU3?=
 =?utf-8?B?bDZtZDk2ZlA5MFhSSlZVdlVnQlhvSThJaXI3TVRVUVUrY1dtbTJCaUplRjVa?=
 =?utf-8?B?bWxJOGZuZDFLRXg2cEkxU3hxNVJNT3ducmpKTDVjUkZIV2QvMjZtZG81YnF5?=
 =?utf-8?B?NHdOTGhpNkY5U28xVU9oZm1ieUkvSUJienVDekVFRGovd1I1THNNZFd5MEFO?=
 =?utf-8?B?T080RmIrTE8wMnI2MXFVdmtpM3JBRGtHUStHeER6ek5CaGJ6VjgxYTdoeGNR?=
 =?utf-8?B?bG5HVklsUkY1MEV6ckExaDk4ejVuclhSckdrRlNLWFFSNE42QXI0N1BIdkJj?=
 =?utf-8?B?eHJVeDVsVVdhcml4VnJwUkpuRUhlWDBxenByUFpFWlVETzhUaTRSa0NBenpk?=
 =?utf-8?B?dmdvd3llWUZNZDRYTE9Md2R3ZGFQdXlGc240OVNnNUNab0JsU1VrOFhjbnll?=
 =?utf-8?B?SENuTExZSTM2M2FWY1hONkt4ckh5VHRNeC9TMFp1TTBORFF2NUw0UTBuMzc1?=
 =?utf-8?B?a1hWd1ZHSWwyc0o2aW0rbUQ4SGR1ZURRTEZMVmpPUk5Ba0hMdXFWYmxmUWVp?=
 =?utf-8?B?U1ZUcThlc3MvRHY4TU9CeEdwelZTR0VpYmJ0UDMyMFNIRXRQbFUyS0hvcVda?=
 =?utf-8?B?cjAyOEpEbDIxcVVKK09PRVJ3VFdTOWNycFV5QmNiOU5lWTk5ZUIvODFOTTYw?=
 =?utf-8?B?S0FnVStIc2IvT1lKUzB3TXpDZ01rdVV6RjhybU1qVFA5QlFZTWNodjVIS3dn?=
 =?utf-8?B?c1BGWHMrNm9kem9KU0lMUkpVUDBKZTNNM20ycEhveFNZNUltcVNHSHI5bENn?=
 =?utf-8?B?dzc1TXQ5YzBWQXAzc3V3dnh6ZE1pT2lneGNMZ2FxbkplaVY4dXhTa0t5YnJl?=
 =?utf-8?B?MTI3Q0plSEVHam1KZVdJTGhSNkEzYWpWWHBwcmhVV3BLaTlmakp6eWpZczFh?=
 =?utf-8?B?RkpJMVByZ24rRW16RkVXcVV1K2ZKdFFNekJRNFllZUJmNnFTem5DU1V5SUgw?=
 =?utf-8?B?RVZLZnFGNjlWaTY1MTBCVmNuWldjOC9TZHVTc3o3aWh6T2dYMXB0Nnd5Zkdl?=
 =?utf-8?B?QUxFSGVqVXFNdjREdmRpSklsOWlkVzVyYks2b0MySU1yajJjZ25DSk9FOVds?=
 =?utf-8?B?cURTcEV2NHFwQnVWYk5PbUoyZUlaaFFyMVFmUlJMQzdIUHQvNzEyUExBU25G?=
 =?utf-8?B?MUF3MmEyQzJ5Y1pWT3lxL1A5RWpzWjl3bUdDRG9zM1JzM2J5TzFHQTlKRnZ4?=
 =?utf-8?B?S2tUcE5MWUlQNmlxMjBvc0h5UVA3L2thc1BXWlVkbTRqdkpkSkI0d3NRSEFI?=
 =?utf-8?B?WmxzbjFUUGowRlA5WGYrY1g2TVg5ekU1MFFTWkNaS1hMU3RlTzU5Y1JJT2lq?=
 =?utf-8?B?cmdPT1pRREJudkJFb01HOEF4REFCOTBzaHMyNFpoN2p4bmsyaWZkTlpQdVFy?=
 =?utf-8?B?R09GZXZzZk92SkwvZGZHdVdvbDh2bXFHYy9lQTFoSlNhYkZZcXN3cVVXNVNJ?=
 =?utf-8?B?Mm9vYVVodnJ0elBUMVRDWWRLdVY5SXZiOUpvdkkramRXaFdIY0NBWTlwMXB4?=
 =?utf-8?B?Y1kwS0EyRzVvd0JabG1POUNHUDhhVnJhVWV3cVV1TDM2QktkNHNQU21ZMkRK?=
 =?utf-8?B?KzkrY1dPQVlWektxeDUrdGErWTBVeTBTdGRUTExHa3ZONUNGM3NnZHgyY1Bo?=
 =?utf-8?B?VTAwRjZ6azRVUVlnektkc1gyV0ZyVU9QR00yS2hCb3lkK3hsUUFsTERhbVdX?=
 =?utf-8?B?TzBQMVRLc1BqRmkxa0phcWZQNDhtNURxUGd5SWpnN0JRVDBKSXVQWUdWK3pm?=
 =?utf-8?B?YWtkR3dOM2RvM2dTUXpjTzNFMHI2eXBPVysxOHA2eUI3VlFQa01KTWJyc2JF?=
 =?utf-8?B?OU1ETnQyYTl5NXM1bEcxVzA3TDVqY1EvTUMxRzVCSjRsOC8wY2dFRHdwQkxS?=
 =?utf-8?B?VkMxVVRYM3V2VFBuWnhiWDQwc2Y5RlVKOWxYa2h6WDA1TTl4NWFlQjZvTDhK?=
 =?utf-8?B?d1NVWTBTR2t1S3I1aHh4T0RXcTNsM2t3SEF6MnFjZFFmOE5lb3J1RmpTZlNv?=
 =?utf-8?Q?NIh/RqfEQcZU+m4B97CpTgeL9LYZdB9+2auMImk2zLvkE?=
X-MS-Exchange-AntiSpam-MessageData-1: bZYcvbhOz936dg==
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 802544c7-b422-4970-71da-08def7882706
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7743.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 09:08:47.7053
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yHcRd3K6uPVqCIUotD2eojHo+Tm0YDc+lLl36S6DiTiWAfEWzUiqB4Ix3e3X2o92sQDah9RDmZMbgvWT9bKg3vgKXKwXKPrzPdRPCEa6Z6k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB11419
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 11 Aug 2026 09:09:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10254

Hi Richard,

On 8/11/26 11:02 AM, Richard Purdie via lists.yoctoproject.org wrote:
> We have no information about how security is handled within the builds
> themselves. Start to document this.
> 
> [YOCTO #16102]
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   .../build-process-security.rst                | 49 +++++++++++++++++++
>   documentation/security-manual/index.rst       |  1 +
>   2 files changed, 50 insertions(+)
>   create mode 100644 documentation/security-manual/build-process-security.rst
> 
> diff --git a/documentation/security-manual/build-process-security.rst b/documentation/security-manual/build-process-security.rst
> new file mode 100644
> index 000000000..dfc13235c
> --- /dev/null
> +++ b/documentation/security-manual/build-process-security.rst
> @@ -0,0 +1,49 @@
> +.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
> +
> +**********************
> +Build Process Security
> +**********************
> +
> +The :term:`OpenEmbedded Build System` is used to run the builds and careful
> +consideration has gone into how it does this with the aim of being both secure
> +and reproducible. Like any system, it does need to be used carefully and in
> +keeping with the design for that to be true. Users of the system should
> +consider that:
> +
> +-  The builds generally aim for any input into the build process being verified in
> +   some form. For source code tarballs, these would have a checksum. Git source
> +   trees would have a specific git revision. Metadata would also usually be
> +   under source control and also have revisions.
> +
> +   See the
> +   :doc:`bitbake:bitbake-user-manual/bitbake-user-manual-fetching` section
> +   of the BitBake User Manual for more information.
> +
> +-  Some elements that can influence the build are not verified. It is assumed
> +   that the operating system running the system is secure and of a known setup and
> +   version. The system goes to significant lengths to isolate against host
> +   contamination of the output but it is certainly possible, especially maliciously.
> +
> +   See the :ref:`system-requirements-supported-distros` section of the Yocto
> +   Project Reference Manual for more information on supported host distributions.
> +
> +-  The builds assume :term:`DL_DIR` is a safe location. Once download artefacts enter
> +   that location they are not repeatedly re-verified. A user could edit the git trees or
> +   tarballs there in ways the build might not detect.
> +
> +-  The builds assume sstate objects from :term:`SSTATE_DIR` or from a configured sstate mirror
> +   are safe (with :doc:`signature checks </security-manual/sstate-signing>` if configured).
> +
> +-  The core build tool, :term:`BitBake`, is a execution engine and will execute code both

s/a/an/

> +   during builds and when parsing recipes. This is not a security issue, it is an
> +   essential part of it's function and purpose.

s/it's/its/

> +
> +-  :term:`OpenEmbedded-Core (OE-Core)` is well tested for reproducibility issues but other
> +   layers and their recipes and code may not be as well tested. Those reproducibility tests
> +   are available for others to run against their own layers and code.
> +

Would be nice to have a link to those reproducibility tests (or if we 
have documentation for those, that) so we remove friction for layers to 
figure out how to do them.

With the typos fixed:

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

