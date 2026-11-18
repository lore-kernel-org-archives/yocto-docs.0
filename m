Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.6])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.887.1795020082417224440
 for <docs@lists.yoctoproject.org>;
 Wed, 18 Nov 2026 08:41:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=bSxDCiBg;
 spf=pass (domain: cherry.de, ip: 52.101.65.6, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sdY5CHIuBNz75YwwKSX60jISa8ivHoiulAzAWUn1qf/8OX7tmyN5MB4UejikJ3YB9OzwNwOQohM0eWhkBCvEhTZo4yHJXJzwtxQI3p+ac1RneQ92+pv0w8cz9zg8E1rH74OW2kN2LZ8KQiqYdHwmrbT5hVyRBnmBeIYWH1o7bCoDe0ZNfulGh+/Pz7L49Jaw1nCLIQwdtpJEu+8AGgJa5LnUXbQUdFoLXpzwQkNCmMXCl8hb3qeWbYNFDmv6yqnIkq8eB1A+3HWLq5vlQGNT1BWA9AMozVuEne01vZ6fWsdqDIuboHg3PvooOm/AcNV3+oczXCl81lObygXg9FJBKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zrFAVoPFK9v30uZygtfeX+hWn8iyrUY6Ymzhq6DicJg=;
 b=oFvDtGEo8xVvpGZ0vdQaJs7oMbhYa6oCMpxrD9wMp27mDOqMXVMsVOksUEgvY1U3ynulJlCg5oPaDIVX6ubfIkIeQcIpEril7xT/AObHfLXx06zO1T/merYp/1O4xpDGCkN/YwZ1pi1uuIZ2Pvq1X/XhK0etdXkTqVyEjeLqb5dtLJEU8M0u3TqAeJJmdDJOCYwQPh8m8nxMK7HwLv3ZTsWVMF1EP+TDA/X4fQTWWEs31YN1xUkErZTfeHj9S9dNvcuH6AS4urqY1TM46laVTAjdT9+OjvkEnHQWbq++FERpnWmlwQfpMptTU2gQg5fI55O3ucQHS/Ma7ofoQMZLxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zrFAVoPFK9v30uZygtfeX+hWn8iyrUY6Ymzhq6DicJg=;
 b=bSxDCiBgpfrlEWMGi4wkfF/u+oKhqiV56yD3nLAQnRqHIytm7M1nYH3tvuGV+5SGY1y1ZPjx1AZhPXvquAXaaEOgdjWAoplHZF0aFPrFCPQfW+wof9jP1alpBWLkvhswM7M2vn90J+cML9EUZM7nZShynqRF5VnDEz1Qzv2EaJU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com (2603:10a6:102:4ab::7)
 by GV2PR04MB12340.eurprd04.prod.outlook.com (2603:10a6:150:308::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 16:41:15 +0000
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d]) by PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d%5]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 16:41:14 +0000
Message-ID: <2d2c4cd8-df3d-46a0-a6ff-6b15b3491802@cherry.de>
Date: Wed, 18 Nov 2026 17:41:13 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 1/3] tools/gen-releases-svg: add script
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20261022-mermaid-release-diagram-v1-0-3351b5799dd9@bootlin.com>
 <20261022-mermaid-release-diagram-v1-1-3351b5799dd9@bootlin.com>
 <bef9eadf-6fa6-4ddf-8fac-508e6593e80d@cherry.de>
 <DMYH5TW61WRN.200Z8HFGKA2IL@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <DMYH5TW61WRN.200Z8HFGKA2IL@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: VI1PR09CA0157.eurprd09.prod.outlook.com
 (2603:10a6:800:120::11) To PA3PR04MB11153.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::7)
Return-Path: quentin.schulz@cherry.de
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3PR04MB11153:EE_|GV2PR04MB12340:EE_
X-MS-Office365-Filtering-Correlation-Id: 92b20013-13e1-4d84-8b76-08df4592c259
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|6133799003|22082099003|18002099003|261009223027099003|4133799003|3023799007|13003099007|56012099006|11063799006|10067099003|261026140227099003|4143699003|261021133027099003|261102123227099003|261021123027099003|261026135527099003|261026121527099003|261022075727099003|261026130827099003|261021130227099003|261021135927099003|261022115727099003|261028144727099003|261022105027099003|261022113327099003|261021121427099003;
X-Microsoft-Antispam-Message-Info: yRN+AFxspWIo5hVu0Zf40rTiXxMZd+160leUqCFQHFBuW38noQOf4jL+YyNO5YDoSBJfTBJa73qNKvddCvon6g3UqksUzZSa5whlIGFrpFOIDq6Bq75z8RACH0V23f5LUVf50UhuWWTXD2gQqicp9LpGeiCRQ+oToX/gLtyiR6n0zpkHrZq9RTOc1rQKlYvXOyh2F2Y90iyCkTURrOB6IwtXqeqF27+JbXATuEQPO6+9SJgmTOwFWR9jlT1aTkHBeXGJV/sBi8BH469UWYqzgXB/9hSRm6OWfWZmqih+Q2wjCdUQF8fI67P4dP3+XgxyZcxEAOLfUGlbrLyAc84GIqWXttHbgNAzaA3TmFCJV8gsViGvGv5vJYvnQqMieC16/UJCs1vvtH+jHdkZOhn+ekUOunMaXjZA4RX7IsW+t8X4z3B4aBhyM/s0Jzle20XTZVkHZc+OGYCx5vL8UqKwmf5THbpeCsfo0RoORlRDHDwVNTouffarwFsEKI3nbnK7ts1jPoB7UoS9onSGx35vICMbuGukxZ85E6xusYBThZ3p/+7BN6w76T7joEGjJPwq8j1WHOP+NGUnhDcXYcwHx6VVQKcbXTg2Ns0edebUyV95JFX3/RlKLgmzwQi73uat
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11153.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(6133799003)(22082099003)(18002099003)(261009223027099003)(4133799003)(3023799007)(13003099007)(56012099006)(11063799006)(10067099003)(261026140227099003)(4143699003)(261021133027099003)(261102123227099003)(261021123027099003)(261026135527099003)(261026121527099003)(261022075727099003)(261026130827099003)(261021130227099003)(261021135927099003)(261022115727099003)(261028144727099003)(261022105027099003)(261022113327099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vk92RWxEN3U3Z3FMWXdiVnF6TENyeXJTTFFFZWI3K2hhUVlVZkxkVTdDaFVj?=
 =?utf-8?B?RmYvVTVDY0N3Y05jamJ2OStaYjNWMTVueDRpM3dyQ0xrT3RBb29ZSzRIbS9C?=
 =?utf-8?B?Q1E2VVB2WGJjMkplKzhnREp0QithVEVRNmhIdzM1WkNXeTljS2pkbm4wNjdV?=
 =?utf-8?B?M2dQK3AwOWdNQThab05nZGoyTWozcHd6UTVwTHkvTGpwNExKQ0h1YURud1JO?=
 =?utf-8?B?dURWUVVKd05SU0RjeVU5NitJdU1laFhtWUpURDJIRkI3NDBEWDZ5NlNzUFdm?=
 =?utf-8?B?L2RFUWZRT1ZJZ0NrTm5VK2hMR1VDMTBlWDBubHZrbk5NR1QvaENKbHJSREZL?=
 =?utf-8?B?L3VjZ05lalhRTFhiNERhejNmcXdEVlRKZmY0U1c1ZXRJZllHR3RWcEQzaGt1?=
 =?utf-8?B?VzdrbEkwNm5yT1NaY3ZxTmphZFJxaFR4VGgxUm1qbU1Gekd0cldiMjg4a1ZB?=
 =?utf-8?B?b0NnZUpNQXdJaFdKOFM3OHRnQ2NMSWxDSjdiaDZLaXpRQUFHSVBxQTY0dHBR?=
 =?utf-8?B?ZmJmNmROZVZhSjV4WkpmQ3YwYXhsZ0p1YjhsNmJVVk9wNUdwelUwQnBpNm5q?=
 =?utf-8?B?V0hEZElFN0w4Ty8yVU5OdTEvSk1lcDBaU0ZEaFZ6WHJIMmx1UGFSRkJySWZW?=
 =?utf-8?B?OHZicXFXdnA3Yk9hdlAveFVOemJYdlorWjlvamowbFYvbTlvM2tVVFVJVHVH?=
 =?utf-8?B?YnRGOHAxdFF6VW1FeUxuYWF1SjYrdHUzTGhuVHJWeWFvdVpnamg0WVFveXVC?=
 =?utf-8?B?eU9Yb29vZHIydTdJYTU0UDFsWUNoek5OZ3UyeVdJbGc1RVAxeHQ1TDZmOVh2?=
 =?utf-8?B?aTdPMmQ3aVJFMWJxbnNGaHFFZUJMeWtJV0hoaG40TjRhZTNYeklnV3ZaczI0?=
 =?utf-8?B?T29ZQnNPVURqcjIzR0E5enJXNVI2eC83R0hvdmN4YllDRE5pL3U3NElTOVBu?=
 =?utf-8?B?LzVNMmtDaUk0dXJ1d3pMdnIrUXBmQzRYYWdienhtT25XbERBZlcrNXZxVnFD?=
 =?utf-8?B?azVvcHpxMFNDKzUrRFQ3UmZkeG9GZkZxdVY2SG93dXJBcER0Z2d0WnY0RENR?=
 =?utf-8?B?blNUUnFNZi9CQ1RqU2RpazY5bVFZRCt1L3Yvc2IzT1FPaFdIQVFiSnArWW43?=
 =?utf-8?B?ZXFmcXpueUFha2d4NGtEYzU5dnJ2RFI2bVVhano2QkZuKzhuR20wMlIvNS9X?=
 =?utf-8?B?dFlIWEJJaGJ3c3poY0Q0bTlrVW9ueCtIK20zOWtXTlRCQlRqRnlqRE5iZ0dZ?=
 =?utf-8?B?SUJLdFQ1ZFBjQVlqUWJYeDBHU1YrU1liQUF0UzczYWsrQURoUzBIdkp5eFBM?=
 =?utf-8?B?ZnZ4UkFaNU1peG5UdjU5a2JBZDA1cTA3Y2NUN3BHRXhaVzBFbkVubmg5Rk1F?=
 =?utf-8?B?SUFUTzRITmJQa0N6SURMb3NCbjhmclkvcmJPdWdIYTMreGdJZDhFLzlwOHhS?=
 =?utf-8?B?czQ2M3h4UjZoRUp3MkgrbmNqNGVOeW5wWlJGT0ZLa044dmxDU3dqRDVuVm9J?=
 =?utf-8?B?OFFaTEhrTmVma3Q5UC9FZm5rY051dXBmZ2NiUVdKN0JudGhhcGVFT2pkQ0pr?=
 =?utf-8?B?YVFEbmhCV0R4TjVTRDZpYzRCaUxySmJ4bEZXM1hybWFrZGN1eDZwdHZQY0pF?=
 =?utf-8?B?bEpNZWFRUFZlNGVKMS9TaHdqeXVWSHFBdmVncG1IdzhzWHEvK3BNTDVGL1pa?=
 =?utf-8?B?NTgyNEN1VXJJdEhGK3ZBSnJ5UkRTVVhZNjdqWC96RmpQOGtNWXorYXQzaE9o?=
 =?utf-8?B?RVFTRkhTY3ZQUHVwa2M4b2dVcVEyYmx2MFJ0UlFjeFlXK3hhenpBbWdtdFZ3?=
 =?utf-8?B?VnEvZTAvQlk1QVhJMGtvSDVkNjNsR1FZcmd0SER4QmhYNVlGeEFkNFl0aXQx?=
 =?utf-8?B?RUNoVndUSmhqTVlIZ0Q4ZzllK1l4THdFTGZHT0dQOXJ6bmMvaGdBL1pDRm1O?=
 =?utf-8?B?TGNvdDhpL0ZUOHAvNGZMUVZvcUFVLzdva0dkdFlSc2hyVVgyMHlJSmVLQTVw?=
 =?utf-8?B?THNCOUd5QnUybGd3NU9FdEFEV04zUTQzN3JBQnRKOUd3QTdOVEtVQ2gzL3FE?=
 =?utf-8?B?OThsR2F3ZC95Y0xQU240WGR5eW1Ea2phM1g2dFFNUUJQWHk5czVXaGFqelBM?=
 =?utf-8?B?V2J0U2h6Tjk0bnkxMEtMNEVCcXpCMmZIOWlOUnRwZTVmWWhuSkdrNUMvSG9O?=
 =?utf-8?B?cWJxb3NZNDF2MWMvUDE5a1FpQkVhbW9aK1A0aUEvWTN3TFRPMzZQNmp1MWZS?=
 =?utf-8?B?YWk0aGpXR0dDSXIrVm93Z1c1aFN6bmNKUGxKTzRySzByMHpScGpEUlhWUTJq?=
 =?utf-8?B?eWtReThSUHkzL2JSNEcwTXNXbnNHQklwTW1VZ1AzTG10YXVwVmpFdz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 92b20013-13e1-4d84-8b76-08df4592c259
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11153.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 16:41:13.9630
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B3xvKxJqJe4zyXfXM0zgY0fl2mkg9BUuUc18d32wjzPvebjrFrbiKCoNIFYEDGqaPfnZKz40bUDn7bbZ4Gh1EHVc21dNMNoB2YMUE4Ucemk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12340
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Wed, 18 Nov 2026 16:41:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10792

Hi Antonin,

On 11/18/26 5:24 PM, Antonin Godard wrote:
> Hi,
> 
> On Mon Nov 9, 2026 at 2:20 PM CET, Quentin Schulz wrote:
>> Hi Antonin,
>>
>> On 10/22/26 3:37 PM, Antonin Godard via lists.yoctoproject.org wrote:
>>> Add a script that can be used to generate the releases.svg diagram by
>>> parsing the releases.json file available at
>>> https://dashboard.yoctoproject.org/releases.json.
>>>
>>> This should be done periodically when new releases come out.
>>>
>>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>>> ---
>>>    documentation/tools/gen-releases-svg | 95 ++++++++++++++++++++++++++++++++++++
>>>    1 file changed, 95 insertions(+)
>>>
>>> diff --git a/documentation/tools/gen-releases-svg b/documentation/tools/gen-releases-svg
>>> new file mode 100755
>>> index 000000000..e091c02de
>>> --- /dev/null
>>> +++ b/documentation/tools/gen-releases-svg
>>> @@ -0,0 +1,95 @@
>>> +#!/usr/bin/env python3
>>> +#
>>> +# Parse releases.json (from https://dashboard.yoctoproject.org/releases.json)
>>> +# and output a Gantt diagram that shows the state of releases.
>>> +#
>>> +# Copyright (c) Antonin Godard
>>> +#
>>> +# SPDX-License-Identifier: MIT
>>> +#
>>> +
>>> +import argparse
>>> +import datetime
>>> +import json
>>> +import shutil
>>> +import subprocess
>>> +import sys
>>> +import tempfile
>>> +
>>> +from pathlib import Path
>>> +
>>> +parser = argparse.ArgumentParser(
>>> +    description="Parse releases.json and output a releases.svg file"
>>> +)
>>> +parser.add_argument("-i", help="Path to the releases.json file", dest="releases_json_path",
>>> +                    default=Path(__file__).resolve().parent.parent / "releases.json")
>>> +parser.add_argument("-o", help="Path to the output SVG", dest="output",
>>> +                    default=Path(__file__).resolve().parent.parent / "ref-manual/svg/releases.svg")
>>
>> issue: missing required=True
> 
> Both options have a default value, the script can be called without passing
> those, so I don't think we need 'required' here?
> 

Ah, makes sense. Brain fart :)

suggestion: maybe have a variable to store the result of 
Path(__file__).resolve().parent.parent so that it's easier to read and 
we know what it refers to (documentation/ directory at the root of the repo)

>> Your script will happily be called without arguments and will fail later
>> on, c.f. https://docs.python.org/3/library/argparse.html#required. I
>> recommend to either replace -i/-o with RELEASES_JSON/OUTPUT to highlight
>> they aren't optional options, or add required=True to highlight the
>> flags aren't optional.
>>
>>> +args = parser.parse_args()
>>> +
>>> +if not shutil.which("mmdc"):
>>> +    sys.exit("mermaid-cli is required for this script to run")
>>> +
>>> +MMD_HEADER = """---
>>> +config:
>>> +  fontFamily: '"Nimbus Sans", Helvetica, Arial, sans-serif'
>>> +  gantt:
>>> +    leftPadding: 5
>>> +    useWidth: 1600
>>> +    useMaxWidth: false
>>> +  themeVariables:
>>> +      activeTaskBkgColor: '#edf5f9'
>>> +      activeTaskBorderColor: '#00557d'
>>> +      sectionBkgColor: '#eff6f9'
>>> +      sectionBkgColor2: '#eff6f9'
>>> +---
>>> +%% Generated with documentation/tools/gen-releases-mmd
>>> +gantt
>>> +    dateFormat YYYY-MM-DD
>>> +    axisFormat %b %Y
>>> +    tickInterval 6month
>>> +    todayMarker off
>>> +"""
>>> +
>>> +with open(args.releases_json_path, "r") as f:
>>> +    releases_from_json = json.load(f)
>>> +
>>> +with tempfile.TemporaryDirectory() as tmpdir:
>>> +    mmdpath = Path(tmpdir) / "diagram.mmd"
>>> +    with open(mmdpath, "w", encoding="utf-8") as mmd:
>>
>> suggestion: replace the above three line with tempfile.NamedTemporaryFile?
>>
>> I don't think we care about the filename of file passed to mmdc? c.f.
>> https://docs.python.org/3/library/tempfile.html#tempfile.NamedTemporaryFile
> 
> The thing is we need to have this file flushed/closed before we passed its path
> to mmdc, which is why I think using a temp directory here makes sense
> 

.flush() is your friend, but you also don't do anything specific related 
to that in the current code so you'd likely have the same issue? I also 
doubt we need to close the file before it's passed to mmdc.

>>> +        mmd.write(MMD_HEADER)
>>> +
>>> +        first_active_rel_found = False
>>> +        for release in releases_from_json:
>>> +            codename = release["release_codename"]
>>> +            series_version = release["series_version"]
>>> +            if release["status"] == "Active Development":
>>> +                mmd.write(f"    {codename} {series_version} :done, after current_rel, 6M\n")
>>> +                continue
>>> +            if not release["original_release_date"]:
>>> +                continue
>>> +            original_release_date = datetime.datetime.strptime(release["original_release_date"], "%Y-%m-%dT%H:%M:%S%z")
>>> +            if original_release_date < datetime.datetime(2022, 4, 1, tzinfo=datetime.timezone.utc):
>>
>> You don't explain why this date specifically. Looking at the diagram
>> currently on
>> https://docs.yoctoproject.org/ref-manual/release-process.html#long-term-support-releases
>> we have everything since kirkstone, do we want to keep all the older and
>> unmaintained releases forever in this graph or should we only keep the
>> oldest currently supported release and everything in between until
>> today? i.e. Scarthgap, Styhead, etc..., til Garburn?
> 
> I used this date to mimic the previous diagram which started from Kirkstone. But
> it's true it might makes more sense to start from the oldest supported release,
> hence Scarthgap as of writing.
> 

OK, that's fine, just say so in a comment/commit log. I think it's 
actually better to have a script reproduce the same kind of graph and 
only then adapt it. So in a later commit we can adapt so the graph is 
dynamically generated.

Cheers,
Quentin
