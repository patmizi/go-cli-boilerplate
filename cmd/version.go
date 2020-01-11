package cmd

import (
	"fmt"
	"github.com/spf13/cobra"
	"github.com/spf13/viper"
)

func init() {
	rootCmd.AddCommand(versionCmd)
}

var versionCmd = &cobra.Command{
	Use:   "version",
	Short: "Prints the version number of this cli tool",
	Long:  "The version number is stored in a config file, loaded by viper. This command will print that version number out",
	Run: func(cmd *cobra.Command, args []string) {
		fmt.Printf("go-cli-boilerplate version: %s \n", viper.GetString("version"))
	},
}
