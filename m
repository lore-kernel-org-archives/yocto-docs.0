Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8396CC44515
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 16:40:03 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1834.1784565595822683537
 for <docs@lists.yoctoproject.org>;
 Mon, 20 Jul 2026 09:39:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=f/0akS+B;
 spf=pass (domain: cherry.de, ip: 52.101.70.52, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FnWOixlIR4CMyMbYODoiBOU/hcM3gzbPYNLTaW6HouWAmANuzUShVHkUCB7eRlj3Tnj8NIUmOR1LpECH4vSWh/81XyIvSb//oWvCrf7KJaZlcKhLnG4FuwTzDhSvDD5Qrt0FpX2EdfO3amLkhRPR3S/tSI5PZOyD6w9jKUFNACLCmq8cv8GuKEgeTDSRmF4WRWO/6FvRfyOa993pzbLK4mbVUJvxjuJ5ITIZQqMixUYRbOBaUz5GYnX8jSFt7gk2dPw5aarDkpKXuUzGNUnLpnqcqM6Kc8hRoMkCel3Ljr9DurcpTLRV6bf01Sb6MbYVObijLH3dEIECg9pmWOkCNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z/+hxYvNq94KpcghQapAavCfUET6uD3iF6wOqqpxNFc=;
 b=r0/BNq0+dzbN4B5vb+sdWeJEb+/2KegFns0VjPXT6pgHQ5JrRXZKHxLM++WVG3jjCj7mLhUVSqaoMfZFlRtKv6Dc3ng9RupxjX+dOCmUeAUbkW8ukgXRlk4/lYetfeLbcJvBVubyxP+RwGA6c8KmarANL/DdaQp+wvla7EX7GqrWZQQirJdm3HCEz8drtkwseNL7IO86rRoyU2MkuiODWAxDZZf1TnZMfntAnLkxnyl8bjsyND8xS0lDvFY3U4LvT0xIzSMZRgrAxTq2J1fXvrwPtT7U72YrhXPGKD2c6HiEwyBrRdxK2TFlgvlZeiI+TR0oFeheyEcn+MHu4tTT0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z/+hxYvNq94KpcghQapAavCfUET6uD3iF6wOqqpxNFc=;
 b=f/0akS+BRCm/ByQX55kj4LVtlQ23LwB91znOzR+YwIleva2t3Q3koy2DjgfAXTcJPnsy3ur3fSyJ6oxlec0WLKL8kTAdlOj1uI+yPGFTeNoKLEECehWmd4g98cR1PS6QPZV1ZAVOG7+npwKLpVPqi1KOLlVhVcz7b3TlAj00Ljc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by DBBPR04MB7772.eurprd04.prod.outlook.com (2603:10a6:10:1e3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 16:39:51 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%5]) with mapi id 15.21.0223.012; Mon, 20 Jul 2026
 16:39:51 +0000
Message-ID: <9b51a647-76c1-4bbf-b4fe-c9fc57109bc7@cherry.de>
Date: Mon, 20 Jul 2026 18:39:49 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 3/4] tools: add gen-doc-links to generate
 documentation link flags
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260716-gen-doc-links-intersphinx-v2-0-83cb3aef6ff6@bootlin.com>
 <20260716-gen-doc-links-intersphinx-v2-3-83cb3aef6ff6@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260716-gen-doc-links-intersphinx-v2-3-83cb3aef6ff6@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: VIVP296CA0060.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:35a::14) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|DBBPR04MB7772:EE_
X-MS-Office365-Filtering-Correlation-Id: 24760fee-35ea-43a1-f6fe-08dee67d84f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|4133799003|3023799007|56012099006|11063799006|4143699003|10067099003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	DoAHy0QalKuUnmhgFUE0omfyKYQpimFnjWLgwx3ZlwM6stZzbvAwC62xPBvYimQ674aABzdJe4x6i4PWCernkDIZrcfI+JsX4SI7kqBVTGyEIeig2MpjBUpkE3e0SPAoM00PJ92hBAf0HydjMZr4J+WUuogHLGQf4DqRGVzTNg9ZG/Mshwzn94TenI0VD43cEWh9uzrLrD6VSgkTFeSWOlwC/Xd/JuL9JQyJyGDvP3FaGpZ3Modkjjgubc/Jp6zftRvAL9rQT3SdP0TaafU02JEYh4AnRdcJB5ClrIhYHMyvdEj1AwMoQ8BekOee25dS2h9iRgtOCB8IwGIJtuEGKIwykC3bTGrYlQ7hIq089S16em4Gn6UUG98h1kjrIhDutktr0m2aBBmEXpWFPtTIUKuSgKTxFzwOil4vRUNUCcBPvXea5Md92FruBL3R1IsFLGjz7zakpveT22NSbJNH8eKRxv8eYHZCEaxcAIWD8y/xahQey2r2ZwK3aJ1r5xf0mHqbnsxfJVVdj1TRV95ZaPuetg+5RSuizJ73NiNoVpLsMuQ53KOS16sGAg74zXCkhELNekDw+NnJz5mvjOF3khYVUux1xk7HnFtyXymbzGmffVGuCuU/+ILsUR2RohPX
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(4133799003)(3023799007)(56012099006)(11063799006)(4143699003)(10067099003)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?b2d0cGtGMzRNUzZtL095VVFTSHZTdjNtbXlNS3lFdklyUnFEUUxkTXQvZjZP?=
 =?utf-8?B?QWsxanRzdTlZMStWKy96OGpDL3NVc0hXQW5YUFkxUlAzMlFqTVRkOUNMdFBM?=
 =?utf-8?B?SmxTTjZJUTBieS9pMTNKWTVIdG9DUDJSbnJKZituelJkR1RsQUQ1NzdNcnBp?=
 =?utf-8?B?RWgrcHpGai9vRVluYzAyUnZKckdoQW5rRmlJcUdjV3dON2hhNytHRG1iTnJZ?=
 =?utf-8?B?aEg3S1Blck5UNnJoenp0Zmw5em5sdzllQzV5MFVoN0NDeVcyVG1CSFVySDNO?=
 =?utf-8?B?OTVOenpabjVFMUg2YmxFMGx2cDJ0V0U4TnA0RGNQcGdiMmNkSFBRckZ4eGVT?=
 =?utf-8?B?UnVrS3pNQmtoMHpMYytoS0ZFdnBnTmxGTDN0a2JwMHlSVTRFbHBzc1RWVG9W?=
 =?utf-8?B?WVN4cG14ZEtNYWI3TEdQcVFWTG53cm15dmM5SHpZQ0tFU0ErTnA2a1Z3cnlT?=
 =?utf-8?B?Q1c2cGx1Z0F4VTUySGhFb2tOcFllWWNaSzd6azlMaHczRG8xT0FqZk1yZ2Nj?=
 =?utf-8?B?Z1pUWnlQUGVrZTE2Nlp0WlAzMGhuWk9yeFY2NEI4UzVPeE5kVzFuWnc1T08v?=
 =?utf-8?B?OWpDU2Y5VTRxWEc5OTdjVitSZjBMV1ZTVm1lMXh2aXV6QmE3U3NVc0xCbjdR?=
 =?utf-8?B?U05SdjEwYzRhckFuMlQwSTlMVlBFeGJ0Vmk1RUNvUEZITXBKT1RncDJKNjQz?=
 =?utf-8?B?TGttSVhwU01ZUDg4WnZxTm5WbFlCWjR5U0dUUng5QkxYRXR1MGZNWVV5OFR5?=
 =?utf-8?B?K0NwbG9FUDFtV3FvcUtJSmdqNHV5eXo3ZXh3dEdEY1AzdkUxNkI4b0pGNUc5?=
 =?utf-8?B?U1ZLajVCZy9tMmw4MS9pcXM1TmJNNU1QVW9VaEJvY21iQ0NqS0FOTUUxc0Uy?=
 =?utf-8?B?d0VDcWxUdlJMQ25HT2NjUFpTc0VQaEwxRzhSQTJCSktpS0Zad09HeTVQM0JD?=
 =?utf-8?B?enI1emdKK004VjlsTTM1TEludlJ2eWRGaTNuWnNPdzRLdHVTU1B0WmU4Nlpx?=
 =?utf-8?B?eTEzaG9Fa2h4cUdXT2NqS01saDFRZ0FyMldqaWdYQmFqSGpjM3hzaUVhTUov?=
 =?utf-8?B?Y0xOMG5PSHh0QkttWDFaY0lFb2VqZXJJR2tNY3YzZ0dZclJsazdYV2g4V1JK?=
 =?utf-8?B?RU94d01sZ2FpRHI5bktkeDZPd3RqdlBuWU5mWGZFeEt3ZFEyanVTdlcweDM0?=
 =?utf-8?B?MUpVU05ta092KytFaU9Id242dk1KTnZYWW9tdjl4WmUxY09UbXNLbDRnQkdG?=
 =?utf-8?B?SittMTg5Y0U3QlJ4aHF1cFF2bnZJcTZ1ZkQ2OUpJTzd6dFZDa0w5TVM2SVR5?=
 =?utf-8?B?aEdnVzdoM1NkWlZXRzh2bDhJTUZmcGNWUXptTWgvb0twci9Vd0F1ZGZKUGJC?=
 =?utf-8?B?ejRSUG56c01qaUhEcit5VXR2V0kzQVpWVkR5T3NFL21HMjd6TUFHSXhRV1or?=
 =?utf-8?B?UlE1RmRzc042WUpxYkV3eG5KaXlwbUJIZVlrOE5YdS9vR09tWk1KN0gwc1dE?=
 =?utf-8?B?cHpmK1N0cE5aVDFDNHRrektvdXJQQkF4Y3Y5MXluQnFwSlRTTzN3MTJ6VHhJ?=
 =?utf-8?B?bno5VFhNZUMzaFNFOFRqWEk1Sk10OFVjZ2lUUFJSVDIvWFhDeCs5Rnh2Q2pL?=
 =?utf-8?B?Z3BpNlRqbTdOU1FwcTRYRzZQektEdVZnUHVTRGhGOC9NdCtFL0FBaUloVWhX?=
 =?utf-8?B?aWdiK3hjMlJFdHpsVzJXVnFsVDNhcmJ3cWMyMlViNmhnQnd3Zlhib3Z0dGda?=
 =?utf-8?B?Vk5YVmRueFN0UUZCODlOUmZQa3VhcmVaMFhSbHh3YUNpWS8xVG1qTHJOUmZE?=
 =?utf-8?B?UnhHTmdaVjJIbmR2bHVuZlVvRVQyK0t3blNXWE41NklIckE4YitTOE9qS0Qv?=
 =?utf-8?B?T2JBcHlwTmlITUEyMmZwMENJdTY1OWRvdEFmRXgrWG9uMlhBb0xKUVh3amov?=
 =?utf-8?B?OUVRLzAyL2ZHZWlaVnRYMlpkUWNHVmFtV0d3NWl1K0tHaHNLL21YNmlnaUpa?=
 =?utf-8?B?UUVnNVJ3SldQQUNvazJjektGdlNhc084dXZQeHIvRUVqTzRvUkh3d2F6THZ4?=
 =?utf-8?B?NUw5OFBRUGZwSzUveXdPVWRSbTlGSnpsR2FoQzJSczdpa1dnRVlzTWoxaEJ0?=
 =?utf-8?B?Mk9nU2tXbGViV0JPUU9SUE1wTy9XaXE2dStJU09UR3pBczdmdmwvbllkMlZJ?=
 =?utf-8?B?ZFBGKzNvUk9JY2lSMThGQmVMZ21SeUxZbjlJL0t0Zjg3aHpSSVZWWHpERHE3?=
 =?utf-8?B?MWNERkYzenBrSm5HdXZ3VDYvRVVFZ0Q5REJvQjlHTUdiaFJSQkxkNGU0ZVN4?=
 =?utf-8?B?b3RSN0RVbHBQL0JBL0NoVnZ1dWhjZmNRWTg2ZVRBamlFcHZ4Q2xoZz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 24760fee-35ea-43a1-f6fe-08dee67d84f0
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 16:39:50.9963
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Es1PIpNn4Jmefg/e/FeuzSGrjR/HBU1Bm12MdFaTSEcehiavBn8tMJi3hMLrfPIzTcEwCFVfbqPzL9JMal/0OrekQMkMydAavISaD0JifoI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7772
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 20 Jul 2026 16:40:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10100

Hi Antonin,

On 7/16/26 2:18 PM, Antonin Godard via lists.yoctoproject.org wrote:
> The gen-doc-links utility can be used to generate a configuration to be
> included in any project that want to get access to documentation links
> for documented variables. For that it opens the objects.inv file
> generate by our HTML build and creates links for existing variables and
> tasks.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/oecore/doclinks.conf | 1064 ++++++++++++++++++++++++++++++++++++
>   documentation/tools/gen-doc-links  |  112 ++++
>   2 files changed, 1176 insertions(+)
> 
[...]
> diff --git a/documentation/tools/gen-doc-links b/documentation/tools/gen-doc-links
> new file mode 100755
> index 000000000..11b3ef858
> --- /dev/null
> +++ b/documentation/tools/gen-doc-links
> @@ -0,0 +1,112 @@
> +#!/usr/bin/env python3
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +# Author: Antonin Godard <antonin.godard@bootlin.com>
> +#
> +# Copyright (C) 2026 Bootlin
> +#
> +
> +import argparse
> +import sys
> +
> +from pathlib import Path
> +from sphinx.util.inventory import InventoryFile
> +
> +
> +YOCTO_DOCS_URL = "https://docs.yoctoproject.org/${LAYERSERIES_COMPAT_core}"
> +BITBAKE_DOCS_URL = "https://docs.yoctoproject.org/bitbake/${LAYERSERIES_COMPAT_core}"

Sorry for the mangled link, but this is invalid. We only have bitbake 
version number, and not Yocto release name so this won't work.

> +DOCS_DIR = Path(__file__).parent.parent
> +PREAMBLE = """#
> +# This file is automatically generated with tools/gen-doc-links, do not edit manually.
> +#
> +"""
> +YOCTO_DOCS_SECTION = """
> +# yocto-docs
> +
> +"""
> +BITBAKE_SECTION = """
> +# bitbake
> +
> +"""
> +
> +
> +def parse_arguments() -> argparse.Namespace:
> +    parser = argparse.ArgumentParser(description="Generate glossaries from Sphinx text output")
> +
> +    parser.add_argument("--yocto-docs-inv",
> +                        type=Path,
> +                        default=DOCS_DIR / "_build/html/objects.inv",
> +                        help="Input yocto-docs inventory file")
> +
> +    parser.add_argument("--bitbake-inv",
> +                        type=Path,
> +                        default=DOCS_DIR / "_build/doctrees/__intersphinx_cache__/bitbake_objects.inv",
> +                        help="Input bitbake inventory file")
> +
> +    parser.add_argument("-o", "--output",
> +                        type=Path,
> +                        default=DOCS_DIR / "oecore/doclinks.conf",
> +                        help="Output doclinks.conf file")
> +
> +    return parser.parse_args()
> +
> +
> +def doclink(name: str, uri) -> str:
> +    return f'{name}[doclink] = "{uri}"\n'
> +
> +
> +def main():
> +    args = parse_arguments()
> +
> +    yocto_docs_dict = {}
> +
> +    if not args.yocto_docs_inv.exists():
> +        print(f"yocto-docs inventory not found at {args.yocto_docs_inv}, "
> +              "use the --yocto-docs-inv option or set YOCTO_DOCS_INV_PATH "
> +              "in your environment")
> +        sys.exit(0)
> +
> +    if not args.bitbake_inv.exists():
> +        print(f"bitbake inventory not found at {args.yocto_docs_inv}, "
> +              "use the --bitbake-inv option or set BITBAKE_INV_PATH "
> +              "in your environment")
> +        sys.exit(0)

Don't you want to sys.exit(1) here (and above) instead to show the user 
this is an error?

> +
> +    yocto_docs_data = args.yocto_docs_inv.read_bytes()
> +    yocto_docs_inv = InventoryFile.loads(yocto_docs_data, uri=YOCTO_DOCS_URL)
> +
> +    yocto_docs_uris = (
> +        f"{YOCTO_DOCS_URL}/ref-manual/variables.html#term-",
> +        f"{YOCTO_DOCS_URL}/ref-manual/tasks.html#term-",
> +    )
> +
> +    for key in sorted(yocto_docs_inv.data):
> +        inv_entries = sorted(yocto_docs_inv.data[key].items())
> +        for entry, inv_item in inv_entries:
> +            if inv_item.uri.startswith(yocto_docs_uris):
> +                yocto_docs_dict[entry] = inv_item.uri
> +
> +    bitbake_dict = {}
> +    bitbake_data = args.bitbake_inv.read_bytes()
> +    bitbake_inv = InventoryFile.loads(bitbake_data, uri=BITBAKE_DOCS_URL)
> +
> +    bitbake_uris = (
> +        f"{BITBAKE_DOCS_URL}/bitbake-user-manual/bitbake-user-manual-ref-variables.html#term-",
> +    )
> +
> +    for key in sorted(bitbake_inv.data):
> +        inv_entries = sorted(bitbake_inv.data[key].items())
> +        for entry, inv_item in inv_entries:
> +            if inv_item.uri.startswith(bitbake_uris) and entry not in yocto_docs_dict:
> +                bitbake_dict[entry] = inv_item.uri
> +

1. Does the uri need to be YOCTO_DOCS_URL? We only need to have it in 
the output file, which we can add in the write calls below. But we could 
also simply have the empty ('') string. This should make it faster to 
compare (fewer letters to compare against).
2. Why do we need to check that it startswith()? I'm assuming you want 
to avoid the ref-manual/terms.html entries? Please document this with a 
comment.
3. Can't you avoid the first for-loop and directly iterate over 
bitbake_inv.data['std:term'].items() since that's the only thing we're 
interested in?

> +    with open(args.output, "w") as links_conf:
> +        links_conf.write(PREAMBLE)
> +        links_conf.write(YOCTO_DOCS_SECTION)
> +        [links_conf.write(doclink(name, uri)) for name, uri in yocto_docs_dict.items()]
> +        links_conf.write(BITBAKE_SECTION)
> +        [links_conf.write(doclink(name, uri)) for name, uri in bitbake_dict.items()]

I'm also a bit concerned about the use of $(LAYERSERIES_COMPAT_core} as 
this may induce some mismatch between what OE-Core is at and the version 
used to generate this file. We may actually document a variable that 
shouldn't be used anymore, or that isn't accessible yet due to a 
different major version being used. We do know what we're building the 
docs for (c.f. conf.py) so maybe we should hardcode that?

Cheers,
Quentin

