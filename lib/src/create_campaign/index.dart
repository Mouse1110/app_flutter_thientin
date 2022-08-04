import 'package:flutter/material.dart';

import 'screens/create_campaign_image/index.dart';
import 'screens/create_campaign_page/index.dart';

class CreateCampaign extends StatefulWidget {
  const CreateCampaign({super.key});

  @override
  State<CreateCampaign> createState() => _CreateCampaignState();
}

class _CreateCampaignState extends State<CreateCampaign> {
  @override
  Widget build(BuildContext context) {
    return CampaignImagePage();
  }
}
