Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E562FFD3762
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 14:10:43 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.63])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45812.1772028636676205308
 for <docs@lists.yoctoproject.org>;
 Wed, 25 Feb 2026 06:10:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Z+Fzx4wi;
 spf=pass (domain: cherry.de, ip: 52.101.66.63, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G5V+8E8AIpaqTcxc3sb4gD42XL13IXWUqLxwcqIsKIk/BcWvQI3ksaFtTn3HrPwL5r8Fq9+RjCNZWm9qJA7Xy/n9cm8eshUZwLhIMazLulhccLxGV94+HgSFq0rg4xZHVcXhtWR8Hj7xAFgGYL+5uqEebuXbvk0ue+IGk2/drf/W3xUfMXlSxfB9UEqk4WUuZRm2AODV1CcVaGGO2fYi9WMB8faNRfq7EBs7bKP3/8WHgYxx2LACwpNvEYe6b0A+67++uEdk9O0fXbVYvlpbDdE48Wnuf9kLC8YiGARc/jGs+JqlVibCSOIknPA5E/6Y6wlrndZKAIaIncJaKc3/BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b7owN5sZYu0qv4z+CEbJeebao5thg0hL5T6eUIMW28k=;
 b=vCm0A42cTKTqL7gUneqacUIG+HCROAyaY+RIhOqQcx1XYThyrQKlMjh+FcPcBd3f1lg1CWmDy0tfUU8KMfwKzDt+OJdEX1ijag3ZJf2bvMYCqQJwV4nz1eXi/MdqVor1OSouj95e+7dNsRewCkz7UhHHuXUtnUQgUAp4+uEufHukpTTIeyaCAMavEJnV0Xaqb/TVVKjmaT6djVKeSijokif5gsF09vkv0MVztqRsSUhtojNHEpJocH3SYkr626SiRhfE7YvAFDEUE0tRTing8pAyW1P6OPZGasdXPx7WPvDLXefDAltLintctrkKO3aPcoU0OnLM2w/C7chiMfBRQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b7owN5sZYu0qv4z+CEbJeebao5thg0hL5T6eUIMW28k=;
 b=Z+Fzx4wiI7aNw4wjCq7kqE6rPfZkvt4j3GcmJ4MNmlygXnExYo3/wp8u6wqtZSb0YJUsPjOMvA3ZKaJWsz4vBT6Gug1OucO4MWmc+VvtNCy9tUc6ZIZeXeFSB0P1OAMtkAdyzVkNlStyc/hD8ojg4kStOQV6grXvPWzOiqOjA4M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by GV1PR04MB10352.eurprd04.prod.outlook.com (2603:10a6:150:1c4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Wed, 25 Feb
 2026 14:10:31 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 14:10:31 +0000
Message-ID: <34206d2c-7f89-45ce-9db2-e363d24e0cb5@cherry.de>
Date: Wed, 25 Feb 2026 15:10:26 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 2/2] Makefile: add a releases.json target
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260225-releases-json-v1-0-fee3f01b9197@bootlin.com>
 <20260225-releases-json-v1-2-fee3f01b9197@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260225-releases-json-v1-2-fee3f01b9197@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR4P281CA0185.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ca::18) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|GV1PR04MB10352:EE_
X-MS-Office365-Filtering-Correlation-Id: 48232d81-c2e7-4319-a0ce-08de7477a283
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	NMCZhpYIxfOZTmGaDeyPIAY9KthlgHHcwwodrb6ztEHarsyoWU/K0TfNSI6xPLTO0+SxX1w3KXVKwX4f1ZEubfCYmN1SLsro3NoIU+R1UlSmQeHFGGlVSop86U2akSEnLRpF0frFJUbXwti25LvMP+ZtDCMKMxjjOHOPoaf1bR2H70vC1xHWpytJVIupJ9byHERHcanHX1rsnFwh3gB0OW+KOIww7yshkv10p5MCKmypy6ArtgZ4V35Jp9I5I7WjaWcGIzNNPXL+7pUgf2wYkGZ8scf+HYPV5EdZHnQxUDb3EFEEbscpY38ANvVNy2Obi7rSF28fm/RTJpyRI3y5NK+go/SZRqH4l1xzahpcS9689btM5aAxageuR5hd/XjqjX9bEBVANyeT+bw54b3eWMhWkPsjuswZCBP/VJb6zxtrRtJOOv8MyJtUkWEzyTIB9nnDxpzZrXCh6DmONSzL/vjOR0RIrWIlqucPesQzfo0XrmyFuZMQRCEAQ3nI9+q9xuSgkcaectDnntcgxOd54F5p7w4kyA88owC59x5lrUJDtnDI1zQBnswNKIQ9fb7vjmGBH7qyaC7Yu1w75Xjq8mWg91kNqMDTNuZa21TGXCJfVVw1DTT+wP+q74vWodPMKhyzVkYkAnFxtw8zbWMDkGiRxLr2sXUmVO5qhG6cSi6rGWtzFn5eWQSskXHwF1lk
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dVRseTZvbVlvc1VqRHdhSHEreUQ4RE5IMXF1T0pmWHMrMFBaSm9QTzNqOTdq?=
 =?utf-8?B?ZWNQNjIvdmRYbVRkVC9tZkdBbW1xRUMzN2FWR3NZNkNZUE02bVhmWU1XNjZJ?=
 =?utf-8?B?Skd2VjFiTFBENUNPVnI0TndNQjgrbGQ4d3ZLUUhqWTYvc1U0d3plaUdFM2dD?=
 =?utf-8?B?Z0FMSnRNMVVlQ1hHYk51ZFJPS3ZyYlMxVURJT1QvWHlTRmpzNW9FQSt2SXo1?=
 =?utf-8?B?VkxScXU3bTBVYTZ2cFdYWEVUakpVYWc3dVY4bHB1TkFWOURQdk9CeXZkVTZQ?=
 =?utf-8?B?elF3NkMzSmZTSXdqdGdDb3I4eXR0TmI5MWJLSlRyb0E5R2ptMjg0TTFZREt3?=
 =?utf-8?B?akxCQkF2WEQ2NXRRSjdLSkw0ME1PSGltY29HZSs1RlkxUkNTSWJsanhqZ0dF?=
 =?utf-8?B?K3ltREoreXlTaDNpUnRFa0tPOGNXVFpFR293ZVRyWmdxUmtJQXR4MW9TQUNN?=
 =?utf-8?B?dDcrMTl0VlB1MHVUOXIxVHR3ajVsWGNIL0J0VXJDd2hlMEZMOFBLWWJGT2I2?=
 =?utf-8?B?Y1pjbWwyY2wyVXc2NFhQSDc5TS9CNTBtRE1LaVpVYXV5VER3eGFac21EbXRi?=
 =?utf-8?B?Y0s5SWxUVlFERVhTMlQ4QmlFZnE3b0ViTUhmZStMNXJnc0ZzbWIrdHl1T2pW?=
 =?utf-8?B?Tkdac3Y4azlZd3dWVStiS1krWElKMFFKaDNwSGRFU2NyUVExZUhTV1BBSU5l?=
 =?utf-8?B?ekRkOThVQWUxcWE2SWxHNXZvamRHWmE2Skc2d2N6T0kyOUo4NWdjTDVxcGxR?=
 =?utf-8?B?RlYrMGxZOUNYY2RoNGhpRW12aldWN3FJODJURWU4WnUzSlZEa3YrWTAxb0R5?=
 =?utf-8?B?Mjc3Z2l5V1l3TTVoazU4dmFUR2F0blg3R1h1YWVjYWxxWXdiY3oyQ1VHby9Z?=
 =?utf-8?B?SnhOTE94MnNzMGh5OHdxM2RFekMrcjJ4VGpjci9penkvbzJZSHdMVVdyTXVF?=
 =?utf-8?B?OWJzQ2IvUzRGNFI4UlNxNktDVFVZOXBzeVZ0RldYU2Z5VEVKUEo1N0hqWjhT?=
 =?utf-8?B?bjhCTWIyc1N0LytWSUg1emhiQjJLOWtyWDArZlJrRU11QXhHeStnWklBVjB1?=
 =?utf-8?B?NkxTYzdQSXJCQzNIL3Z1Qi9BVVpJQnJySmNmd2R6dnZNM1dEeG83TVlDZzQy?=
 =?utf-8?B?d1Z0L0JEY1V6VS9oa0dwbDdJMDc0L1p5c0pHYUs0RUpJbE5BSUtTRGM1ME5B?=
 =?utf-8?B?RGVTckpyRHIyUlhpSXFpMXZPUEtzT2YrajBDNUdoVWNxN2ZrdGYxVVZxcFhk?=
 =?utf-8?B?OHBmZ3VnK2NMQmJrNURDMWxKWlZqK0p6emJZakdtNXdhY0UrVWZXWjdpYyt1?=
 =?utf-8?B?Vi9qMTUrRXNuVXVuRWlLYThuNllseUUwSVNHMGZzZ2JiRkR5Nm04cUJ4L3Vo?=
 =?utf-8?B?OTlYUVpMSkVZaDZENUR2Vmc4MEM1b04zYnMxbkQ5dDJvZk9OSVg0cE14OWFY?=
 =?utf-8?B?Z2lUZXZhWno2YTNNOGgvaW51L0VCb1NZMTJURkpXSnZabzRFT0xuaDlDblFk?=
 =?utf-8?B?dktTTDc2SlZuUWNGZE1mOFVqc0Nmek5GakRSU2xQaVVVNDYwemwwaU5nU3hO?=
 =?utf-8?B?RkY4T2ZaODNyMDZ2aTZPQXFjdURlMWNzQ0tKRU5KS3RQa3U0ZUhiSDZtN2Nt?=
 =?utf-8?B?aVM2TktkWXRrMHpoRE03ZGQwaXp6VGFQdnZFTGNwUmx2NjBOZ3dxaEZydXdO?=
 =?utf-8?B?VVA2cVh2Zlg3UGdjNFA4UTgwNzAvMGdNc1NkdG11YzV6TEphYVY3MTZMNDF1?=
 =?utf-8?B?Q05GZWRlQlhGbHFWNklJMFZIVEx5RVp0alNBaGFuMWtTVGZlVDRLVmcrcTdC?=
 =?utf-8?B?V3NLWGpHcmc5cHpzTFZwbGR4a0Eva1dUYkZ4SGVKdVNBQ2d3QldDVDZkUGtH?=
 =?utf-8?B?bjQrdlhVeVBUd2VFMDcxVnczUktpcVkzdFByeGJvZkF1YUxYZmZncExsYWQw?=
 =?utf-8?B?c0tzYVhHdFB5d0ljZThHNEpiWmNlWnEwRy9qMS9sTzMvOVJXb0dISDlScHJ6?=
 =?utf-8?B?bDJlRHJ1RDFEM2pyY1MrS3haSlNGUHJ6RGlNRzBJYW9vSGRRTFRCUlpOR09z?=
 =?utf-8?B?aGNCb3haa0FzdDQ0WGNNV2J6c1o2N2ZKUGQ5aTFuZjVwUnd4R1ltUy9mVTV2?=
 =?utf-8?B?b0JwNzJOOFRPbFA1VnZrZERPZCtzbGxqK2JnMDdkbUU2VGdoOUJSVEx0TzVq?=
 =?utf-8?B?RnZPd2V6U2laSkFwazd6c05RQmJwdlBwdjZIWSttUzFsOG1uTHkwS1RFVnp1?=
 =?utf-8?B?c2JoYUlYRFo2Um1nQmxHTHVJd1RFeEVNOTlGT1VOZjI2S3JlREgvc1FRd0li?=
 =?utf-8?B?dWp6c3cyNVJML1V1MFhuZzdSNndDWVkvNHFDRW12Um5rMWlTY1Bodz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 48232d81-c2e7-4319-a0ce-08de7477a283
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 14:10:31.0871
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q7Jv+xU4CK1aiVN8IwNWVewYM7PLXqtR0bL1hgUy1rBXKBu95oOTNOpuZDYfUubEzUmzBCIS+envCHrLb1OpygPPC6bnfWFL07aQHcROqUo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10352
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 25 Feb 2026 14:10:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8990

Hi Antonin,

Please provide context, what is this helping with?

On 2/25/26 1:06 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Add a new releases.json target which can be used to update the
> releases.json file manually. It is called from the publish target only
> (which is the one used on the Autobuilder).
> 
> A warning is printed when the file is not up-to-date anymore.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/Makefile                                      | 9 +++++++--
>   documentation/tools/host_packages_scripts/almalinux_docs.sh | 2 +-
>   documentation/tools/host_packages_scripts/fedora_docs.sh    | 2 +-
>   documentation/tools/host_packages_scripts/opensuse_docs.sh  | 2 +-
>   documentation/tools/host_packages_scripts/ubuntu_docs.sh    | 2 +-
>   5 files changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/documentation/Makefile b/documentation/Makefile
> index e144a50b4..00c7d957d 100644
> --- a/documentation/Makefile
> +++ b/documentation/Makefile
> @@ -24,9 +24,9 @@ endif
>   help:
>   	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
>   
> -.PHONY: all checks help Makefile clean stylecheck publish epub latexpdf
> +.PHONY: all checks help Makefile clean stylecheck publish epub latexpdf releases.json
>   
> -publish: Makefile checks epub latexpdf html singlehtml
> +publish: releases.json Makefile checks epub latexpdf html singlehtml
>   	rm -rf $(BUILDDIR)/$(DESTDIR)/
>   	mkdir -p $(BUILDDIR)/$(DESTDIR)/
>   	cp -r $(BUILDDIR)/html/* $(BUILDDIR)/$(DESTDIR)/
> @@ -73,6 +73,11 @@ latexpdf: $(PDFs)
>   	$(SOURCEDIR)/set_versions.py
>   	buf_size=10000000 $(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
>   
> +releases.json:
> +	command -v curl jq || echo "curl and jq need to be installed for this target"
> +	curl https://dashboard.yoctoproject.org/releases.json | jq --indent 2 >$(SOURCEDIR)/releases.json

Do we really need jq? What is this bringing? It won't be human-consumed 
anyway, so who cares for the indent?

Why do we need to download the file during the publish state? Cannot we 
make the autobuilder download the file and put it in the right place? 
This will also avoid the case where the file gets changed while the 
autobuilder builds one earlier release and the latest one.

Cheers,
Quentin

