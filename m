Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45391C88E72
	for <webhook@archiver.kernel.org>; Mon, 14 Sep 2026 17:04:38 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.0])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2660.1789405475065565409
 for <docs@lists.yoctoproject.org>;
 Mon, 14 Sep 2026 10:04:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Aq8AiCM0;
 spf=pass (domain: cherry.de, ip: 52.101.69.0, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=or8ItZ88JMN18u0c6BAcc+6lvWBkZ570MB8FMHZ2DZ1TuBb2Z5/U98R2Jg3I7BuMboYvfeGxtmSlUGxNAMTaWmdzb2H67p9q2LkPiAr5yExZlp1I3VzKKl3VdtFWIEWtR9D1ZuBWp2b7N10kh0N7LVOW9Z3zcBsyYUvWyz/ISuSAJ3w5jc4q9ezYeNwIalvykNbCjoX6tDSjkVoeNC1Kp18R9fCCRHRttHh8Kj/XAtqkt1icYz8HlAYrMgaz3D1nByK86eyRZKfDWbGDyX1WGC4X1gOhmlElSz4vOKeXaqlg84yebrnHLyHMGZ6KhttmgDLU+YW/Dw/PeI/o7mtE7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ltsFp8pns2BqPDM3Sm4OoqzKppqK11hQkgqTSgRuScU=;
 b=gKABZWjjZyPfDT1SoWix72PCQzNZ5JsNmbiZWSnwVM3MknZtQ/yQlpYupsxFN2CoYFbpjMOR6PK+MMZju3Up2iCpDEzwq9g35R3FUwBqqRSzJ05dzdheARTHv9qs0KrI0/cVyYwU3ItmxyQveaNJCTiEc4mCBVKgoN8gn+cUO9aiD9hoxseGDhnuvYyHPFFBhqo7CbzkMXz9baCQLpLURH/922AyBgnnIHDP6+F1d+WGIYQdQ1SbxK7z2K5UaYsOv7bYKkaPG6iPEQ7vRogFp3U5eeo605VuvPev5nRY1dKqJAqAhWEImmjBCWNSG/soay/u46eYwh/2sTm6K7T4mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ltsFp8pns2BqPDM3Sm4OoqzKppqK11hQkgqTSgRuScU=;
 b=Aq8AiCM0W7r7o9WX8Ay1pB9WFg+SGXTjLkYAMQaLrpP7bt8V7A24rXtZ4DLbmrY5TPYfkYY8W4r+ZUXCg4+uiF3hxvKtkpMdyHQTj/P5XBXZmcgsqZtaOBB0AbNkaOevXESAjHV1V6wUS7hD0psa3J/sEenn3ylb17Gtbh3vqsA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com (2603:10a6:102:4ab::7)
 by PA1PR04MB11060.eurprd04.prod.outlook.com (2603:10a6:102:491::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 17:04:29 +0000
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d]) by PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d%4]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 17:04:29 +0000
Message-ID: <e2efa236-b929-4fb0-9186-0e996413aa00@cherry.de>
Date: Mon, 14 Sep 2026 19:04:28 +0200
User-Agent: Mozilla Thunderbird
From: Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [docs] [PATCH 1/4] tools/obsolete-variables: add script
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260827-missing-variables-v1-0-7ec8b525b23b@bootlin.com>
 <20260827-missing-variables-v1-1-7ec8b525b23b@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260827-missing-variables-v1-1-7ec8b525b23b@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIVP296CA0011.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:357::19) To PA3PR04MB11153.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3PR04MB11153:EE_|PA1PR04MB11060:EE_
X-MS-Office365-Filtering-Correlation-Id: 32379ab8-17c9-40a5-3889-08df12823d5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|5023799004|11063799006|56012099006|4143699003|10067099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	Drfx/G655NCT3zxnpmhPSzANDEmU8xlEF+GueWQES35HeSLRvtMOp8E+x8LEFuu67r+SfCTL54pMUrX8MP2dAnK3Irg0Wxby8N7qBBl14L4kVtK4tPY/KsboCr/+lRUiFZaXax+bON+Zn2CRCbacvN+WPE8r7RAzI0w/vF4MdDDd9yT89Q7k9sLsm+fv7Xu0yCgChAmtfL/zQPp66bUCgXky2PgHCS+bQnSTMA42ANk3z7F+sSao/zKdcTKmdDR5i7K0PBoR5gpIecN50pNWPbJsqAWyXMbm+ceV3yqLcey2SJnpZ3yrbowav/dLku8wBJVbG1bFm4KowsbyHfbbKZjmvQhhbm+cZgTnv8drnLfScKqt5miHSvVAKNro4aGV4StjcW7P2et73jLbifMQVvd3RM5UqF/xssn6vGmDMRIl53xIhaxFmwV5DBTrIfsIU1qrYuWHXVFZy1madMHwrad/MXcmFtCbMicpp/xv+eUodkn7irMJlqp2utMmiNcLuYy9RuS/q0NB306jSELJSDOBXhrTwS+IsByVEw/y3Dyum2BBcrPMYfxlVnlWt1zcr2uQYrpeRazFbxpCTBVdLVE3USeVAhZnqWq0MWdyyQhWwnD+TvRE04hn+APHYFEGh9M4Jv0+D1UG7zFw4EgLUAjq5Aa8OSjVNYPZkmHAAig=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11153.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(5023799004)(11063799006)(56012099006)(4143699003)(10067099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?T0JvS0pMTzNmQlc0VTdGSFZtTGZtZkR4SGE3c1BiSkZZQWJNdXdEVDQ2VTZy?=
 =?utf-8?B?RytQeEo5MkVJNVJLd2U1TUJhaVdLYVFQN0huUHZIUE9xaDRISEdVbGtycHJZ?=
 =?utf-8?B?QjZVWDdyUFN3cUxyd3p6L2tBQXVpZEdtVGlkZ1lIKzJKU1hrY2tOOWxJSkMz?=
 =?utf-8?B?bE1YWVdMOU8xWmNyejR2MGp1SmNTWHBkZUNIMHl4QVc4UForMDRJeThHd3FN?=
 =?utf-8?B?clUxODlwN0ZhYUZJclRZMWl6MFRITWhSbkJrdDRTeE9hbU1sbDJucmxiLzVm?=
 =?utf-8?B?ZjI5SXd6dWNscnZNMXVBQU83bk50cjlEWWRJS3ZwbGZGMGRPWFR5TFo0T0pF?=
 =?utf-8?B?WDl1TWswNlF2VTR5UUZOTU96WlVZd21VMnMzTm5LcWZMOU5ldXBhQ2lXTXlD?=
 =?utf-8?B?VFFSQ2FmSGMvZGYyV0c4MkZOOVB0ZWhTSmY3SFAwbWtIWVlZNVpMYVgvNE9l?=
 =?utf-8?B?Wi9oOEVDRHRydGFRL3RqSm1vVElhQlZVaG5mc2tOaXdhVmJvK3c5akJONUZm?=
 =?utf-8?B?b1JCbWNwbEhaWTRJMnR6M1pER2tZdjh5bTY3MXBsZjJZVXA0cnozSDBaNUh4?=
 =?utf-8?B?amtuM0xXVXdqNXNLc3FDSzBMNFJyd3FuSngyTGhQMUNqVWtGRDlDKy9kTWxx?=
 =?utf-8?B?MUFVeFl3WTNwdzJZaFVMUDhiTllaZ0U4YXdORVpTQmxKRGN4bFpocUEvR01o?=
 =?utf-8?B?SnZJZGVWUFVvWmppU2JNVVl1K0N5cS92VU5WZmRDNVNEYnQyVXFVVEhjNDRE?=
 =?utf-8?B?OWFUR0ZYMGpuU2FUNDdyU0JleWViKzQ4YUpGcExDTTFyRzY2amk1NFZERG85?=
 =?utf-8?B?N0oxTTY4TWYrNlZFZk9aNGRPQnJxR3FOQld3b3k0S2VWdWM0M0xyMk81WElv?=
 =?utf-8?B?OFB4SjhSeThCK0pnOWlkSDM3SWFBTENOWUxrMjQ5cHlNOEd6ajBzZ3hRT01z?=
 =?utf-8?B?UVpCZ2VNWVhVVkc5VmNiZXhPTTFKSHhhT25oWFQ1VENJUmVTYWFnNm0yaUJ1?=
 =?utf-8?B?QWRMVzZXdllCcFJOdis3MWo5Wit2Vmx6M3QvRm1ZenAwRGwzUndudVdzQlJ3?=
 =?utf-8?B?ZWx5MnR5cTZ3cnNjQ3ByaVl1U1NITHBWbCtDMkUzc3c1S1g5a2Z3UnhCSUxW?=
 =?utf-8?B?Wk43dVdwUkQvalF0QVlkdEVhQ1RvMHllTm5SNC81OUVYVzVkcEQxNk1ROG9B?=
 =?utf-8?B?NlBhazFVSzFOdmoyQy9nT0dkWXJxWVBWcVNGcEg3RWI3ZHpuclFBWnFVMVd1?=
 =?utf-8?B?NUt1ekVxUkwrR0UyOWJwT2lyaVd4SDFzQUlSQmRCK1Y5WENEUkg1UXd1blFq?=
 =?utf-8?B?amJybzlzYkdyMUorYzVRMHZLUC8vVlZkSDVDdzRlZ3JOQW1IYkJLRzR4YXJ5?=
 =?utf-8?B?cE5vK29tYmtBQVZucVl5a0NNMGlabDhOdzVRelBBK2FQeWxWdFY0SGgxNG1G?=
 =?utf-8?B?YjdyVEtvSFNmRkhDZ2dqT1ZYQU9rcFAzcUxrcjMzZVZyT0hlcmhFSk12RkIv?=
 =?utf-8?B?TFRBdktQRDEyWDVXMUV0S2kzZmF4MXExdjQ0R0tKV2NPNGNLMGJpMzVmbldJ?=
 =?utf-8?B?Ym9MR0doYnk4YnAzaVhEaHg5SVcrY2ZLVCt1aXkyckxEdWdtWnBwcFpOY3pU?=
 =?utf-8?B?ejM1Y1JWZGFFMlpLLytrL0RsVXJ3ZWg5NEZuQmZIL0FqYzVhaWxCN3g4R0lX?=
 =?utf-8?B?YU5sMmRKcncwZENWQy9tenA3cEp4cVE2c1VyUVNuSzNtNjVRNncvcStDTVdC?=
 =?utf-8?B?ZmhtZWZpVlArWUtUTVc1amRWbVNkcGJyU3NiUUZENW9zY3JqVUVxTUZ1OHpC?=
 =?utf-8?B?clhDczdTUGIwd1NFUnZsYktwWm15cjh4azVDckVWTkVtSXcrMS83ZHYrbkNV?=
 =?utf-8?B?ZnFCTTVITXlmbzVxTEJaSllHZXF0eUIya2lwYmZyMy9KOCt4R0c1Q0VUV2pZ?=
 =?utf-8?B?S1ZXRStIN3lhK1VMZ2ZqcjltVVEvbTZ4OUt4M1ZhdlZ1b0VieTd1N01VczBk?=
 =?utf-8?B?TkRtVm1ZeTNIcFo2dVNiN0lxSVBFa2ZuNGlScHV3bmpQd3pKa1ZCcUxFMGVG?=
 =?utf-8?B?ZnRpVW1KYlV1MlBpN2NqMFRWT1Fpd0VocUU4WDA1dDJRSVFFTkVaWURBZXNt?=
 =?utf-8?B?MVREZlZKWkxwTk1HSHhSOWluWTdQODFMMW5CbFl6bitQT1Z4eTR5UndzdGMz?=
 =?utf-8?B?a1Y2Rk1XSVlEV3NTci9NRFBnQ3VtOSs5V2hqZG01Yzh3RENUM3FqYmVmUlhH?=
 =?utf-8?B?ZkdwTGNMREdpcUlPR21Zbld4dHZmNmsrZTc0dUYrL0RMRG1tZUR2WlpINGtS?=
 =?utf-8?B?Vk9wcnJOdjhrUDNOYUpmbmhOdldDUWlhSlhVQytYZWU4MnlrUENvdz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 32379ab8-17c9-40a5-3889-08df12823d5e
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11153.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 17:04:29.5819
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pB0+1FLJvWmuQoxMm2X16U6U/sUlf9n6fC3X+07sAymYN9TFI0Is+G9q6MXwaeBc7Ax2q3NtOtJ0thVkNG9/fWDubtAI+eQHfnXL7UgLbUs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11060
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 14 Sep 2026 17:04:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10500

Hi Antonin,

On 8/27/26 9:46 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Add a script that outputs missing variables from
> OE-Core/meta-yocto/BitBake, i.e. for which grepping returned nothing.
> 
> There are a few exceptions, which are listed in VAR_EXCEPTIONS.
> 
> The script currently returns:
> 
>    ERROR: Variable CVSDIR not found anywhere
>    ERROR: Variable FIT_KERNEL_COMP_ALG_EXTENSION not found anywhere
>    ERROR: Variable USERMOD_PARAMS not found anywhere
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/tools/obsolete-variables | 142 +++++++++++++++++++++++++++++++++
>   1 file changed, 142 insertions(+)
> 
> diff --git a/documentation/tools/obsolete-variables b/documentation/tools/obsolete-variables
> new file mode 100755
> index 000000000..bc97cbb71
> --- /dev/null
> +++ b/documentation/tools/obsolete-variables
> @@ -0,0 +1,142 @@
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
> +import logging
> +import subprocess
> +import sys
> +
> +from pathlib import Path
> +from sphinx.util.inventory import InventoryFile

I would recommend splitting modules that aren't from core Python into a 
separate section. pathlib and typing are python core modules, but 
sphinx.util... isn't.

> +from typing import List
> +
> +
> +DOCS_DIR = Path(__file__).parent.parent
> +# False positives:
> +# - variables we know exist but have a specific syntax
> +# - we keep documentation for it here, already saying it is obsolete
> +VAR_EXCEPTIONS = (
> +    "CONFLICT_IMAGE_FEATURES",
> +    "CONFLICT_TUNE_FEATURES",
> +    "FEATURE_PACKAGES",
> +    "LAYERRECOMMENDS",
> +    "REQUIRED_IMAGE_FEATURES",
> +    "VIRTUAL-RUNTIME",
> +    "module_autoload",
> +    "module_conf",
> +)
> +ERR_MSG = "Variable %s not found in OE-Core, meta-yocto, or BitBake"
> +
> +
> +def parse_arguments() -> argparse.Namespace:
> +    parser = argparse.ArgumentParser(description="Use the Sphinx's inventory to "
> +                                     "check for variables not present in "
> +                                     "OE-Core/meta-yocto/BitBake")
> +
> +    parser.add_argument("--debug",
> +                        action="store_true",
> +                        help="Print debug messages")
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

Consider printing the default values with %(default)s, c.f. 
https://docs.python.org/3/library/argparse.html#help.

> +
> +    parser.add_argument("oecore_dir",
> +                        type=Path,
> +                        help="Path to openembedded-core")
> +
> +    parser.add_argument("meta_yocto_dir",
> +                        type=Path,
> +                        help="Path to meta-yocto")
> +
> +    parser.add_argument("bitbake_dir",
> +                        type=Path,
> +                        help="Path to bitbake")
> +

Please specify those need to be *git* repositories (otherwise you cannot 
run git-grep on them).

> +    return parser.parse_args()
> +
> +
> +def var_exists_in(var: str, gitdir: Path) -> bool:
> +    """
> +    In gitdir, check if a grepping for "<var>" return something (then return
> +    True, False otherwise).
> +
> +    Special case where in OE-Core we can have:
> +        BB_RENAMED_VARIABLES[<var>] = "..."
> +    Then exclude that.
> +    """
> +    cmd = [
> +        "git", "-C", gitdir, "grep", "--extended-regexp", fr"\<{var}\>",
> +    ]
> +    _out = ""
> +    try:
> +        _out = subprocess.check_output(cmd, encoding="utf-8")
> +    except subprocess.CalledProcessError:
> +        pass
> +
> +    out = ""
> +    for line in _out.splitlines():
> +        if not line.startswith(f"BB_RENAMED_VARIABLES[{var}]"):
> +            out += f"{line}\n"
> +
> +    if out:
> +        logging.debug(f"{var} found in {gitdir.name}:\n{out}")
> +        return True
> +

Can't you simplify this to

git grep --extended-regexp -e '\<{var}\>' --and --not -e 
'BB_RENAMED_VARIABLES\[{var}\]'

?

If this works for you, please consider adding --max-count=1 so that it 
exits as soon as possible if there's at least one match. You probably 
also want to pass --quiet as we won't care about the output anymore.

> +    return False
> +
> +
> +def var_exists(var: str, repos: List[Path]):
> +    return any(var_exists_in(var, d) for d in repos)
> +
> +
> +def check_inventory(inv_p: Path, uri: str, repos: List[Path]) -> int:
> +    exit_code = 0
> +    inv = InventoryFile.loads(inv_p.read_bytes(), uri="")
> +    for entry, inv_item in sorted(inv.data["std:term"].items()):
> +        if inv_item.uri.startswith(uri) \
> +                and entry not in VAR_EXCEPTIONS \
> +                and not var_exists(entry, repos):

Typo here, it should be var_exists_in().

> +            exit_code = 1
> +            logging.error(ERR_MSG % entry)

Does it make sense to have a variable (far from where it's used) for 
something that's used only once?

> +    return exit_code
> +
> +
> +def main():
> +    exit_code = 0
> +    args = parse_arguments()
> +
> +    if args.debug:
> +        logging.basicConfig(format="%(levelname)s: %(message)s", level=logging.DEBUG)
> +    else:
> +        logging.basicConfig(format="%(levelname)s: %(message)s")
> +
> +    if not (args.yocto_docs_inv.exists() and args.bitbake_inv.exists()):
> +        logging.error(f"yocto-docs and bitbake inventories not found at {args.yocto_docs_inv}/"
> +                      f"{args.bitbake_inv}. Build the documentation or use the "
> +                      "--yocto-docs-inv/--bitbake-inv options")
> +        sys.exit(1)
> +
> +    exit_code = check_inventory(args.yocto_docs_inv, "ref-manual/variables.html#term-",
> +                                (args.oecore_dir, args.meta_yocto_dir, args.bitbake_dir))
> +

This exit_code is never tested. I'm assuming you may want to do += for 
the next one (or store the result in another variable).

> +    exit_code = check_inventory(args.bitbake_inv, "bitbake-user-manual/bitbake-user-manual-ref-variables.html#term-",
> +                                (args.oecore_dir, args.meta_yocto_dir, args.bitbake_dir))
> +
> +    sys.exit(exit_code)
> +
> +
> +if __name__ == "__main__":
> +    main()
> 
Cheers,
Quentin

